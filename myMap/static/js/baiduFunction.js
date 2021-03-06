function setStyle() {
    var r = document.getElementById("styleList");
    for (var i in examples) {
        r.options.add(new Option(i,i))
       
    }
}
//加载地图组件,配置地图
function initMap() {
    window.map = new BMap.Map("l-map", { enableMapClick: false });
    geolocationControl.location()//自动定位
    map.centerAndZoom(init_point, init_class);
    map.enableInertialDragging();
    map.enableKeyboard();
    map.enableScrollWheelZoom();
    map.enableContinuousZoom();
    map.addControl(geolocationControl);
    map.addControl(cityListControl);
    map.addControl(mapTypeControl);
    map.addControl(overviewMapControl);
    map.addControl(navigationControl);
    map.addEventListener("dragend", showPlace);
}
//showPlace
function showPlace(names) {
    map.clearOverlays();
    c = 0//搜索结果重置为0
    if (typeof names == "object" && !(names instanceof Array)) { //地图转换城市后,names会变成一个对象,搜索出错,主动赋值
        console.log("names又出错了!");
        names = names_backups; //检索基础关键字
    }
    sum_places = new Array();//清空;让sum_places只存当前搜索结果
    var mPoint = map.getCenter();
    bounds = map.getBounds(); //获取可视区域
    var local = new BMap.LocalSearch(map, { renderOptions: { map: map, autoViewport: false } });
    local.setSearchCompleteCallback(searchComplete);
    local.setMarkersSetCallback(markersSet);
    AddRunningDiv();//显示数据正在搜索中........
    local.searchInBounds(names, map.getBounds());
}
function markersSet(rs) {

    for (let i in rs) {
        point = rs[i].point;
        point_str = point.lng + "," + point.lat
        if (sum_places[point_str] == null) {
            sum_places[point_str] = rs[i]
        }
    }

    console.log("markersSet后返回数据了**********************")
    count = Object.keys(sum_places).length;
    setCount(count);
    console.log("sum_places： ", sum_places);
    setAfterSearchOverlays();
}
function searchComplete(rs) {
    console.log("searchComplete 搜索成功")
}

function setAfterSearchOverlays() {
    MoveRunningDiv();
    map.clearOverlays();
    var current_mk = getCurrentMarker(currentPoint);
    map.addOverlay(current_mk);//加上当前定位
    conditions = new Array() //新的一页，清空上次的数据
    for (var i in sum_places) {
        coordinates = i.split(",");
        var point = new BMap.Point(coordinates[0], coordinates[1]);
        setAfterSearchOverlaysByPoint(point, i);

    }

}
var $$ = function (id) {
    return document.getElementById(id);
}
function priceChange() {

    var btnSelect = $$("btn_select");
    var oSelect = btnSelect.getElementsByTagName("select")[0];
    var max = oSelect.options.length;
    var index = oSelect.selectedIndex;
    var text = oSelect.options[index].text;
    var low = 0, high = 100000000;
    setCurSelect(text);
    if (text == "全部") {
        low = low;
        high = high;
       
    } else if (index == 1) {
        high = text.replace(/[^0-9]/ig, "");
    } else if (index == max - 1) {
        low = text.replace(/[^0-9]/ig, "");
    } else {
        p = text.split("-")
        low = parseInt(p[0]);
        high = parseInt(p[1]);
    }
    
    setSearchOverlaysByPrice(low, high)
}

function setCurSelect(str){
    $('#cur-select').html(str)
}

function setSearchOverlaysByPrice(low, high) {
    map.clearOverlays();
    c = 0//搜索结果重置为0
    for (let i in conditions) {
        var r = conditions[i]
        price = r.detail_info.price
        price = parseInt(typeof price == "undefined" ? 0 : price)

        if (price >= low && price <= high) {

            var point = transStringToPoint(i)
            setAfterSearchOverlaysByPoint(point,i)
        }
    }

    setCount(c)

}

function setConditions(point_str, mes) {
    if (!(point_str in conditions.keys())) {
        conditions[point_str] = mes 
    }
}

