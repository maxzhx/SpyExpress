<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="com.spy.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>烟草物流前台系统</title>
</head>
<body>   
    
            <div class="sidebarmenu">
            <% 
               if((Customer)session.getAttribute("customer")!=null){%>
               <a class="menuitem" href="frontnewOrder.action">快速下单</a>
                
                <a class="menuitem_green" href="checkOrder.action">查询订单</a>
                <%}else{ %>
                <a class="menuitem" href="login.jsp">快速下单</a>
                
                <a class="menuitem_green" href="login.jsp">查询订单</a>
                <% }%>  
                <a class="menuitem_red" href="about.jsp">关于</a>
                    
            </div>
  
            <div class="sidebar_box">
                <div class="sidebar_box_top"></div>
                <div class="sidebar_box_content">
                <h3>系统简介</h3>
                <img src="../images/info.png" alt="" title="" class="sidebar_icon_right" />
                <p>SPY组倾心设计最新烟草物流管理系统</p>                
                </div>
                <div class="sidebar_box_bottom"></div>
            </div>
            
            <div class="sidebar_box">
                <div class="sidebar_box_top"></div>
                <div class="sidebar_box_content">
                <h5>联系我们</h5>
                <img src="../images/photo.png" alt="" title="" class="sidebar_icon_right" />
                <p>
电话：0592-888888</p>
                <p>qq：888888</p>
                <p>传真：0592-999999</p>
                </div>
                <div class="sidebar_box_bottom"></div>
            </div>  		
</body>
</html>