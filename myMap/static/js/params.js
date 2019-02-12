var map;
var  currentPoint; //我当前的位置point
var c_location;//取到的城市
var names = ["酒店","旅馆","饭店"]; //检索基础关键字
var examples = ["景点","商场","大学","机场火车"];
var init_point = new BMap.Point(116.404, 39.915);
var init_class = 14
var geolocationControl = new BMap.GeolocationControl({showAddressBar:false,enableAutoLocation:true});//定位控件

var geoc = new BMap.Geocoder();//地址解析

var mapTypeControl = new BMap.MapTypeControl({
		mapTypes: [
			BMAP_NORMAL_MAP,
			BMAP_HYBRID_MAP
		]
});

var overviewMapControl = new BMap.OverviewMapControl({
        isOpen:true,
        anchor:BMAP_ANCHOR_BOTTOM_RIGHT
});//缩略图控件


var cityListControl = new BMap.CityListControl({
    anchor: BMAP_ANCHOR_TOP_LEFT,
    offset: new BMap.Size(10, 20),
    onChangeAfter:function(){
        geoc.getLocation(map.getCenter(),function(rs){
            c_location = rs.addressComponents.city;
            showPlace(names)
            //console.log(c_location)
        })
    }
});//城市列表控件

var ac = new BMap.Autocomplete(
		{"input" : "suggestId"
		,"location" : map
	});//建立一个自动完成的对象


// var local = new BMap.LocalSearch(map, {
// 		renderOptions:{map: map, autoViewport:true},
// //    pageCapacity:3,
//     onSearchComplete:function(rs){
//             console.log("tests")
// 		    console.log("&*& "+rs)
//     }
// 	}); //本地检索



geolocationControl.addEventListener("locationSuccess", function(r){
            var mk = getMarker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			c_location = r.addressComponent.city;
            // 定位成功事件
            currentPoint = r.point;
            showPlace(names);
  });
geolocationControl.addEventListener("locationError",function(e){
    // 定位失败事件
    alert(e.message);
  });

ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	    var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		document.getElementById("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		document.getElementById("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		setPlace();
	});

function setPlace(){
		//map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
}

