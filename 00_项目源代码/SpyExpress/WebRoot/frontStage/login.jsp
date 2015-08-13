
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>烟草物流前台系统</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddaccordion.js"></script>
<script type="text/javascript" src="../js/ymPrompt.js"></script>
<link rel="stylesheet" type="text/css" href="../css/dmm-green/ymPrompt.css" />
<script type="text/javascript">
ddaccordion.init({
	headerclass: "submenuheader", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", ""], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["suffix", "<img src='../images/plus.gif' class='statusicon' />", "<img src='../images/minus.gif' class='statusicon' />"], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})
</script>

<script type="text/javascript" src="../js/jconfirmaction.jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('.ask').jConfirmAction();
	});
	
</script>
<script>
  function verify_login_()
  {
	  var isclick = document.getElementById("isclick");
	  	document.getElementById("click").value = isclick.checked;
	   //ymPrompt.alert('zhe ！',null,null,'提示');
	   //if(document.getElementsByName("username").value!=""&&document.getElementsByName("password").value!="")
	   if(document.getElementById("username_").value==""){
		   ymPrompt.alert("请填写用户名.",220,170,'提示');
	   }
	   else if(document.getElementById("password_").value==""){
		   ymPrompt.alert("请输入密码.",220,170,'提示');
	   }
	   else{
		 	form1.action="customerLogin.action";
		   	form1.submit();
		 }
  }
</script>
<script language="javascript" type="text/javascript" src="../js/niceforms.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../css/niceforms-default.css" />

</head>
<body>
<div id="main_container">

	<div class="header_login">
	
    <div class="logo"><a href="index.html"><img src="../images/logo.gif" alt="" title="" border="0" /></a></div>
    
    </div>

     
         <div class="login_form">
         <h3 style="font-size:24px;font-weight: bold;">用户登陆</h3>
         
         <a href="#" class="forgot_pass">忘记密码</a> 
         
         <form name="form1" action="customerLogin.action" method="post" class="niceform">
         <s:hidden id="click" name="isclick"/>
                <fieldset>
                    <dl>
                        <dt><label for="email">用户名：</label></dt>
                        <dd><s:textfield name="username" id="username_"></s:textfield>
                        <div id="v_username" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">用户名不能为空.</label>
                        </div></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">密码：</label></dt>
                        <dd><s:password name="password" id="password_"></s:password>
                        <div id="v_pass" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">密码不能为空.</label>
                        </div>
                    </dl>
                    
                    <dl>
                        </dl>
                    <dl style="margin-left:20px;margin-top:10px;">
                    <dt ><input type="checkbox" id="isclick" checked="checked"/></dt>
                   	<dd><label>&nbsp;&nbsp;&nbsp;记住我</label></dd>
                    </dl>
                   
                    </dl>
               		<dl class="submit">
                    <input  type="button"  onclick="verify_login_();" value="登陆" />
                     </dl>
				
		        </fieldset>
                
         </form>
         </div>  
          
	
    
    <div class="footer_login">
    
    	<div class="left_footer_login">IN ADMIN PANEL | Powered by <a href="http://indeziner.com">SPY</a></div>
    	<div class="right_footer_login"><a href="http://indeziner.com"><img src="../images/indeziner_logo.gif" alt="" title="" border="0" /></a></div>
    
    </div>

</div>		
</body>
</html>