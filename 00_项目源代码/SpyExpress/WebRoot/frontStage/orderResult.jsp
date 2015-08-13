<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
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
        
    <h2>查询结果</h2> 
     <div class="form">
         <form action="" method="post" class="niceform">
         <%
         Order order=(Order)request.getAttribute("order");
         if(order!=null){ %>
          <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company"></th>
            <th scope="col" class="rounded">订单编号</th>
            <th scope="col" class="rounded">状态</th>
            <th scope="col" class="rounded">重量</th>
			<th scope="col" class="rounded">体积</th>
		    <th scope="col" class="rounded">当前站点</th>	
		    <th scope="col" class="rounded">查看</th>
           
        </tr>
    </thead>
        <tfoot>
    	
    </tfoot>
    <s:iterator value="orderList">
    <tbody>
    	<tr>
        	<td></td>
            <td align="center">${id}</td>
           <s:if test="%{status==1}">
           <td align="center">未确认</td>
           </s:if>
           <s:elseif test="%{status==2}">
           <td align="center">待发货</td>
           </s:elseif>
           <s:elseif test="%{status==3}">
           <td align="center">途中</td>
           </s:elseif>
           <s:elseif test="%{status==4}">
           <td align="center">未收货</td>
           </s:elseif>
           <s:elseif test="%{status==5}">
           <td align="center">已完成</td>
           </s:elseif>
           <s:else>
           <td align="center">已取消</td>
           </s:else>
            <td align="center">${weight}</td>
             <td align="center">${volume}</td>
            <td align="center">${station.name}</td>
            <td align="center"><a href="showOrderfront.action?orderID=<s:property value="id"/>"><img
														src="../images/info.png" alt="" title="" border="0" />
												</a></td>
        </tr>
        
    	  
        
    </tbody>
    </s:iterator>
</table>
<%}else{ %>
	 <h3>无此订单！</h3>
	 <%} %>
         </form>
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