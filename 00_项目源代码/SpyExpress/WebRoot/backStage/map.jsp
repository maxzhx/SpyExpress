<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=DA831abf90cb2a9031e4280545740479
" charset="utf-8"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
<title></title>
</head>
<div id="allmap" style="height: 470px; width: 620px"></div>
</body>
</html>
<script type="text/javascript">
var map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(118.103886,25.489231), 8);

map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件

//左下角，仅包含平移按钮
map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, type: BMAP_NAVIGATION_CONTROL_ZOOM}));  

//右下角，仅包含缩放按钮
map.enableScrollWheelZoom(true);
function addMarker(point){
  var marker = new BMap.Marker(point);
  map.addOverlay(marker);
}
// 添加标注

var xiamen = new BMap.Point(118.103886,24.469231);
  addMarker(xiamen);
var quanzhou = new BMap.Point(118.639793, 24.802508);
  addMarker(quanzhou);
var ningde= new BMap.Point(119.568857, 26.577811);
  addMarker(ningde);
var putian  = new BMap.Point(119.037635, 25.328049);
  addMarker(putian);
var zhangzhou = new BMap.Point(117.673935, 24.466167);
  addMarker(zhangzhou);
var nanping = new BMap.Point(118.198258, 26.615027);
  addMarker(nanping);
var sanming = new BMap.Point(117.650939, 26.225731);
  addMarker(sanming);
var longyan = new BMap.Point(117.048427, 25.024827);
  addMarker(longyan);
var fuzhou = new BMap.Point(119.311295, 26.034742);
  addMarker(fuzhou);

var line1 = [zhangzhou,xiamen,quanzhou,putian,fuzhou,ningde];
var curve = new BMapLib.CurveLine(line1, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
map.addOverlay(curve); //添加到地图中
curve.enableEditing(); //开启编辑功能
var line2 = [nanping,fuzhou,ningde];
var curve = new BMapLib.CurveLine(line2, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
map.addOverlay(curve); //添加到地图中
curve.enableEditing(); //开启编辑功能
var line3 = [nanping,sanming,longyan];
var curve = new BMapLib.CurveLine(line3, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
map.addOverlay(curve); //添加到地图中
curve.enableEditing(); //开启编辑功能
var line4 = [quanzhou,sanming];
var curve = new BMapLib.CurveLine(line4, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
map.addOverlay(curve); //添加到地图中
curve.enableEditing(); //开启编辑功能
var line5 = [zhangzhou,longyan];
var curve = new BMapLib.CurveLine(line5, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
map.addOverlay(curve); //添加到地图中
curve.enableEditing(); //开启编辑功能


</script>