function setAfterSearchOverlaysByPoint(p, s) {
    var point_str = transPointToString(p);
    var mes = getDetailsByPoint_str(point_str);
    if (mes == false) {
        return false;//出现错误 不处理
    }
    if (typeof mes.price == "undefined") {
        mes.price = 0
    }
    setConditions(s, mes.condition)
     var htm = "<div class=\"posit\" style=\"user-select: none; left: -8px; top: -8px;\"><div>\
    <span class=\"posit_index\">"+ mes.index + "</span>\
    <p class=\"posit_tit\">"+ mes.name + "\
        <span>¥\
            <em>"+ mes.price + "</em>\
        </span>\
    </p>\
    </div>";
    var mk=new BMap.Marker(p)
    var label=new BMap.Label()
    label.setContent(htm)
    mk.setLabel(label)
    map.addOverlay(mk);
    mk.addEventListener("mouseover", function () {
    });
    mk.addEventListener("mouseout", function () {
    });

    mk.addEventListener("click", function () {
        map.openInfoWindow(showInfoByWindow(point_str), p);
    })

}

function showNearby(name){
    clearNearbyOverlays();
    var mPoint = map.getCenter();
    bounds = map.getBounds(); //获取可视区域
    var local = new BMap.LocalSearch(map, { renderOptions: { map: map, autoViewport: false } });
    AddRunningDiv();//显示数据正在搜索中........
    local.searchInBounds(name, map.getBounds());
    local.setMarkersSetCallback(nearbyMarkersSet);
}


function clearNearbyOverlays(){
    len=nearby_markers.length
    if (len>0){
        for (var i=0;i<len;i++){
            map.removeOverlay(nearby_markers[i]);
        }
        
        nearby_markers=new Array();//重置
    }
}

function nearbyMarkersSet(rs){
    MoveRunningDiv();
    count = Object.keys(rs).length;
    setCount(count);
    for (let i in rs){
        var result=rs[i]
        var p=result.point;
        var marker=result.marker
        var title=result.title
        marker.setTitle(title);
        map.addOverlay(marker)
        nearby_markers.push(marker);
    }
}

function getDetailsByUid(uid) {
    var data;
    $.ajax({
        type: "get",
        url: "/get_details_by_uid",
        data: { "uid": uid },
        async: false,
        dataType: "json",
        success: function (response) {
            if (typeof response.result == "undefined") {
                data = JSON.parse(response.data)
            } else {
                data = response.result
            }
        }
    });
    return data;
}
function transPointToString(p) {
    return p.lng + "," + p.lat;
}

function transStringToPoint(str) {
    var p = str.split(",");
    return new BMap.Point(p[0], p[1]);
}
function setCount(num) {
    $("#count").html(num)
}

//开始定位
//先不删
// function setCurrentLocation() {
//     var geolocation = new BMap.Geolocation();
//     geolocation.getCurrentPosition(function (r) {
//         if (this.getStatus() == BMAP_STATUS_SUCCESS) {
//             var mk = getCurrentMarker(r.point)
//             currentPoint = r.point;
//             map.addOverlay(mk);
//             map.panTo(r.point);
//         }
//         else {
//             alert('failed' + this.getStatus());
//         }
//     }, { enableHighAccuracy: true })
// }

//

function getCurrentMarker(point) {
    var mk = new BMap.Marker(point);
    var gif_url = current_gif
    var myIcon = new BMap.Icon(gif_url, new BMap.Size(32, 32));
    mk.setIcon(myIcon);
    mk.enableDragging();
    return mk;
}

function showInfoByWindow(point_str) {
    var main = getWindowHtml(point_str)
    var title = main.title, content = main.content;
    var opts = {
        // width: 365,     // 信息窗口宽度
        // height: 300,     // 信息窗口高度
        title: title,// 信息窗口标题
    }
    var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象
    return infoWindow;
}


function getWindowHtml(point_str) {
    var info = sum_places[point_str];
    var point=transStringToPoint(point_str);
    var uid = info.uid
    var mes = getDetailsByUid(uid);
    var detail_info = mes.detail_info;
    var flag=DangerOrSuccess(point_str);//css标识是否加入对比
    var distance=getDistance(currentPoint,point)//公里
    var html = "<a style='line-height:30px' id='a' target='_blank'  href='" + detail_info.detail_url + "' >   \
<div id='windowInfo'><div title='酒店设施("+ detail_info.hotel_facility + ")------>\
室内设施("+ detail_info.inner_facility + ")------->\
酒店服务("+ detail_info.hotel_service + ")'\
id='hotel_img'><img  width='340' height='160' src='"+ mes.img_url + "'>\
            </div><br><p><i class=' fa  fa-bank' style='color:springgreen'></i> 地址:"+ mes.address + "</p>\
            <p><i class=' fa fa-phone' style='color:blue'></i> 电话:"+ mes.telephone + "</p>\
    <p style='color:orange'> <i class=' fa fa-star' style='color:goldenrod'></i> 卫生评分:"+ detail_info.hygiene_rating + "--服务评分:" + detail_info.service_rating + "---设施评分:" + detail_info.facility_rating + "</p><p>距离起点<a href='javascript:void(0);' style='color:red'>"+" </a>距离\
    "+distance+" 公里</p></a>\
    <span id='compareBox' class='btn "+flag["class"]+"' onclick='hotelsCompare()' style='text-align:center' value='"+point_str+"'>"+flag["tip"]+"</span> <span id='comeHere' class='btn btn-primary' value='"+point_str+"' onclick='comeHere()'>到这里</span></div>"
    var main = { "content": html, "title": "<i class='fa fa-2x fa-home' style='color:orange'></i>" + mes.name + "(" + detail_info.level + "--" + detail_info.overall_rating + "分)" }
    return main
}

