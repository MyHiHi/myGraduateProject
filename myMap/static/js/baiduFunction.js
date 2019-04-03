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
    if (typeof names == "object" && !(names instanceof Array)) { //地图转换城市后,names会变成一个对象,搜索出错,主动赋值
        console.log("names又出错了!");
        names = names_backups; //检索基础关键字

    }
    sum_places = new Array();//清空;让sum_places只存当前搜索结果
    var mPoint = map.getCenter();
    var circle = new BMap.Circle(mPoint, Circle_meters, { strokeWeight: 1, fillOpacity: 0.3, strokeOpacity: 0.3 });
    map.addOverlay(circle);
    var local = new BMap.LocalSearch(map, { renderOptions: { map: map, autoViewport: false } });
    local.setSearchCompleteCallback(searchComplete);
    local.setMarkersSetCallback(markersSet);
    local.searchNearby(names, mPoint, Circle_meters);

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
    map.clearOverlays();
    var current_mk = getCurrentMarker(currentPoint);
    map.addOverlay(current_mk);//加上当前定位
    for (var i in sum_places) {
        coordinates = i.split(",");
        var point = new BMap.Point(coordinates[0], coordinates[1]);
        setAfterSearchOverlaysByPoint(point)
    }
}


function setAfterSearchOverlaysByPoint(p) {
    var mk = new BMap.Marker(p);
    map.addOverlay(mk);
    var point_str = transPointToString(p);
    var mes = getDetailsByPoint_str(point_str);
    mk.addEventListener("mouseover", function () {
        this.openInfoWindow(showInfoByWindow(point_str));
    });

    mk.addEventListener("click", function () {
        window.open(mes.url);
    })

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
    detailWindow(data);
    return data;
}

function detailWindow(data) {
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

    message = getDetailsByPoint_str(point_str) //message : {place:"",brief:"",image:"",distance:""}

    sContent = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + "</br>距离我：" + message.distance + "公里</br>" + message.telephone + ",<br></h4>" +
        "<img style='float:right;margin:4px' id='imgDemo' src='" + message.image + "' width='139' height='104' title='" + message.name + "'/><br>" +
        "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + "," + message.address + "</p>" +
        "</div>";
    var opts = {
        width: 250,     // 信息窗口宽度
        height: 300,     // 信息窗口高度
        title: message.name,// 信息窗口标题

    }
    var infoWindow = new BMap.InfoWindow(sContent, opts);  // 创建信息窗口对象
    return infoWindow;
    // map.openInfoWindow(infoWindow, e.point); //开启信息窗口


}

var c = 1;//控制台显示条数用的
//获取信息
function getDetailsByPoint_str(point_str) {

    var info = sum_places[point_str];
    var uid = info.uid
    var mes = getDetailsByUid(uid);
    var point = transStringToPoint(point_str);
    if (typeof mes == "undefined") { // 如果mes响应无结果就重新发起请求
        setTimeout(() => {
            console.log("mes 无结果")
            getDetailsByPoint_str(point_str);
        }, 1000);
    } else {
        console.log("后台返回数据" + c + ": ", mes);
        c += 1;
        return {
            "name": mes.name,
            "url": mes.detail_info.detail_url,
            "image": mes.img_url,
            "address": mes.address,
            "telephone": mes.telephone,
            "distance": getDistance(point, currentPoint)
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
    names.push(examples[p]);
    showPlace(names);
    names.pop();

}

