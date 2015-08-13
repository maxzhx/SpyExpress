/*#############################################################
Name: Niceforms
Version: 2.0
Author: Lucian Slatineanu
URL: http://www.emblematiq.com/projects/niceforms/

Feel free to use and modify but please keep this copyright intact.
#################################################################*/

//Theme Variables - edit these to match your theme
var imagesPath = "../img/";
var selectRightWidthSimple = 19;
var selectRightWidthScroll = 2;
var selectMaxHeight = 200;
var textareaTopPadding = 10;
var textareaSidePadding = 10;

//Global Variables
var NF = new Array();
var isIE = false;
var resizeTest = 1;

//Initialization function
function NFInit() {
	try {
		document.execCommand('BackgroundImageCache', false, true);
	} catch(e) {}
	if(!document.getElementById) {return false;}
	//alert("click me first");
	NFDo('start');
}
function NFDo(what) {
	var niceforms = document.getElementsByTagName('form');
	var nicetables = document.getElementsByTagName('table');
	var identifier = new RegExp('(^| )'+'niceform'+'( |$)');
	if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
		var ieversion=new Number(RegExp.$1);
		if(ieversion < 7) {return false;} //exit script if IE6
		isIE = true;
	}
	for(var q = 0; q < niceforms.length; q++) {if(identifier.test(niceforms[q].className)) {
		if(what == "start") { //Load Niceforms
			NF[q] = new niceform(niceforms[q]);
			niceforms[q].start();
		}
		else { //Unload Niceforms
			niceforms[q].unload();
			NF[q] = "";
		}
	}}
	
	for(var q = 0; q < nicetables.length; q++) {if(identifier.test(nicetables[q].className)) {
		if(what == "start") { //Load Niceforms
			NF[q] = new niceform(nicetables[q]);
			nicetables[q].start();
		}
		else { //Unload Niceforms
			nicetables[q].unload();
			NF[q] = "";
		}
	}}
}
function NFFix() {
	NFDo('stop');
	NFDo('start');
}

