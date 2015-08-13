<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.spy.entity.*"%>
      <%@ page import="org.springframework.context.ApplicationContext"%>
     <%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
     <%@page import="com.spy.action.UserAction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>烟草物流前台系统</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="../css/niceforms-default.css" />
<link rel="stylesheet" type="text/css" href="../css/nivo-slider.css" />
 <link rel="stylesheet" href="../css/themes/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/themes/light/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/themes/dark/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/themes/bar/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../css/dmm-green/ymPrompt.css" />
<script language="javascript" type="text/javascript" src="../js/niceforms.js"></script>
<script type="text/javascript" src="../js/ymPrompt.js"></script>
<script type="text/javascript" src="../js/clockp.js"></script>
<script type="text/javascript" src="../js/clockh.js"></script> 
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddaccordion.js"></script>
<script type="text/javascript" src="../js/ymPrompt.js"></script>
<link rel="stylesheet" type="text/css" href="../css/dmm-green/ymPrompt.css" />

<script type="text/javascript" src="../js/jconfirmaction.jquery.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.ask').jConfirmAction();
	});
	
	$(document).ready(function() {
		$('.tip').jTipAction();
	});
	</script>
<script language="javascript" type="text/javascript" src="../js/niceforms.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../css/niceforms-default.css" />
</head>
<body>

	<div class="header">
    <div class="logo"><a href="index.jsp"><img src="../images/logo.gif" alt="" title="" border="0" /></a></div>
   <% 
   Customer customer1=(Customer)session.getAttribute("customer");
   if(customer1==null){
  	 Cookie[] cookies = request.getCookies();
       if(cookies!=null){
       if(cookies.length!=1){
      	 ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
      	 System.out.print("---------------------");
   	     UserAction action = (UserAction) ctx.getBean("userAction");
      	 action.setUsername(cookies[0].getValue());
      	 action.setPassword(cookies[1].getValue());
      	 action.customerLogin();
       	}
       }
   }
   Customer customer=(Customer)session.getAttribute("customer");
   if(customer!=null){ %> 
    <div class="right_header">欢迎  ${sessionScope.customer.realName}  | <a href="logout.action" class="logout" >退出</a></div>
    <%}else{ %>
    <div class="right_header"><a href="login.jsp" >登录</a>  | <a class="messages">专注好烟500年</a></a></div>
    <%} %>
    <div id="clock_a"></div>
    </div>
                   	
</body>
</html>