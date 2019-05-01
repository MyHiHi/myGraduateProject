var map;
var  currentPoint; //我当前的位置point;
var current_address;//逆地址解析currentPoint的地址
var c_location;//取到的城市
var names = ["酒店","旅馆"]; //检索基础关键字
var names_backups = ["酒店","旅馆"]; //值与初始时的names保持一致，这是names备用的，一旦names出错，就主动赋值
var examples = {"显示周边":[],"超市":["超市","商城","商店","小吃","商场",'小卖铺'],
"景点":["景点","古迹"],
"学校":["学校","培训学校","大学","校区"],
"交通":["地铁","火车","机场","公交站"],
"取消":[]
};
var init_point = new BMap.Point(116.404, 39.915);
var init_class = 16.5;
var sum_places = new Array();//存储所有结果的字典
var current_places = new Array();//当前本地搜索结果的字典
var address="";//point转为的地址
var nearby_markers=new Array();//存储当前范围内的超市、景点等对象信息
var compare_boxes=new Array();//存放对比箱
var services=new Array();//存储选择好的设施

var geolocationControl = new BMap.GeolocationControl({showAddressBar:false,enableAutoLocation:true});//定位控件
var current_gif="http://www.yantiansf.cn/mapImage/1.gif" //当前位置标签图案
var geoc = new BMap.Geocoder();//地址逆解析对象
var c=0;//显示搜索到的结果总数
var bounds=null //当前视图的范围
var conditions=new Array();//存储后台返回的结果数组
var condition_places=new Array();//存储筛选对conditions条件之后的结果
var mapTypeControl = new BMap.MapTypeControl({
		mapTypes: [
			BMAP_NORMAL_MAP,
			BMAP_HYBRID_MAP
		]
});

var geoc = new BMap.Geocoder();//拟地址解析对象
 // 添加带有定位的导航控件
 var navigationControl = new BMap.NavigationControl({
    // 靠左上角位置
    anchor: BMAP_ANCHOR_TOP_LEFT,
    // LARGE类型
    type: BMAP_NAVIGATION_CONTROL_LARGE,
    // 启用显示定位
    enableGeolocation: true
  });

var overviewMapControl = new BMap.OverviewMapControl({
        isOpen:true,
        anchor:BMAP_ANCHOR_BOTTOM_RIGHT
});//缩略图控件


var cityListControl = new BMap.CityListControl({
    anchor: BMAP_ANCHOR_TOP_LEFT,
    offset: new BMap.Size(60, 20),
    onChangeAfter:function(){
        geoc.getLocation(map.getCenter(),function(rs){
			console.log('城市:',rs)
			c_location = rs.addressComponents.city;
			map.centerAndZoom(map.getCenter(),init_class)
			currentPoint=map.getCenter();
			showPlace(names);
        })
    }
});//城市列表控件

// 关键字搜素js代码
var ac = new BMap.Autocomplete(
		{"input" : "suggestId"
		,"location" : map
	});//建立一个自动完成的对象

geolocationControl.addEventListener("locationSuccess", function(r){
            var mk = getCurrentMarker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			c_location = r.addressComponent.city;
            // 定位成功事件
			currentPoint = r.point;
			// ????????????????????????????????????????????????????
			// current_address=getAddressByPoint(currentPoint);
			map.centerAndZoom(currentPoint,init_class);
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
		function find(){
			var p1 = localFind.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(p1, init_class);
			map.addOverlay(new BMap.Marker(p1));    //添加标注
			currentPoint=p1;//存放当前位置...........................
			// ????????????????????????????????????????????????????????????
			// current_address=getAddressByPoint(currentPoint);
			showPlace(names);//只能放这里
		}
		var localFind = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: find
		});
		localFind.search(myValue);
}

