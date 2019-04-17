function setStyle() {
    var r = document.getElementById("styleList");
    for (var i in examples) {
        r.options.add(new Option(examples[i], i));
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
    c = 0//搜索结果重置为0
    if (typeof names == "object" && !(names instanceof Array)) { //地图转换城市后,names会变成一个对象,搜索出错,主动赋值
        console.log("names又出错了!");
        names = names_backups; //检索基础关键字
    }
    sum_places = new Array();//清空;让sum_places只存当前搜索结果
    var mPoint = map.getCenter();

    bounds = map.getBounds(); //获取可视区域
    var bssw = bounds.getSouthWest();   //可视区域左下角
    var bsne = bounds.getNorthEast();   //可视区域右上角
    var left_down_lat = bssw.lat;
    var left_down_lng = bssw.lng;
    var right_up_lat = bsne.lat;
    var right_up_lng = bsne.lng;
    console.log("左上角：(" + left_down_lat + "," + left_down_lng + ")")
    console.log("右上角: (" + right_up_lat + "," + right_up_lng + ")")
    console.log(left_down_lat + "," + left_down_lng + "," + right_up_lat + "," + right_up_lng)
    // var circle = new BMap.Circle(mPoint, Circle_meters, { strokeWeight: 1, fillOpacity: 0.3, strokeOpacity: 0.3 });
    // map.addOverlay(circle);
    var local = new BMap.LocalSearch(map, { renderOptions: { map: map, autoViewport: false } });
    local.setSearchCompleteCallback(searchComplete);
    local.setMarkersSetCallback(markersSet);
    AddRunningDiv();//显示数据正在搜索中........
    local.searchInBounds(names, map.getBounds());

    // local.searchNearby(names, mPoint, Circle_meters);
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
    var low = 0, high = 10000000000;
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
    // console.log("价格区间是: "+low+","+high)
    // console.log("sum总: "+sum_places.length)
    // console.log("conditions总: "+conditions.length)
    console.log("???????????????????????????????????????????????????????????????????")
    setSearchOverlaysByPrice(low, high)

}

function setSearchOverlaysByPrice(low, high) {
    map.clearOverlays();
    c = 0//搜索结果重置为0
    for (let i in conditions) {
        var r = conditions[i]
        price = r.detail_info.price
        price = parseInt(typeof price == "undefined" ? 0 : price)

        if (price >= low && price <= high) {
            console.log("price: ", price)

            var point = transStringToPoint(i)
            setAfterSearchOverlaysByPoint(point)
        }
    }

}

function setConditions(point_str, mes) {
    if (!(point_str in conditions.keys())) {
        conditions[point_str] = mes //
        // console.log("<<<<<<<<<<<<<<<<<<",conditions[point_str])
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
    var htm = "<div class=\"posit\" style=\"user-select: none; left: -20px; top: -20px;\"><div>\
    <span class=\"posit_index\">"+ mes.index + "</span>\
    <p class=\"posit_tit\">"+ mes.name + "\
        <span>¥\
            <em>"+ mes.price + "</em>\
        </span>\
    </p>\
    </div>";
    var mk = new BMapLib.RichMarker(htm, p, {});
    map.addOverlay(mk);
    mk.addEventListener("mouseover", function () {
        showNearby(point_str)
        // console.log("mk :",$(mk._container))
        // $(mk._container).children("div.posit").addClass("layer")
        // $(mk._container).addClass("hover")
        // $(mk._container).children("div.posit").addClass("on")
        // openDetailWindow(point_str)

    });
    mk.addEventListener("mouseout", function () {
        // $(mk._container).children("div.posit").removeClass("hover")

    });

    mk.addEventListener("click", function () {
        map.openInfoWindow(showInfoByWindow(point_str), p);
        // window.open(mes.url);
        // this.openInfoWindow(showInfoByWindow(point_str));
    })

}
// 88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
function showNearby(point_str){
    clearNearbyOverlays();
    nearby_places=['超市','景点','商场']
    mPoint=transStringToPoint(point_str)
    // var circle = new BMap.Circle(mPoint,nearby_meters,{ strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    // map.addOverlay(circle);
    var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false}});  
    local.searchNearby(nearby_places,mPoint,nearby_meters);
    // local.setSearchCompleteCallback(searchComplete);
    local.setMarkersSetCallback(nearbyMarkersSet);
}
function clearNearbyOverlays(){
    len=nearby_markers.length
    if (len>0){
        for (var i=0;i<len;i++){
            console.log("nnn:  ",nearby_markers[i])
            map.removeOverlay(nearby_markers[i]);
        }
        nearby_markers=new Array();//重置
    }
}
// 222222222222222222222222222222222222222222222222222222222222222222222222222222222222
function nearbyMarkersSet(rs){
    for (let i in rs){
        var result=rs[i]
        var p=result.point;
        var name=result.title;
        var html=nearbyHtml(name)
        var mk = new BMapLib.RichMarker(html, p, {});
        map.addOverlay(mk);
        nearby_markers.push(mk)
    }
}
// 999999999999999999999999999999999999999999999999999999999999999999999
function nearbyHtml(name){
    var html="<i class='fa fa-shopping-bag' style='color:green;' title='"+name+"'></i>"
    return html
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
    // detailWindow(data);
    return data;
}

