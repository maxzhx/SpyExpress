<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.spy.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>烟草物流前台系统</title>
</head>
<body>

    
                    <div class="menu">
                    <ul>
                    <li><a class="current" href="index.jsp">首页</a></li>
                    <% 
                      if((Customer)session.getAttribute("customer")!=null){%>
                    <li><a href="findOrderByCustomer.action">订单管理</a></li>
                    <li><a href="showFrontInfo.action">账号管理</a></li>   
                    <%}else{ %>        
                    <li><a href="login.jsp">订单管理</a></li>
                    <li><a href="login.jsp">账号管理</a></li> 
                    <%} %>   
                    <li><a href="contactUs.jsp">联系我们</a></li>
                    </ul>
                    </div> 	
</body>
</html>