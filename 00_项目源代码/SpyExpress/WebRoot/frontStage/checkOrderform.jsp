<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="/struts-tags" prefix="s"%>
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
        
    <h2>订单查询</h2> 
     <div class="form">
         <form name="form1" action="findOrderByID.action" method="post" class="niceform">
         
            <dl>
              <dt><label for="email">订单编号:</label></dt>
              <dd><s:textfield name="orderID" /></dd>
             </dl>
                   
         </form>
          <a href="javascript:form1.submit();" class="bt_green"><span class="bt_green_lft"></span><strong>查询</strong><span class="bt_green_r"></span></a>
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