//用不到了
function openDetailWindow(point_str) {
    var info = sum_places[point_str];
    var uid = info.uid;
    var data = getDetailsByUid(uid)
    var name = data.name;
    $("#name").html(name);
    var address = data.address;
    $("#address").html(address);
    var detail_info = data.detail_info;
    var detail_url = detail_info.detail_url;
    $("#detail_url").attr("href", detail_url);
    var facility_rating = detail_info.facility_rating;
    $("#facility_rating").html(facility_rating)
    var hotel_facility = detail_info.hotel_facility;
    $("#hotel_facility").html(hotel_facility);
    var hotel_service = detail_info.hotel_service;
    $("#hotel_service").html(hotel_service)
    var hygiene_rating = detail_info.hygiene_rating;
    $("#hygiene_rating").html(hygiene_rating);
    var inner_facility = detail_info.inner_facility;
    $("#inner_facility").html(inner_facility)
    var level = detail_info.level;
    $("#level").html(level)
    var overall_rating = detail_info.overall_rating;
    $("#overall_rating").html(overall_rating)
    var price = detail_info.price;
    $("#price").html(price)
    var service_rating = detail_info.service_rating;
    $("#service_rating").html(service_rating);
    var telephone = data.telephone;
    $("#telephone").html(telephone);
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
//unused
function setCurrentLocation() {
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function (r) {
        if (this.getStatus() == BMAP_STATUS_SUCCESS) {
            var mk = getCurrentMarker(r.point)
            currentPoint = r.point;
            map.addOverlay(mk);
            map.panTo(r.point);
        }
        else {
            alert('failed' + this.getStatus());
        }
    }, { enableHighAccuracy: true })
}

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
        width: 365,     // 信息窗口宽度
        height: 300,     // 信息窗口高度
        title: title,// 信息窗口标题
    }
    var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象
    return infoWindow;
}


function getWindowHtml(point_str) {
    var info = sum_places[point_str];
    var uid = info.uid
    var mes = getDetailsByUid(uid);
    var detail_info = mes.detail_info
    var html = "<a id='a' target='_blank'  href='" + detail_info.detail_url + "' >   \
<div id='windowInfo'><div title='酒店设施("+ detail_info.hotel_facility + ")------>\
室内设施("+ detail_info.inner_facility + ")------->\
酒店服务("+ detail_info.hotel_service + ")'\
id='hotel_img'><img  width='340' height='160' src='"+ mes.img_url + "'>\
            </div><br><p><i class=' fa  fa-bank' style='color:springgreen'></i> 地址:"+ mes.address + "</p>\
            <p><i class=' fa fa-phone' style='color:blue'></i> 电话:"+ mes.telephone + "</p>\
    <p style='color:orange'> <i class=' fa fa-star' style='color:goldenrod'></i> 卫生评分:"+ detail_info.hygiene_rating + "--服务评分:" + detail_info.service_rating + "---设施评分:" + detail_info.facility_rating + "</p> </div></a>"
    var main = { "content": html, "title": "<i class='fa fa-2x fa-home' style='color:orange'></i>" + mes.name + "(" + detail_info.level + "--" + detail_info.overall_rating + "分)" }
    return main
}



//获取信息
function getDetailsByPoint_str(point_str) {
    var info, uid;
    // info=sum_places[point_str]
    // // if ()
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
        // console.log("后台返回数据" + c + ": ", mes);
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
// function getDistance(point1, point2) {
//     return (map.getDistance(point1, point2) / 1000).toFixed(2);
// }

function changePlace(p) {
    names.push(examples[p]);
    showPlace(names);
    names.pop();

}

//提示信息  
function AddRunningDiv() {
    $("body").append("<div id='tip'><h1><strong>数据正在搜索中......</strong></h1></div>")
    var a = document.getElementById("tip");
    var Height = document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
    var Width = document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
    var gao1 = a.offsetHeight;
    var gao2 = a.offsetWidth;
    var Sgao1 = Height / 2 + "px";
    var Sgao2 = Width / 2 + "px";
    a.style.top = Sgao1;
    a.style.left = Sgao2;
    $(".black_overlay").css("display", "block")
}
//取消提示信息  
function MoveRunningDiv() {
    console.log("结束了>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    $(".black_overlay").css("display", "none")
    $("#tip").remove()
}