// 返回undefined 错误
// function getAddressByPoint(point){
//     try {
//         geoc.getLocation(point, function(rs){
//             var addComp = rs.addressComponents;
//             return (addComp.province + "" + addComp.city + "" + addComp.district + "" + addComp.street + "" + addComp.streetNumber);
//         }); 
//     } catch (error) {
//         return ' 未知 ';
//     } 
// }

function DangerOrSuccess(point_str){
    if (point_str in compare_boxes){
        return {"class":"btn-success","tip":"已加入对比箱"};
    }else{
        return {"class":"btn-danger","tip":"未加入对比箱"};
    }
}

function getCarTimeAndDistance(point_str){
    endPoint=transStringToPoint(point_str);
    var car=new Array();
    var searchComplete = function (results){
		if (transit.getStatus() != BMAP_STATUS_SUCCESS){
			return ;
		}
        var plan = results.getPlan(0);
        car['time']= plan.getDuration(true);
        car['distance']=plan.getDistance(true);
        return car;
	}
	var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
		onSearchComplete: searchComplete,
	// 	onPolylinesSet: function(){        
	// 		setTimeout(function(){alert(output)},"1000");
    // }
});
	transit.search(currentPoint,endPoint);
}

function comeHere(){
   p=$('#comeHere').attr('value')
   endPoint=transStringToPoint(p)
   var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
    driving.search(currentPoint, endPoint);
}
function hotelsCompare(){
    box=$("#compareBox");
    changeBoxClass(box);//绿色代表选中，红色代表未选中。
    var point_str=box.attr('value')
    pushOrPopBox(point_str)
}

function changeBoxClass(box){
    if (box.hasClass('btn-success')){
        box.removeClass('btn-success').addClass('btn-danger').html('未加入比对箱')
    }else{
        box.removeClass('btn-danger').addClass('btn-success').html('已加入比对箱')
    }
}

function pushOrPopBox(point_str){
    if (point_str in compare_boxes){
        delete compare_boxes[point_str]
        
    }else{
        compare_boxes[point_str]=conditions[point_str]
    }
}

function showHotels(){
    operations='<li><input type="button" value="查看" onclick=\'viewHotels()\' class="rollIn submitBtn btn-primary" /></li>\
    <li><input type="button" value="清空" onclick=\'clearHotels()\' class="submitBtn btn-danger" /></li>'
    html=""
    for (var i in compare_boxes){
        detail=compare_boxes[i].detail_info
        url=detail.detail_url
        name=compare_boxes[i].name
        price=detail.price 
        if (typeof price=="undefined" || price=="")
            price=0
        h="<li><a target='_blank' href='"+url+"'>"+name+"(￥"+price+")</a></li>"
        html+=h;
        // console.log(i)
    }
    if (html!='')
        $(".editInfos").html(html+operations)
    showHotelsCompare();
}

function showHotelsCompare(){
    getSrceenWH();
    className="bounceInDown"
    $('#dialogBg').fadeIn(300);
    $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
}
function viewHotels(){
    console.log('compare_boxes: ',compare_boxes)
    var pre='<table id="boxes_table" class="table table-bordered">',suf='</table>';
    var content='<tr style="text-align:center"><th>序号</th><th>酒店名</th><th>价格</th><th>总体评分</th>\
    <th>类型</th><th>室内设施</th></tr>'
    let index=1;
    var td_colors=['success','warning','danger','info']//给表格行添加颜色的。
    for (var i in compare_boxes){
        detail=checkError(compare_boxes[i].detail_info)
        url=checkError(detail.detail_url)
        name=checkError(compare_boxes[i].name)
        price=checkError(detail.price) 
        overall_rating=checkError(detail.overall_rating)
        level=checkError(detail.level)
        inner_facility=checkError(detail.inner_facility)
        backup=checkError(inner_facility)
        if (inner_facility.length>15){
            inner_facility=inner_facility.substring(0,15)+'....'
        }
        if (typeof price=="undefined" || price=="")
            price=0;
        var p = Math.floor((Math.random()*td_colors.length)); 
        
        piece='<tr class="'+td_colors[p]+'"><td>'+index+'</td><td><a target="_blank" href='+url+'>'+name+'</a></td><td>￥'+price+'</td><td>'+overall_rating+'</td>\
        <td>'+level+'</td><td title="'+backup+'">'+inner_facility+'</td></tr>'
        content+=piece;
        index+=1;
    }
    content=pre+content+suf
    $('.editInfos').html(content)
}

