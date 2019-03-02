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
    // map.addEventListener("click", showInfo);

    map.addEventListener("dragend", showPlace);

    // map.addEventListener("tilesloaded",setCurrentLocation);

    //    var myKeys = ["酒店", "加油站","旅馆","大学"];
    // //    var options = {
    // //      onSearchComplete:
    // // };
    // var local = new BMap.LocalSearch(map, {
    // 	renderOptions:{map: map,autoViewport: true},
    //        onSearchComplete: function(results){
    //          if (local.getStatus() == BMAP_STATUS_SUCCESS) {
    //              // 判断状态是否正确
    //              console.log(results)
    //          }
    //      }
    // });
    // local.search(myKeys);


}

// function showPlace(names) {
//     var local = new BMap.LocalSearch(map, {
//         renderOptions: { map: map, autoViewport: true, selectFirstResult: false },
//         onSearchComplete: function (rs) {

//             if (local.getStatus() == BMAP_STATUS_SUCCESS) {
//                 console.log("搜索成功")
//                 console.log(rs)
//             }
//             else {
//                 console.log("搜索失败 ")
//                 console.log(rs)
//             }
//         }
//     }); //本地检索

//     local.search(names);
//     console.log(names + " ^~^%% ")

// }

//备用showPlace
function showPlace(names) {
    console.log("可能出错的names：",names);
    if (typeof names == "object" && !(names instanceof Array)) { //地图转换城市后,names会变成一个对象,搜索出错,主动赋值
        names = names_backups; //检索基础关键字
    }
    sum_places = new Array();//清空;让sum_places只存当前搜索结果
    var mPoint = map.getCenter();
    var circle = new BMap.Circle(mPoint, 1000, { strokeWeight: 1, fillOpacity: 0.3, strokeOpacity: 0.3 });
    map.addOverlay(circle);
    var local = new BMap.LocalSearch(map, { renderOptions: { map: map, autoViewport: false } });
    // local.setSearchCompleteCallback(searchComplete);
    local.setMarkersSetCallback(markersSet);
    console.log("names: ",names);
    local.searchNearby(names, mPoint, 1000);
    // console.log(names);

}
function markersSet(rs) {
    // console.log(rs)
    // map.clearOverlays()
    for (let i in rs) {
        point = rs[i].point;
        point_str = point.lng + "," + point.lat
        if (sum_places[point_str] == null) {
            sum_places[point_str] = rs[i]

        }
    }
    // console.log("This : \n",sum_places)
    // console.log(sum_places.length)
    // console.log(sum_places["38.865975,115.487819"])

    console.log("markersSet后返回数据了**********************")
    count = Object.keys(sum_places).length;
    setCount(count);
    console.log("sum_places： ",sum_places);
    setAfterSearchOverlays();
}
function searchComplete(rs) {
    console.log("searchComplete 搜索成功")

    for (var i = 0; i < count; i++) {
        try {
            var position = rs[0].getPoi(i);
            // console.log(position)
            if (position == null) continue;

            // var adddress = position.address;
            var point = position.point;
            var name = position.title
            //console.log(name+": "+":("+point.lat+","+point.lng+")");

        } catch (error) {
            console.log("searchComplete出错: ", error)
        }

    }
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
    // console.log("结果:",coordinates)
}


function setAfterSearchOverlaysByPoint(p) {
    var mk = new BMap.Marker(p);
    map.addOverlay(mk);
    var point_str = transPointToString(p);
    mk.addEventListener("mouseover", function () {
        this.openInfoWindow(showInfoByWindow(point_str));
    });
    mk.addEventListener("mouseout", function () {
        this.closeInfoWindow();
    })

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
    var gif_url = "http://www.yantiansf.cn/mapImage/1.gif"
    var myIcon = new BMap.Icon(gif_url, new BMap.Size(32, 32));
    // mk.setAnimation(BMAP_ANIMATION_BOUNCE);
    mk.setIcon(myIcon);
    mk.enableDragging();
    return mk;
}

function showInfoByWindow(point_str) {

    message = getDetailsByPoint_str(point_str) //message : {place:"",brief:"",image:"",distance:""}
    sContent = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>(" + ") </br>距离我：" + message.distance + "公里</br>" + message.place + "</h4>" +
        "<img style='float:right;margin:4px' id='imgDemo' src='" + message.image + "' width='139' height='104' title='" + message.place + "'/>" +
        "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + message.brief + "," + message.address + "</p>" +
        "</div>";
    
    var opts = {
        width: 250,     // 信息窗口宽度
        height: 300,     // 信息窗口高度
        title: "Hello",// 信息窗口标题
        // panel: "panel",         //检索结果面板
        // enableAutoPan: true,     //自动平移
        // searchTypes: [
        //     BMAPLIB_TAB_SEARCH,   //周边检索
        //     BMAPLIB_TAB_TO_HERE,  //到这里去
        //     BMAPLIB_TAB_FROM_HERE //从这里出发
        // ]

    }
    var infoWindow = new BMap.InfoWindow(sContent, opts);  // 创建信息窗口对象
    return infoWindow;
    // map.openInfoWindow(infoWindow, e.point); //开启信息窗口


}

//获取信息????????????
function getDetailsByPoint_str(point_str) {
    var info = sum_places[point_str];
    var point = transStringToPoint(point_str);
    
    return {
        "place": info.title,
        "brief": info.url,
        "image": "http://pcsv0.map.bdimg.com/pr/?qt=poiprv&uid=65e1ee886c885190f60e77ff&width=323&height=101&quality=80&fovx=200",
        "distance": getDistance(point, currentPoint)
    };
}

function getAddress(point) {
    geoc.getLocation(point, function (rs) {
        var addComp = rs.addressComponents;
        //console.log(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber)
        address = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber
        return addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
        //console.log(address)
        // return address;
    });
}


//单位：公里
function getDistance(point1, point2) {
    return (map.getDistance(point1, point2) / 1000).toFixed(2);
}

///////////////////////////////////////////////////////////////////////////////////////////////
function changePlace(p) {

    names.push(examples[p]);
    //local.searchNearby(names, map.getBounds());
    showPlace(names);
    names.pop();

}

