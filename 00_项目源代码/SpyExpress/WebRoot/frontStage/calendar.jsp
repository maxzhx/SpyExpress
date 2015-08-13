<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流前台系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<script language="javascript">
function atCalendarControl(){
  var calendar=this;
  this.calendarPad=null;
  this.prevMonth=null;
  this.nextMonth=null;
  this.prevYear=null;
  this.nextYear=null;
  this.goToday=null;
  this.calendarClose=null;
  this.calendarAbout=null;
  this.head=null;
  this.body=null;
  this.today=[];
  this.currentDate=[];
  this.sltDate;
  this.target;
  this.source;
  /************** 加入日历底板及阴影 *********************/
  this.addCalendarPad=function(){
	  //var divCalendarpad=document.createElement("div");
	  //divCalendarpad.style.cssText="position:absolute;top:0;left:0;width:400;height:383;display:none;background-color:#FFFFFF;";
	  //divCalendarpad.id="divCalendarpad";
  document.write("<div id='divCalendarpad' width='200' height='183' style='position:absolute;top:0;left:0;display:none;background-color:#FFFFFF';z-index: 10000;>");
   //document.write("<iframe frameborder=0 height=187 width=200></iframe>");
  // document.write("<div style='position:absolute;top:100;left:100;width:250;height:189;background-color:#0000FF'></div>");
   document.write("</div>");
   calendar.calendarPad=document.all.divCalendarpad;
  }//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  /************** 加入日历面板 *********************/
  this.addCalendarBoard=function(){
   var BOARD=this;
   var divBoard=document.createElement("div");
   calendar.calendarPad.insertAdjacentElement("beforeEnd",divBoard);
   divBoard.style.cssText="position:absolute;top:0;left:0;border:1;border-color:#FFFFFF;background-color:#FFFFFF;z-index: 10000;";
   var tbBoard=document.createElement("table");
   divBoard.insertAdjacentElement("beforeEnd",tbBoard);
   tbBoard.style.cssText="position:absolute;top:0;left:0;font-size:9pt;border-color:#16A4D2";
   tbBoard.cellPadding=0;
   tbBoard.cellSpacing=0;
   tbBoard.border=0;
   tbBoard.width=200;
   tbBoard.height=168;
   tbBoard.border=1;
  /************** 设置各功能按钮的功能 *********************/
   /*********** Calendar About Button ***************/
   trRow = tbBoard.insertRow(0);
   calendar.calendarAbout=calendar.insertTbCell(trRow,0,"H","center");
   calendar.calendarAbout.title="帮助 快捷键:H";
   calendar.calendarAbout.onclick=function(){calendar.about();}
   /*********** Calendar Head ***************/
   tbCell=trRow.insertCell(1);
   tbCell.colSpan=5;
   tbCell.bgColor="#36BEF2";//标注！！！！！
   tbCell.align="center";
   tbCell.style.cssText = "cursor:default;border:0;";
   calendar.head=tbCell;
   /*********** Calendar Close Button ***************/
   //tbCell=trRow.insertCell(2);
   calendar.calendarClose = calendar.insertTbCell(trRow,2,"X","center");
   calendar.calendarClose.title="关闭 快捷键:ESC或X";
   calendar.calendarClose.onclick=function(){calendar.hide();}
   
   
 
   /*********** Calendar PrevYear Button ***************/
   trRow = tbBoard.insertRow(1);
   calendar.prevYear = calendar.insertTbCell(trRow,0,"<<","center");
   calendar.prevYear.title="上一年 快捷键:↑";
   calendar.prevYear.onmousedown=function(){
    calendar.currentDate[0]--;
    calendar.show(calendar.target,calendar.returnTime,calendar.currentDate[0]+"-"+calendar.formatTime(calendar.currentDate[1])+"-"+calendar.formatTime(calendar.currentDate[2]),calendar.source);
   }
   /*********** Calendar PrevMonth Button ***************/
   calendar.prevMonth = calendar.insertTbCell(trRow,1,"<","center");
   calendar.prevMonth.title="上一月 快捷键:←";
   calendar.prevMonth.onmousedown=function(){
    calendar.currentDate[1]--;
    if(calendar.currentDate[1]==0){
     calendar.currentDate[1]=12;
     calendar.currentDate[0]--;
    }
    calendar.show(calendar.target,calendar.returnTime,calendar.currentDate[0]+"-"+calendar.formatTime(calendar.currentDate[1])+"-"+calendar.formatTime(calendar.currentDate[2]),calendar.source);
   }
   /*********** Calendar Today Button ***************/
   calendar.goToday = calendar.insertTbCell(trRow,2,"今天","center",3);
   calendar.goToday.title="选择今天 快捷键:T";
   calendar.goToday.onclick=function(){
	 if(calendar.returnTime)
	    calendar.sltDate=calendar.today[0]+"-"+calendar.formatTime(calendar.today[1])+"-"+calendar.formatTime(calendar.today[2])+" "+calendar.formatTime(calendar.today[3])+":00:00"
	 else
	    calendar.sltDate=calendar.today[0]+"-"+calendar.formatTime(calendar.today[1])+"-"+calendar.formatTime(calendar.today[2]);
    calendar.target.value=calendar.sltDate;
    calendar.hide();
    //calendar.show(calendar.target,calendar.today[0]+"-"+calendar.today[1]+"-"+calendar.today[2],calendar.source);
   }//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
   /*********** Calendar NextMonth Button ***************/
   calendar.nextMonth = calendar.insertTbCell(trRow,3,">","center");
   calendar.nextMonth.title="下一月 快捷键:→";
   calendar.nextMonth.onmousedown=function(){
    calendar.currentDate[1]++;
    if(calendar.currentDate[1]==13){
     calendar.currentDate[1]=1;
     calendar.currentDate[0]++;
    }
    calendar.show(calendar.target,calendar.returnTime,calendar.currentDate[0]+"-"+calendar.formatTime(calendar.currentDate[1])+"-"+calendar.formatTime(calendar.currentDate[2]),calendar.source);
   }
   /*********** Calendar NextYear Button ***************/
   calendar.nextYear = calendar.insertTbCell(trRow,4,">>","center");
   calendar.nextYear.title="下一年 快捷键:↓";
   calendar.nextYear.onmousedown=function(){
    calendar.currentDate[0]++;
    calendar.show(calendar.target,calendar.returnTime,calendar.currentDate[0]+"-"+calendar.formatTime(calendar.currentDate[1])+"-"+calendar.formatTime(calendar.currentDate[2]),calendar.source);
   }
   
  
  /*****-----------周日------------******/
   trRow = tbBoard.insertRow(2);
   var cnDateName = new Array("日","一","二","三","四","五","六");
   for (var i = 0; i < 7; i++) {
    tbCell=trRow.insertCell(i)
    tbCell.innerText=cnDateName[i];
    tbCell.align="center";
    tbCell.width=35;
    tbCell.style.cssText="cursor:default;border:0;background-color:#36BEF2;";//标注！！！！！
   }
   /*********** Calendar Body ***************/
   trRow = tbBoard.insertRow(3);
   tbCell=trRow.insertCell(0);
   tbCell.colSpan=7;
   tbCell.height=80;
   tbCell.vAlign="top";
   tbCell.bgColor="#F0F0F0";
   tbCell.style.cssText="border:0;border-color:#FFFFFF";
   
   var tbBody=document.createElement("table");
   tbCell.insertAdjacentElement("beforeEnd",tbBody);
   tbBody.style.cssText="position:relative;top:0;left:0;width:200;height:100;font-size:9pt;"
   tbBody.cellPadding=0;
   tbBody.cellSpacing=1;
   calendar.body=tbBody;
   /*********** Time Body ***************/
   trRow = tbBoard.insertRow(4);
   
   //tbCell=trRow.insertCell(0);
   calendar.prevHours = calendar.insertTbCell(trRow,0,"-","center");
   calendar.prevHours.title="小时调整 快捷键:Home";
   calendar.prevHours.onmousedown=function(){
		calendar.currentDate[3]--;
		if(calendar.currentDate[3]==-1) calendar.currentDate[3]=23;
		calendar.bottom.innerText=calendar.formatTime(calendar.currentDate[3])+":00:00";
	}
   
   tbCell=trRow.insertCell(1);
   tbCell.colSpan=5;
   tbCell.bgColor="#36BEF2";//标注！！！！！
   tbCell.align="center";
   tbCell.style.cssText = "cursor:default;border:0;";
   calendar.bottom=tbCell;
   
   //tbCell=trRow.insertCell(2);
   calendar.nextHours = calendar.insertTbCell(trRow,2,"+","center");
   calendar.nextHours.title="小时调整 快捷键:End";
   calendar.nextHours.onmousedown=function(){
		calendar.currentDate[3]++;
		if(calendar.currentDate[3]==24) calendar.currentDate[3]=0;
		calendar.bottom.innerText=calendar.formatTime(calendar.currentDate[3])+":00:00";
	}
	
}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
/************** 加入功能按钮公共样式 *********************/
  this.insertTbCell=function(trRow,cellIndex,TXT,trAlign,tbColSpan){
   var btnCell=trRow.insertCell(cellIndex);
   if(tbColSpan!=undefined) btnCell.colSpan=tbColSpan;
  // var btnCell=document.createElement("button");
  // tbCell.insertAdjacentElement("beforeEnd",btnCell);
   btnCell.innerText=TXT;
   btnCell.align="center";
   //btnCell.value=TXT;
   btnCell.style.cssText="border:0;border-color:#FFFFFF;border-style:none ;height:16; background-color:#FFFFFF;cursor:hand;";
   btnCell.onmouseover=function(){
   btnCell.style.cssText="border:0; border-style:none;height:16;background-color:#16A4D2;cursor:hand;";
   }
   btnCell.onmouseout=function(){
    btnCell.style.cssText="border:0;border-style:none ;height:16;background-color:#FFFFFF;cursor:hand;";
   }
  // btnCell.onmousedown=function(){
  //  btnCell.style.cssText="width:100%;border:1 inset;background-color:#F0F0F0;";
  // }
   btnCell.onmouseup=function(){
    btnCell.style.cssText="border:0;border-style:none ;height:16;background-color:#16A4D2;cursor:hand;"; 
   }
   btnCell.onclick=function(){
    btnCell.blur();
   }
   return btnCell;
  }
  this.setDefaultDate=function(){
   var dftDate=new Date();
   calendar.today[0]=dftDate.getYear();
   if(calendar.today[0]<1000)
     calendar.today[0]+=1900;
   calendar.today[1]=dftDate.getMonth()+1;
   calendar.today[2]=dftDate.getDate();
   calendar.today[3]=dftDate.getHours();
  }
  /****************** Show Calendar *********************/
  this.show=function(targetObject,returnTime,defaultDate,sourceObject){
   if(targetObject==undefined) {
    alert("未设置目标对象. \n方法: ATCALENDAR.show(obj 目标对象,boolean 是否返回时间,string 默认日期,obj 点击对象);\n\n目标对象:接受日期返回值的对象.\n默认日期:格式为\"yyyy-mm-dd\",缺省为当前日期.\n点击对象:点击这个对象弹出calendar,默认为目标对象.\n");
    return false;
   }
   else calendar.target=targetObject;
   if(sourceObject==undefined) calendar.source=calendar.target;
   else calendar.source=sourceObject;
   if(returnTime) calendar.returnTime=true;
   else calendar.returnTime=false;
   var firstDay;
   var Cells=new Array();
   if((defaultDate==undefined) || (defaultDate=="")){
    var theDate=new Array();
    calendar.head.innerText = calendar.today[0]+"-"+calendar.formatTime(calendar.today[1])+"-"+calendar.formatTime(calendar.today[2]);
    calendar.bottom.innerText = calendar.formatTime(calendar.today[3])+":00:00";
    theDate[0]=calendar.today[0]; theDate[1]=calendar.today[1]; theDate[2]=calendar.today[2];
	theDate[3]=calendar.today[3];
   }
   else{
    var Datereg=/^\d{4}-\d{1,2}-\d{2}$/
    var Datereg1=/^\d{2}-\d{1,2}-\d{1,2}$/
    var DateTimereg=/^(\d{1,4})-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/
    if((!defaultDate.match(Datereg)) && (!defaultDate.match(DateTimereg))&&(!defaultDate.match(Datereg1))){
     alert("默认日期(时间)的格式不正确！\t\n\n默认可接受格式为:\n1、yyyy-mm-dd \n2、yyyy-mm-dd hh:mm\n3、(空)");
	 calendar.setDefaultDate();
     return;
    }
	if(defaultDate.match(Datereg)||defaultDate.match(Datereg1)) defaultDate=defaultDate+" "+calendar.today[3]+":00:00";
	var strDateTime=defaultDate.match(DateTimereg);
	var theDate=new Array(4)
	theDate[0]=strDateTime[1];
	theDate[1]=strDateTime[2];
	theDate[2]=strDateTime[3];
	theDate[3]=strDateTime[4];
    calendar.head.innerText = theDate[0]+"-"+calendar.formatTime(theDate[1])+"-"+calendar.formatTime(theDate[2]);
    calendar.bottom.innerText = calendar.formatTime(theDate[3])+":00:00";
	}
   calendar.currentDate[0]=theDate[0];
   calendar.currentDate[1]=theDate[1];
   calendar.currentDate[2]=theDate[2];
   calendar.currentDate[3]=theDate[3];
   theFirstDay=calendar.getFirstDay(theDate[0],theDate[1]);
   theMonthLen=theFirstDay+calendar.getMonthLen(theDate[0],theDate[1]);
   //calendar.setEventKey();
   calendar.calendarPad.style.display="";
   var theRows = Math.ceil((theMonthLen)/7);
   //清除旧的日历;
   while (calendar.body.rows.length > 0) {
    calendar.body.deleteRow(0)
   }
   //建立新的日历;
   var n=0;day=0;
   for(i=0;i<theRows;i++){
    theRow=calendar.body.insertRow(i);
    for(j=0;j<7;j++){
     n++;
     if(n>theFirstDay && n<=theMonthLen){
      day=n-theFirstDay;
      calendar.insertBodyCell(theRow,j,day);
     }
     else{
      var theCell=theRow.insertCell(j);
      theCell.style.cssText="background-color:#FFFFFF;cursor:default;";
     }
    }
   }
   //****************调整日历位置**************//
   var offsetPos=calendar.getAbsolutePos(calendar.source);//计算对象的位置;
   if((document.body.offsetHeight-(offsetPos.y+calendar.source.offsetHeight-document.body.scrollTop))<calendar.calendarPad.style.pixelHeight){
    var calTop=offsetPos.y-calendar.calendarPad.style.pixelHeight;
   }
   else{
    var calTop=offsetPos.y+calendar.source.offsetHeight;
   }
   if((document.body.offsetWidth-(offsetPos.x+calendar.source.offsetWidth-document.body.scrollLeft))>calendar.calendarPad.style.pixelWidth){
    var calLeft=offsetPos.x;
   }
   else{
    var calLeft=calendar.source.offsetLeft+calendar.source.offsetWidth;
   }
   //alert(offsetPos.x);
   calendar.calendarPad.style.pixelLeft=calLeft;
   calendar.calendarPad.style.pixelTop=calTop;
  }
  /****************** 计算对象的位置 *************************/
  this.getAbsolutePos = function(el) {
   var r = { x: el.offsetLeft, y: el.offsetTop };
   if (el.offsetParent) {
    var tmp = calendar.getAbsolutePos(el.offsetParent);
    r.x += tmp.x;
    r.y += tmp.y;
   }
   return r;
  };
  //************* 插入日期单元格 **************/
  this.insertBodyCell=function(theRow,j,day,targetObject){
   var theCell=theRow.insertCell(j);
   if(j==0||j==6) var theBgColor="#73E4FF";//两边！！！！！！！！！！！
   else var theBgColor="#FFFFFF";
   //if(day==calendar.currentDate[2]) var theBgColor="#CCCCCC";
   if(day==calendar.today[2]) var theBgColor="#16A4D2";//今天！！！！！！！！！！！！！
   theCell.bgColor=theBgColor;
   theCell.innerText=day;
   theCell.align="center";
   theCell.height=20;
   theCell.width=38;
   theCell.style.cssText="border:0;cursor:hand;";
   theCell.onmouseover=function(){
    theCell.bgColor="#16A4D2";
   // theCell.style.cssText="border:1 outset;cursor:hand;";
   }
   theCell.onmouseout=function(){
    theCell.bgColor=theBgColor;
    theCell.style.cssText="border:0;cursor:hand;";
   }
   theCell.onmousedown=function(){
    theCell.bgColor="#16A4D2";
    theCell.style.cssText="border:0 outset;cursor:hand;";
   }
   theCell.onclick=function(){
	 if(calendar.returnTime)
	    calendar.sltDate=calendar.currentDate[0]+"-"+calendar.formatTime(calendar.currentDate[1])+"-"+calendar.formatTime(day)+" "+calendar.formatTime(calendar.currentDate[3])+":00:00"
	 else
	    calendar.sltDate=calendar.currentDate[0]+"-"+calendar.formatTime(calendar.currentDate[1])+"-"+calendar.formatTime(day);
    calendar.target.value=calendar.sltDate;
    calendar.hide();
   }
  }
  /************** 取得月份的第一天为星期几 *********************/
  this.getFirstDay=function(theYear, theMonth){
   var firstDate = new Date(theYear,theMonth-1,1);
   return firstDate.getDay();
  }
  /************** 取得月份共有几天 *********************/
//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  this.getMonthLen=function(theYear, theMonth) {
   theMonth--;
   var oneDay = 1000 * 60 * 60 * 24;
   var thisMonth = new Date(theYear, theMonth, 1);
   var nextMonth = new Date(theYear, theMonth + 1, 1);
   var len = Math.ceil((nextMonth.getTime() - thisMonth.getTime())/oneDay);
   return len;
  }
  /************** 隐藏日历 *********************/
  this.hide=function(){
   //calendar.clearEventKey();
   calendar.calendarPad.style.display="none";
  }
  /************** 从这里开始 *********************/
  this.setup=function(defaultDate){
   calendar.addCalendarPad();
   calendar.addCalendarBoard();
   calendar.setDefaultDate();
  }
  /************** 格式化时间 *********************/
 this.formatTime = function(str) {
  str = ("00"+str);
  return str.substr(str.length-2);
 }
