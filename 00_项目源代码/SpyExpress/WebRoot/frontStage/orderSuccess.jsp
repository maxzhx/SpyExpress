<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>烟草物流前台系统</title>
</head>
<body>
<div id="main_container">

	<%@ include file="head.jsp" %>
    
    <div class="main_content">
    
    <%@ include file="menu.jsp" %>
                 
    <div class="center_content">  
    
    
    
    <div class="left_content">
    
    		<%@ include file="left.jsp" %>
    </div>  
    
     <div class="right_content">  
	      
         <div class="valid_box">
           <div align="center">
             <p align="left"><span class="STYLE4">下单成功!</span></p>
             <p align="left">		   <br/>
               <a href="showOrderWhenAddOrder.action" class="STYLE5"> 查看详情</a> </p>
           </div>
        </div>
   
    </div>
    <!-- end of right content-->
                  
  </div>   <!--end of center content -->               

    <div class="clear"></div>
    </div> <!--end of main content-->

    <div class="footer">
    	<%@ include file="foot.jsp" %>  
    </div>

</div>		
</body>
</html>