<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
     <%@ page import="com.spy.entity.*"%>
     <%@ page import="org.springframework.context.ApplicationContext"%>
     <%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.spy.action.UserAction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
</head>
<body>
<div class="header">
    <div class="logo"><a href="index.jsp"><img src="../images/logo.gif" alt="" title="" border="0" /></a></div>
    
     <% 
     Admin admin1=(Admin)session.getAttribute("admin");
     if(admin1==null){
    	 Cookie[] cookies = request.getCookies();
         if(cookies!=null){
         if(cookies.length!=1){
        	 ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        	 System.out.print("---------------------");
     	     UserAction action = (UserAction) ctx.getBean("userAction");
        	 action.setUsername(cookies[0].getValue());
        	 action.setPassword(cookies[1].getValue());
        	 action.adminLogin();
         	}
         }
     }
     Admin admin=(Admin)session.getAttribute("admin");
   if(admin!=null){ %> 
    <div class="right_header">欢迎  ${sessionScope.admin.realName}  | <a href="backLogout.action" class="logout" >退出</a></div>
    <%}else{ %>
    <div class="right_header"><a href="login.jsp" >登录</a>  | <a class="messages">专注好烟500年</a></a></div>
    <%} %>
 
    <div id="clock_a"></div>
    </div>
</body>
</html>