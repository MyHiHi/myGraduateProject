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
    map.addEventListener("click", showInfo);

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


function showPlace(names){
    setCount(0);
    var mPoint = map.getCenter();
    var count = 0 ;//成功搜索结果数
    var circle = new BMap.Circle(mPoint,1000,{ strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
  //    map.addOverlay(circle);
      var local =  new BMap.LocalSearch(map, {
          renderOptions: {map: map, autoViewport: false},
          onSearchComplete:function(rs){
            if (local.getStatus() == BMAP_STATUS_SUCCESS) {
                                console.log("搜索成功")
                                count = rs[0].getNumPois()
                                setCount(count);
                                console.log("总数: "+count)
                                for (var i=0;i<count;i++){
                                    var position = rs[0].getPoi(i);
                                    console.log(position)
                                    if (position==null) continue;
                                   
                                    // var adddress = position.address;
                                    var point  = position.point;
                                    var name = position.title
                                    //console.log(name+": "+":("+point.lat+","+point.lng+")");
                               
                                    
                                }
                            }
                            else{
                                console.log("搜索失败！")
                                console.log(rs)
                            }
                           
          }
        });  
        // names="酒店";//暂时一个
      local.searchNearby(names,mPoint,1000);
}

function setCount(num){
    $("#count").html(num)
}
//开始定位
//unused
function setCurrentLocation() {
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function (r) {
        if (this.getStatus() == BMAP_STATUS_SUCCESS) {
            var mk = getMarker(r.point)
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

function getMarker(point) {
    var mk = new BMap.Marker(point);
    mk.setAnimation(BMAP_ANIMATION_BOUNCE);
    mk.enableDragging();
    return mk;
}

function showInfo(e) {
    if (e.overlay) {
        var p = e.point
        message = getDetails(e.point) //message : {place:"",brief:"",image:"",distance:""}
        sContent = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>(" + p.lat+","+p.lng + ") </br>距离我：" + message.distance + "公里</br>" + "</h4>" +
            "<img style='float:right;margin:4px' id='imgDemo' src='" + message.image + "' width='139' height='104' title='" + message.place + "'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + message.brief + "</p>" +
            "</div>";
        var opts = {
            width: 250,     // 信息窗口宽度
            height: 500,     // 信息窗口高度
            title: "Hello",// 信息窗口标题

        }
        var infoWindow = new BMap.InfoWindow(sContent, opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow, e.point); //开启信息窗口
    }

}

//获取信息????????????
function getDetails(point) {
    //if else
    geoc.getLocation(point, function (rs) {
        var addComp = rs.addressComponents;
        //console.log(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber)
        address = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
    });
    return {
        "place": getAddress(point),
        "brief": "This is A Test",
        "image": "http://pcsv0.map.bdimg.com/pr/?qt=poiprv&uid=65e1ee886c885190f60e77ff&width=323&height=101&quality=80&fovx=200",
        "distance": getDistance(point, currentPoint)
    };
}

function getAddress(point) {
    geoc.getLocation(point, function (rs) {
        var addComp = rs.addressComponents;
        //console.log(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber)
        // address = 
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