//判断错误类型 p不特定类型
function checkError(p){
    try {
        if (typeof p == 'undefined')
            throw exception;
        return p;
    } catch (error) {
        return ""
    }
}


function closeHotelsCompare(){
    $('#dialogBg').fadeOut(300,function(){
        $('#dialog').addClass('bounceOutUp').fadeOut();
    });
}

function clearHotels(){
    compare_boxes=new Array()//清空对比箱
    $('.editInfos').html('<li>此处空空如也.........</li>\
    <li><input type="button" value="查看" class="submitBtn btn-primary"  /></li>\
<li><input type="button" value="清空"  class="submitBtn btn-danger" /></li>')
alert('清空完毕!')
}


//获取信息
function getDetailsByPoint_str(point_str) {
    var info, uid;
    try {
        info = sum_places[point_str];
        uid = info.uid;
    } catch (error) {
        console.log("sum_places没有: " + point_str)
        return false //错误数据
    }
    var mes = getDetailsByUid(uid);
    var point = transStringToPoint(point_str);
    if (typeof mes == "undefined") { // 如果mes响应无结果就重新发起请求
        setTimeout(() => {
            console.log("mes 无结果")
            getDetailsByPoint_str(point_str);
        }, 1000);
    } else {
        c += 1;
        price = mes.detail_info.price
        if (price == "" || price == "undefined") {
            price = 0
        }


        return {
            "index": c,
            "name": mes.name,
            "price": price,
            "detail_url": mes.detail_info.detail_url,
            "img_url": mes.img_url,
            "address": mes.address,
            "telephone": mes.telephone,
            "condition": mes//对象

        };

    }
}

function getAddress(point) {
    geoc.getLocation(point, function (rs) {
        var addComp = rs.addressComponents;
        address = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber
        return addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;

    });
}


//单位：公里
function getDistance(point1, point2) {
    return (map.getDistance(point1, point2) / 1000).toFixed(2);
}

function changePlace(p) {
    k=examples[p];
    if (k.length==0){
        clearNearbyOverlays();
        return false;
    }
    showNearby(k)
}

//提示信息  
function AddRunningDiv() {
    $("body").append("<div id='tip' style=''><h1><strong ><p style='font-size:60px'>数据正在搜索中......</p></strong></h1></div>")
    var a = document.getElementById("tip");
    var Height = document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
    var Width = document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
    var gao1 = a.offsetHeight;
    var gao2 = a.offsetWidth;
    var Sgao1 = Height / 2 + "px";
    var Sgao2 = Width /2-200+ "px";
    a.style.top = Sgao1;
    a.style.left = Sgao2;
    $(".black_overlay").css("display", "block")
}
//取消提示信息  
function MoveRunningDiv() {
    $(".black_overlay").css("display", "none")
    $("#tip").remove()
}


function showServices(services){
    if (services.indexOf("不限")!=-1){//只要选了不限就在当前范围搜索全部酒店
        showPlace(names);
        return true
    }
    
    map.clearOverlays();
    c = 0//搜索结果重置为0
    for (let i in conditions) {
        var r = conditions[i]
        facility = r.detail_info
        isExists=true;
        facility=checkExists(facility.hotel_facility)+","+checkExists(facility.hotel_service)+","+
        checkExists(facility.inner_facility)
        
        for (var a=0;a<services.length;a++){
            p=services[a]
            if (facility.indexOf(p)==-1){
                isExists=false;
                break;
            }
        }
        if (isExists){
            var point = transStringToPoint(i)
            setAfterSearchOverlaysByPoint(point,i);
        }
    }
    setCount(c)
}

function checkExists(r){
    if (typeof r == "undefined"){
        return ""
    }
    return r
}