/************** 关于AgetimeCalendar *********************/
  this.about=function(){
   var strAbout = "\nWeb 日历选择输入控件操作说明:\n\n";
   strAbout+="-\t: 关于\n";
   strAbout+="x\t: 隐藏\n";
   strAbout+="<<\t: 上一年\n";
   strAbout+="<\t: 上一月\n";
   strAbout+="今日\t: 返回当天日期\n";
   strAbout+=">\t: 下一月\n";
   strAbout+="<<\t: 下一年\n";
   strAbout+="\nWeb日历选择输入控件\tVer:v1.0\t\nDesigned By:wxb \t\t2004.11.22\t\n";
   alert(strAbout);
  }
document.onkeydown=function(){
	if(calendar.calendarPad.style.display=="none"){
		window.event.returnValue= true;
		return true ;
	}
	switch(window.event.keyCode){
		case 27 : calendar.hide(); break; //ESC
		case 37 : calendar.prevMonth.onmousedown(); break;//←
		case 38 : calendar.prevYear.onmousedown();break; //↑
		case 39 : calendar.nextMonth.onmousedown(); break;//→
		case 40 : calendar.nextYear.onmousedown(); break;//↓
		case 84 : calendar.goToday.onclick(); break;//T
		case 88 : calendar.hide(); break;   //X
		case 72 : calendar.about(); break;   //H
		case 36 : calendar.prevHours.onmousedown(); break;//Home
		case 35 : calendar.nextHours.onmousedown(); break;//End
		case 33 : calendar.prevMinutes.onmousedown();break; //PageUp
		case 34 : calendar.nextMinutes.onmousedown(); break;//PageDown
		}
		window.event.keyCode = 0;
		window.event.returnValue= false;
		}
  calendar.setup();
 }
var CalendarWebControl = new atCalendarControl();
</script>
<!--<style>
.date_style{
height:26px; 
width:auto;
background:url(../img/input.gif) repeat-x 0 0; 
padding:8px 0 0 0; 
margin:0; 
float:left; 
line-height:27px;
}
</style>
--></head>
<body>

</body>
</html>