function niceform(nf) {
	nf._inputText = new Array(); nf._inputRadio = new Array(); nf._inputCheck = new Array(); nf._inputSubmit = new Array(); nf._inputFile = new Array(); nf._textarea = new Array(); nf._select = new Array(); nf._multiselect = new Array();
	nf.add_inputText = function(obj) {this._inputText[this._inputText.length] = obj; inputText(obj);}
	nf.add_inputRadio = function(obj) {this._inputRadio[this._inputRadio.length] = obj; inputRadio(obj);}
	nf.add_inputCheck = function(obj) {this._inputCheck[this._inputCheck.length] = obj; inputCheck(obj);}
	nf.add_inputSubmit = function(obj) {this._inputSubmit[this._inputSubmit.length] = obj; inputSubmit(obj);}
	nf.add_inputFile = function(obj) {this._inputFile[this._inputFile.length] = obj; inputFile(obj);}
	nf.add_textarea = function(obj) {this._textarea[this._textarea.length] = obj; textarea(obj);}
	nf.add_select = function(obj) {this._select[this._select.length] = obj; selects(obj);}
	nf.add_multiselect = function(obj) {this._multiselect[this._multiselect.length] = obj; multiSelects(obj);}
	nf.start = function() {
		//Separate and assign elements
		var allInputs = this.getElementsByTagName('input');
		for(var w = 0; w < allInputs.length; w++) {
			switch(allInputs[w].type) {
				case "text": case "password": {this.add_inputText(allInputs[w]); break;}
				case "radio": {this.add_inputRadio(allInputs[w]); break;}
				case "checkbox": {this.add_inputCheck(allInputs[w]); break;}
				case "submit": case "reset": case "button": {this.add_inputSubmit(allInputs[w]); break;}
				case "file": {this.add_inputFile(allInputs[w]); break;}
			}
		}
		var allButtons = this.getElementsByTagName('button');
		for(var w = 0; w < allButtons.length; w++) {
			this.add_inputSubmit(allButtons[w]);
		}
		var allTextareas = this.getElementsByTagName('textarea');
		for(var w = 0; w < allTextareas.length; w++) {
			this.add_textarea(allTextareas[w]);
		}
		var allSelects = this.getElementsByTagName('select');
		for(var w = 0; w < allSelects.length; w++) {
			if(allSelects[w].size == "1") {this.add_select(allSelects[w]);}
			else {this.add_multiselect(allSelects[w]);}
		}
		//Start
		for(w = 0; w < this._inputText.length; w++) {this._inputText[w].init();}
		for(w = 0; w < this._inputRadio.length; w++) {this._inputRadio[w].init();}
		for(w = 0; w < this._inputCheck.length; w++) {this._inputCheck[w].init();}
		for(w = 0; w < this._inputSubmit.length; w++) {this._inputSubmit[w].init();}
		for(w = 0; w < this._inputFile.length; w++) {this._inputFile[w].init();}
		for(w = 0; w < this._textarea.length; w++) {this._textarea[w].init();}
		for(w = 0; w < this._select.length; w++) {this._select[w].init(w);}
		for(w = 0; w < this._multiselect.length; w++) {this._multiselect[w].init(w);}
	}
	nf.unload = function() {
		//Stop
		for(w = 0; w < this._inputText.length; w++) {this._inputText[w].unload();}
		for(w = 0; w < this._inputRadio.length; w++) {this._inputRadio[w].unload();}
		for(w = 0; w < this._inputCheck.length; w++) {this._inputCheck[w].unload();}
		for(w = 0; w < this._inputSubmit.length; w++) {this._inputSubmit[w].unload();}
		for(w = 0; w < this._inputFile.length; w++) {this._inputFile[w].unload();}
		for(w = 0; w < this._textarea.length; w++) {this._textarea[w].unload();}
		for(w = 0; w < this._select.length; w++) {this._select[w].unload();}
		for(w = 0; w < this._multiselect.length; w++) {this._multiselect[w].unload();}
	}
}
function inputText(el) { //extent Text inputs
	el.oldClassName = el.className;
	el.left = document.createElement('img');
	el.left.src = imagesPath + "0.png";
	el.left.className = "NFTextLeft";
	el.right = document.createElement('img');
	el.right.src = imagesPath + "0.png";
	el.right.className = "NFTextRight";
	el.dummy = document.createElement('div');
	el.dummy.className = "NFTextCenter";
	el.onfocus = function() {
		this.dummy.className = "NFTextCenter NFh";
		this.left.className = "NFTextLeft NFh";
		this.right.className = "NFTextRight NFh";
		if(this.id=="celandar_select"){
			CalendarWebControl.show(this,true,this.value);
		}
	}
	el.onblur = function() {
		this.dummy.className = "NFTextCenter";
		this.left.className = "NFTextLeft";
		this.right.className = "NFTextRight";
		/*文本框验证区*/
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="username"){//不能为空
			document.getElementById("v_username").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="username"){
			document.getElementById("v_username").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="password"){//不能为空
			document.getElementById("v_pass").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="password"){
			document.getElementById("v_pass").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="order.recvName"){//不能为空
			
			document.getElementById("v_orname").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="order.recvName"){
			document.getElementById("v_orname").style.display="none";
		}
		if(!this.value.match("^[1][3-8]+\\d{9}$")&&this.name=="order.recvPhone"){//11位手机号码
			document.getElementById("v_orphone").style.display="block";
		}
		else if(this.value.match("^[1][3-8]+\\d{9}$")&&this.name=="order.recvPhone"){
			document.getElementById("v_orphone").style.display="none";
		}
		
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="order.recvAddress"){//不能为空
			document.getElementById("v_oraddress").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="order.recvAddress"){
			document.getElementById("v_oraddress").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="order.weight"){//只能输入数字
			document.getElementById("v_orweight").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="order.weight"){
			document.getElementById("v_orweight").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$$")&&this.name=="order.volume"){//只能输入数字
			document.getElementById("v_orvolume").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="order.volume"){
			document.getElementById("v_orvolume").style.display="none";
		}
		if(!this.value.match("^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}-[A-Z_0-9]{5}$")&&this.name=="vehicle.license"){//车牌号
			document.getElementById("v_velience").style.display="block";
		}
		else if(this.value.match("^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}-[A-Z_0-9]{5}$")&&this.name=="vehicle.license"){
			document.getElementById("v_velience").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="vehicle.model"){//不能为空
			document.getElementById("v_vemodel").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="vehicle.model"){
			document.getElementById("v_vemodel").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="vehicle.manufacturer"){//不能为空
			document.getElementById("v_vemanufacturer").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="vehicle.manufacturer"){
			document.getElementById("v_vemanufacturer").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="vehicle.capacity"){//只能输入数字
			document.getElementById("v_vecapacity").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="vehicle.capacity"){
			document.getElementById("v_vecapacity").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="vehicle.volume"){//只能输入数字
			document.getElementById("v_vevolume").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="vehicle.volume"){
			document.getElementById("v_vevolume").style.display="none";
		}
		if(!this.value.match("^[0-9]*[1-9][0-9]*$")&&this.name=="vehicle.receipt.id"){//只能输入数字
			document.getElementById("v_vehiclereceipt").style.display="block";
		}
		else if(this.value.match("^[0-9]*[1-9][0-9]*$")&&this.name=="vehicle.receipt.id"){
			document.getElementById("v_vehiclereceipt").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="station.name"){//不能为空
			document.getElementById("v_stationname").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="station.name"){
			document.getElementById("v_stationname").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="station.address"){//不能为空
			document.getElementById("v_stationadd").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="station.address"){
			document.getElementById("v_stationadd").style.display="none";
		}
		if(!this.value.match("(^[0]+\\d{2,3}[-]+\\d{7})$|(^[1][3-8]+\\d{9}$)")&&this.name=="station.phone"){//11位手机号码
			document.getElementById("v_stationphone").style.display="block";
		}
		else if(this.value.match("(^[0]+\\d{2,3}[-]+\\d{7}$)|(^[1][3-8]+\\d{9}$)")&&this.name=="station.phone"){
			document.getElementById("v_stationphone").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.firstKgPrice"){//只能输入数字
			document.getElementById("v_scopeFKP").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.firstKgPrice"){
			document.getElementById("v_scopeFKP").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.kgPrice"){//只能输入数字
			document.getElementById("v_scopeKP").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.kgPrice"){
			document.getElementById("v_scopeKP").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.firstCubicPrice"){//只能输入数字
			document.getElementById("v_scopeFCP").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.firstCubicPrice"){
			document.getElementById("v_scopeFCP").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.cubicPrice"){//只能输入数字
			document.getElementById("v_scopeCP").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.cubicPrice"){
			document.getElementById("v_scopeCP").style.display="none";
		}
		if(!this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.duration"){//只能输入数字
			document.getElementById("v_scopedura").style.display="block";
		}
		else if(this.value.match("^[0-9][0-9]{0,2}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$")&&this.name=="scope.duration"){
			document.getElementById("v_scopedura").style.display="none";
		}
		
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="admin.name"){//不能为空
			document.getElementById("v_adminname").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="admin.name"){
			document.getElementById("v_adminname").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="admin.pass"){//不能为空
			document.getElementById("v_adminpass").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="admin.pass"){
			document.getElementById("v_adminpass").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="admin.realName"){//不能为空
			document.getElementById("v_adminrname").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="admin.realName"){
			document.getElementById("v_adminrname").style.display="none";
		}
		if(!this.value.match("^[1][3-8]+\\d{9}$")&&this.name=="admin.phone"){//11位数字
			document.getElementById("v_adminphone").style.display="block";
		}
		else if(this.value.match("^[1][3-8]+\\d{9}$")&&this.name=="admin.phone"){
			document.getElementById("v_adminphone").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="admin.occupation"){//不能为空
			document.getElementById("v_adminoccu").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="admin.occupation"){
			document.getElementById("v_adminoccu").style.display="none";
		}
		
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="customer.name"){//不能为空
			document.getElementById("v_custname").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="customer.name"){
			document.getElementById("v_custname").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="customer.pass"){//不能为空
			document.getElementById("v_custpass").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="customer.pass"){
			document.getElementById("v_custpass").style.display="none";
		}
		
		if(this.name=="customer.pass"&&this.value!=document.getElementById("confirmpass").value){//密码确认
			document.getElementById("v_custpassagain").style.display="block";
		}
		else if(this.name=="customer.pass"&&this.value==document.getElementById("confirmpass").value){
			document.getElementById("v_custpassagain").style.display="none";
		}
		if(this.name=="confirmpass"&&this.value!=document.getElementById("customerpass").value){//密码确认
			document.getElementById("v_custpassagain").style.display="block";
		}
		else if(this.name=="confirmpass"&&this.value==document.getElementById("customerpass").value){
			document.getElementById("v_custpassagain").style.display="none";
		}
		
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="customer.realName"){//不能为空
			document.getElementById("v_custrname").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="customer.realName"){
			document.getElementById("v_custrname").style.display="none";
		}
		if(!this.value.match("^[1][3-8]+\\d{9}$")&&this.name=="customer.mobilephone"){//不能为空
			document.getElementById("v_custmphone").style.display="block";
		}
		else if(this.value.match("^[1][3-8]+\\d{9}$")&&this.name=="customer.mobilephone"){
			document.getElementById("v_custmphone").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="customer.address"){//不能为空
			document.getElementById("v_custadd").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="customer.address"){
			document.getElementById("v_custadd").style.display="none";
		}
		if(this.value.replace(/^ +| +$/g,'')==''&&this.name=="role.name"){//不能为空
			document.getElementById("v_rolename").style.display="block";
		}
		else if(this.value.replace(/^ +| +$/g,'')!=''&&this.name=="role.name"){
			document.getElementById("v_rolename").style.display="none";
		}
		
		
	}
	el.init = function() {
		this.parentNode.insertBefore(this.left, this);
		this.parentNode.insertBefore(this.right, this.nextSibling);
		this.dummy.appendChild(this);
		this.right.parentNode.insertBefore(this.dummy, this.right);
		this.className = "NFText";
	}
	el.unload = function() {
		this.parentNode.parentNode.appendChild(this);
		this.parentNode.removeChild(this.left);
		this.parentNode.removeChild(this.right);
		this.parentNode.removeChild(this.dummy);
		this.className = this.oldClassName;
	}
}
function inputRadio(el) { //extent Radio buttons
	el.oldClassName = el.className;
	el.dummy = document.createElement('div');
	if(el.checked) {el.dummy.className = "NFRadio NFh";}
	else {el.dummy.className = "NFRadio";}
	el.dummy.ref = el;
	if(isIE == false) {el.dummy.style.left = findPosX(el) + 'px'; el.dummy.style.top = findPosY(el) + 'px';}
	else {el.dummy.style.left = findPosX(el) + 4 + 'px'; el.dummy.style.top = findPosY(el) + 4 + 'px';}
	el.dummy.onclick = function() {
		if(!this.ref.checked) {
			var siblings = getInputsByName(this.ref.name);
			for(var q = 0; q < siblings.length; q++) {
				siblings[q].checked = false;
				siblings[q].dummy.className = "NFRadio";
			}
			this.ref.checked = true;
			this.className = "NFRadio NFh";
		}
	}
	el.onclick = function() {
		if(this.checked) {
			var siblings = getInputsByName(this.name);
			for(var q = 0; q < siblings.length; q++) {
				siblings[q].dummy.className = "NFRadio";
			}
			this.dummy.className = "NFRadio NFh";
		}
	}
	el.onfocus = function() {this.dummy.className += " NFfocused";}
	el.onblur = function() {this.dummy.className = this.dummy.className.replace(/ NFfocused/g, "");}
	el.init = function() {
		this.parentNode.insertBefore(this.dummy, this);
		el.className = "NFhidden";
	}
	el.unload = function() {
		this.parentNode.removeChild(this.dummy);
		this.className = this.oldClassName;
	}
}
function updateWeightAndVolume(){
	var el = document.getElementsByName("selectedOrderIDList");
	var orderWeight = document.getElementsByName("orderWeight");
	var orderVolume = document.getElementsByName("orderVolume");
	var tow = document.getElementsByName("totalOrderWeight");
	var tov = document.getElementsByName("totalOrderVolume");
	var totleOrderWeight=0.0;
	var totleOrderVolume=0.0;
    var len = el.length;
    for(var i=0; i<len; i++)
    {
        if((el[i].checked == true))
        {
        	totleOrderWeight=totleOrderWeight+parseFloat(orderWeight[i].value);
        	totleOrderVolume=totleOrderVolume+parseFloat(orderVolume[i].value);
        }
    }
    tow[0].value=totleOrderWeight;
    tov[0].value=totleOrderVolume;
    
    el = document.getElementsByName("selectedVehicleIDList");
    var vehicleWeight = document.getElementsByName("vehicleWeight");
    var vehicleVolume = document.getElementsByName("vehicleVolume");
    var tvw = document.getElementsByName("totalVehicleWeight");
    var tvv = document.getElementsByName("totalVehicleVolume");
    var totleVehicleWeight=0.0;
    var totleVehicleVolume=0.0;
    var len = el.length;
    for(var i=0; i<len; i++)
    {
    	if((el[i].checked == true))
    	{
    		totleVehicleWeight=totleVehicleWeight+parseFloat(vehicleWeight[i].value);
    		totleVehicleVolume=totleVehicleVolume+parseFloat(vehicleVolume[i].value);
    	}
    }
    tvw[0].value=totleVehicleWeight;
    tvv[0].value=totleVehicleVolume;
}
function inputCheck(el) { //extend Checkboxes
	el.oldClassName = el.className;
	el.dummy = document.createElement('img');
	el.dummy.src = imagesPath + "0.png";
	if(el.checked) {el.dummy.className = "NFCheck NFh";}
	else {el.dummy.className = "NFCheck";}
	el.dummy.ref = el;
	if(isIE == false) {el.dummy.style.left = findPosX(el) + 'px'; el.dummy.style.top = findPosY(el) + 'px';}
	else {el.dummy.style.left = findPosX(el) + 4 + 'px'; el.dummy.style.top = findPosY(el) + 4 + 'px';}
	el.dummy.onclick = function() {
		if(!this.ref.checked) {
			this.ref.checked = true;
			this.className = "NFCheck NFh";
		}
		else {
			this.ref.checked = false;
			this.className = "NFCheck";
		}
		updateWeightAndVolume();
	}
	el.onclick = function() {
		if(this.checked) {this.dummy.className = "NFCheck NFh";}
		else {this.dummy.className = "NFCheck";}
	}
	el.onfocus = function() {this.dummy.className += " NFfocused";}
	el.onblur = function() {this.dummy.className = this.dummy.className.replace(/ NFfocused/g, "");}
	el.init = function() {
		this.parentNode.insertBefore(this.dummy, this);
		el.className = "NFhidden";
	} 
	el.unload = function() {
		this.parentNode.removeChild(this.dummy);
		this.className = this.oldClassName;
	}
}
function inputSubmit(el) { //extend Buttons
	el.oldClassName = el.className;
	el.left = document.createElement('img');
	el.left.className = "NFButtonLeft";
	el.left.src = imagesPath + "0.png";
	el.right = document.createElement('img');
	el.right.src = imagesPath + "0.png";
	el.right.className = "NFButtonRight";
	el.onmouseover = function() {
		this.className = "NFButton NFh";
		this.left.className = "NFButtonLeft NFh";
		this.right.className = "NFButtonRight NFh";
	}
	el.onmouseout = function() {
		this.className = "NFButton";
		this.left.className = "NFButtonLeft";
		this.right.className = "NFButtonRight";
	}
	el.init = function() {
		this.parentNode.insertBefore(this.left, this);
		this.parentNode.insertBefore(this.right, this.nextSibling);
		this.className = "NFButton";
	}
	el.unload = function() {
		this.parentNode.removeChild(this.left);
		this.parentNode.removeChild(this.right);
		this.className = this.oldClassName;
	}
}
function inputFile(el) { //extend File inputs
	el.oldClassName = el.className;
	el.dummy = document.createElement('div');
	el.dummy.className = "NFFile";
	el.file = document.createElement('div');
	el.file.className = "NFFileNew";
	el.center = document.createElement('div');
	el.center.className = "NFTextCenter";
	el.clone = document.createElement('input');
	el.clone.type = "text";
	el.clone.className = "NFText";
	el.clone.ref = el;
	el.left = document.createElement('img');
	el.left.src = imagesPath + "0.png";
	el.left.className = "NFTextLeft";
	el.button = document.createElement('img');
	el.button.src = imagesPath + "0.png";
	el.button.className = "NFFileButton";
	el.button.ref = el;
	el.button.onclick = function() {this.ref.click();}
	el.init = function() {
		var top = this.parentNode;
		if(this.previousSibling) {var where = this.previousSibling;}
		else {var where = top.childNodes[0];}
		top.insertBefore(this.dummy, where);
		this.dummy.appendChild(this);
		this.center.appendChild(this.clone);
		this.file.appendChild(this.center);
		this.file.insertBefore(this.left, this.center);
		this.file.appendChild(this.button);
		this.dummy.appendChild(this.file);
		this.className = "NFhidden";
		this.relatedElement = this.clone;
	}
	el.unload = function() {
		this.parentNode.parentNode.appendChild(this);
		this.parentNode.removeChild(this.dummy);
		this.className = this.oldClassName;
	}
	el.onchange = el.onmouseout = function() {this.relatedElement.value = this.value;}
	el.onfocus = function() {
		this.left.className = "NFTextLeft NFh";
		this.center.className = "NFTextCenter NFh";
		this.button.className = "NFFileButton NFh";
	}
	el.onblur = function() {
		this.left.className = "NFTextLeft";
		this.center.className = "NFTextCenter";
		this.button.className = "NFFileButton";
	}
	el.onselect = function() {
		this.relatedElement.select();
		this.value = '';
	}
}
function textarea(el) { //extend Textareas
	el.oldClassName = el.className;
	el.height = el.offsetHeight - textareaTopPadding;
	el.width = el.offsetWidth - textareaSidePadding;
	el.topLeft = document.createElement('img');
	el.topLeft.src = imagesPath + "0.png";
	el.topLeft.className = "NFTextareaTopLeft";
	el.topRight = document.createElement('div');
	el.topRight.className = "NFTextareaTop";
	el.bottomLeft = document.createElement('img');
	el.bottomLeft.src = imagesPath + "0.png";
	el.bottomLeft.className = "NFTextareaBottomLeft";
	el.bottomRight = document.createElement('div');
	el.bottomRight.className = "NFTextareaBottom";
	el.left = document.createElement('div');
	el.left.className = "NFTextareaLeft";
	el.right = document.createElement('div');
	el.right.className = "NFTextareaRight";
	el.init = function() {
		var top = this.parentNode;
		if(this.previousSibling) {var where = this.previousSibling;}
		else {var where = top.childNodes[0];}
		top.insertBefore(el.topRight, where);
		top.insertBefore(el.right, where);
		top.insertBefore(el.bottomRight, where);
		this.topRight.appendChild(this.topLeft);
		this.right.appendChild(this.left);
		this.right.appendChild(this);
		this.bottomRight.appendChild(this.bottomLeft);
		el.style.width = el.topRight.style.width = el.bottomRight.style.width = el.width + 'px';
		el.style.height = el.left.style.height = el.right.style.height = el.height + 'px';
		this.className = "NFTextarea";
	}
	el.unload = function() {
		this.parentNode.parentNode.appendChild(this);
		this.parentNode.removeChild(this.topRight);
		this.parentNode.removeChild(this.bottomRight);
		this.parentNode.removeChild(this.right);
		this.className = this.oldClassName;
		this.style.width = this.style.height = "";
	}
	el.onfocus = function() {
		this.topLeft.className = "NFTextareaTopLeft NFh";
		this.topRight.className = "NFTextareaTop NFhr";
		this.left.className = "NFTextareaLeftH";
		this.right.className = "NFTextareaRightH";
		this.bottomLeft.className = "NFTextareaBottomLeft NFh";
		this.bottomRight.className = "NFTextareaBottom NFhr";
	}
	el.onblur = function() {
		this.topLeft.className = "NFTextareaTopLeft";
		this.topRight.className = "NFTextareaTop";
		this.left.className = "NFTextareaLeft";
		this.right.className = "NFTextareaRight";
		this.bottomLeft.className = "NFTextareaBottomLeft";
		this.bottomRight.className = "NFTextareaBottom";
	}
}
function selects(el) { //extend Selects
	el.oldClassName = el.className;
	el.dummy = document.createElement('div');
	el.dummy.className = "NFSelect";
	el.dummy.style.width = el.offsetWidth + 'px';
	el.dummy.ref = el;
	el.left = document.createElement('img');
	el.left.src = imagesPath + "0.png";
	el.left.className = "NFSelectLeft";
	el.right = document.createElement('div');
	el.right.className = "NFSelectRight";
	el.txt = document.createTextNode(el.options[0].text);
	el.bg = document.createElement('div');
	el.bg.className = "NFSelectTarget";
	el.bg.style.display = "none";
	el.opt = document.createElement('ul');
	el.opt.className = "NFSelectOptions";
	el.dummy.style.left = findPosX(el) + 'px';
	el.dummy.style.top = findPosY(el) + 'px';
	el.opts = new Array(el.options.length);
	el.init = function(pos) {
		this.dummy.appendChild(this.left);
		this.right.appendChild(this.txt);
		this.dummy.appendChild(this.right);
		this.bg.appendChild(this.opt);
		this.dummy.appendChild(this.bg);
		for(var q = 0; q < this.options.length; q++) {
			this.opts[q] = new option(this.options[q], q);
			this.opt.appendChild(this.options[q].li);
			this.options[q].lnk.onclick = function() {
				this._onclick();
				this.ref.dummy.getElementsByTagName('div')[0].innerHTML = this.ref.options[this.pos].text;
				this.ref.options[this.pos].selected = "selected";
				for(var w = 0; w < this.ref.options.length; w++) {this.ref.options[w].lnk.className = "";}
				this.ref.options[this.pos].lnk.className = "NFOptionActive";
			}
		}
		if(this.options.selectedIndex) {
			this.dummy.getElementsByTagName('div')[0].innerHTML = this.options[this.options.selectedIndex].text;
			this.options[this.options.selectedIndex].lnk.className = "NFOptionActive";
		}
		this.dummy.style.zIndex = 999 - pos;
		this.parentNode.insertBefore(this.dummy, this);
		this.className = "NFhidden";
	}
	el.unload = function() {
		this.parentNode.removeChild(this.dummy);
		this.className = this.oldClassName;
	}
	el.dummy.onclick = function() {
		var allDivs = document.getElementsByTagName('div'); for(var q = 0; q < allDivs.length; q++) {if((allDivs[q].className == "NFSelectTarget") && (allDivs[q] != this.ref.bg)) {allDivs[q].style.display = "none";}}
		if(this.ref.bg.style.display == "none") {this.ref.bg.style.display = "block";}
		else {this.ref.bg.style.display = "none";}
		if(this.ref.opt.offsetHeight > selectMaxHeight) {
			this.ref.bg.style.width = this.ref.offsetWidth - selectRightWidthScroll + 33 + 'px';
			this.ref.opt.style.width = this.ref.offsetWidth - selectRightWidthScroll + 'px';
		}
		else {
			this.ref.bg.style.width = this.ref.offsetWidth - selectRightWidthSimple + 33 + 'px';
			this.ref.opt.style.width = this.ref.offsetWidth - selectRightWidthSimple + 'px';
		}
	}
	el.bg.onmouseout = function(e) {
		if (!e) var e = window.event;
		e.cancelBubble = true;
		if (e.stopPropagation) e.stopPropagation();
		var reltg = (e.relatedTarget) ? e.relatedTarget : e.toElement;
		if((reltg.nodeName == 'A') || (reltg.nodeName == 'LI') || (reltg.nodeName == 'UL')) return;
		if((reltg.nodeName == 'DIV') || (reltg.className == 'NFSelectTarget')) return;
		else{this.style.display = "none";}
	}
	el.dummy.onmouseout = function(e) {
		if (!e) var e = window.event;
		e.cancelBubble = true;
		if (e.stopPropagation) e.stopPropagation();
		var reltg = (e.relatedTarget) ? e.relatedTarget : e.toElement;
		if((reltg.nodeName == 'A') || (reltg.nodeName == 'LI') || (reltg.nodeName == 'UL')) return;
		if((reltg.nodeName == 'DIV') || (reltg.className == 'NFSelectTarget')) return;
		else{this.ref.bg.style.display = "none";}
	}
	el.onfocus = function() {this.dummy.className += " NFfocused";}
	el.onblur = function() {this.dummy.className = this.dummy.className.replace(/ NFfocused/g, "");}
	el.onkeydown = function(e) {
		if (!e) var e = window.event;
		var thecode = e.keyCode;
		var active = this.selectedIndex;
		switch(thecode){
			case 40: //down
				if(active < this.options.length - 1) {
					for(var w = 0; w < this.options.length; w++) {this.options[w].lnk.className = "";}
					var newOne = active + 1;
					this.options[newOne].selected = "selected";
					this.options[newOne].lnk.className = "NFOptionActive";
					this.dummy.getElementsByTagName('div')[0].innerHTML = this.options[newOne].text;
				}
				return false;
				break;
			case 38: //up
				if(active > 0) {
					for(var w = 0; w < this.options.length; w++) {this.options[w].lnk.className = "";}
					var newOne = active - 1;
					this.options[newOne].selected = "selected";
					this.options[newOne].lnk.className = "NFOptionActive";
					this.dummy.getElementsByTagName('div')[0].innerHTML = this.options[newOne].text;
				}
				return false;
				break;
			default:
				break;
		}
	}
}
function multiSelects(el) { //extend Multiple Selects
	el.oldClassName = el.className;
	el.height = el.offsetHeight;
	el.width = el.offsetWidth;
	el.topLeft = document.createElement('img');
	el.topLeft.src = imagesPath + "0.png";
	el.topLeft.className = "NFMultiSelectTopLeft";
	el.topRight = document.createElement('div');
	el.topRight.className = "NFMultiSelectTop";
	el.bottomLeft = document.createElement('img');
	el.bottomLeft.src = imagesPath + "0.png";
	el.bottomLeft.className = "NFMultiSelectBottomLeft";
	el.bottomRight = document.createElement('div');
	el.bottomRight.className = "NFMultiSelectBottom";
	el.left = document.createElement('div');
	el.left.className = "NFMultiSelectLeft";
	el.right = document.createElement('div');
	el.right.className = "NFMultiSelectRight";
	el.init = function() {
		var top = this.parentNode;
		if(this.previousSibling) {var where = this.previousSibling;}
		else {var where = top.childNodes[0];}
		top.insertBefore(el.topRight, where);
		top.insertBefore(el.right, where);
		top.insertBefore(el.bottomRight, where);
		this.topRight.appendChild(this.topLeft);
		this.right.appendChild(this.left);
		this.right.appendChild(this);
		this.bottomRight.appendChild(this.bottomLeft);
		el.style.width = el.topRight.style.width = el.bottomRight.style.width = el.width + 'px';
		el.style.height = el.left.style.height = el.right.style.height = el.height + 'px';
		el.className = "NFMultiSelect";
	}
	el.unload = function() {
		this.parentNode.parentNode.appendChild(this);
		this.parentNode.removeChild(this.topRight);
		this.parentNode.removeChild(this.bottomRight);
		this.parentNode.removeChild(this.right);
		this.className = this.oldClassName;
		this.style.width = this.style.height = "";
	}
	el.onfocus = function() {
		this.topLeft.className = "NFMultiSelectTopLeft NFh";
		this.topRight.className = "NFMultiSelectTop NFhr";
		this.left.className = "NFMultiSelectLeftH";
		this.right.className = "NFMultiSelectRightH";
		this.bottomLeft.className = "NFMultiSelectBottomLeft NFh";
		this.bottomRight.className = "NFMultiSelectBottom NFhr";
	}
	el.onblur = function() {
		this.topLeft.className = "NFMultiSelectTopLeft";
		this.topRight.className = "NFMultiSelectTop";
		this.left.className = "NFMultiSelectLeft";
		this.right.className = "NFMultiSelectRight";
		this.bottomLeft.className = "NFMultiSelectBottomLeft";
		this.bottomRight.className = "NFMultiSelectBottom";
	}
}
function option(el, no) { //extend Options
	el.li = document.createElement('li');
	el.lnk = document.createElement('a');
	el.lnk.href = "javascript:;";
	el.lnk.ref = el.parentNode;
	el.lnk.pos = no;
	el.lnk._onclick = el.onclick || function () {};
	el.txt = document.createTextNode(el.text);
	el.lnk.appendChild(el.txt);
	el.li.appendChild(el.lnk);
}

//Get Position
function findPosY(obj) {
	var posTop = 0;
	do {posTop += obj.offsetTop;} while (obj = obj.offsetParent);
	return posTop;
}
function findPosX(obj) {
	var posLeft = 0;
	do {posLeft += obj.offsetLeft;} while (obj = obj.offsetParent);
	return posLeft;
}
//Get Siblings
function getInputsByName(name) {
	var inputs = document.getElementsByTagName("input");
	var w = 0; var results = new Array();
	for(var q = 0; q < inputs.length; q++) {if(inputs[q].name == name) {results[w] = inputs[q]; ++w;}}
	return results;
}

//Add events
var existingLoadEvent = window.onload || function () {};
var existingResizeEvent = window.onresize || function() {};
window.onload = function () {
    existingLoadEvent();
    NFInit();
}
/*
window.onresize = function() {
	if(resizeTest != document.documentElement.clientHeight) {
		existingResizeEvent();
		NFFix();
	}
	resizeTest = document.documentElement.clientHeight;
}*/