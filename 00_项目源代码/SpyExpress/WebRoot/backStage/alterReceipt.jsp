<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function goback()
  {
	  history.back();
  }
</script>
</head>
<body>
<div id="main_container">

	<jsp:include page="header.jsp" />   
    <div class="main_content">   
    <jsp:include page="menu.jsp" />                  
    <div class="center_content">       
    <jsp:include page="left.jsp"/>
    
    <div class="right_content">            
        
         <h2>&nbsp;&nbsp;&nbsp;交接单信息</h2> 
     <div class="form">
         <form action="" method="post" >
         <fieldset>
               <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <thead>
    	
    </thead>
        <tfoot>
    	<tr>
        	

        </tr>
    </tfoot>
    <tbody>
                  <tr>       
                  		<td align="center" > <label for="comments"> 编号:</label></td>
                   		<td >${receipt.id}</td>    
                   		<td/> 
                   		 <td/>
                   		  <td/> 
                   <td/>             
                  </tr>
               <!--<table border="0" cellpadding="4" cellspacing="1" style="width:100%" height="20" class="niceform">
                   --><tr>
       				<td align="center"><label for="comments" > 源站点:</label></td>
       			
       				<td>${receipt.stationBySourceStaId.name}</td>
                	<td/>
       				<td align="center" ><label for="comments" > 目的站点:</label></td>
       			
       				<td>${receipt.stationByDestStaId.name}</td>
                	   <td/>
					</tr>
					<tr>
       				<td align="center" ><label for="comments" > 状态̬:</label>
       				
       				  <s:if test="%{receipt.status==1}">
                      <td>在途</td>
                      </s:if>
                      <s:else>
                      <td>已到达</td>
                      </s:else>
                	</td>
                	 <td/>
       				<td align="center" ><label for="comments" > 总价格:</label></td>
       				<td>${receipt.income}</td>
                	   <td/>
					</tr>
					 <tr>
       				<td align="center" ><label for="comments" > 总重量:</label></td>
       				<td>${receipt.weight}</td>
                	 <td/>
       				<td align="center"><label for="comments" > 总体积:</label></td>
       				<td>${receipt.volume}</td>
                	     <td/>
					</tr>
					<tr>

                	<td align="center" ><label for="comments" > 承运人:</label></td>
       				<td>
       				<a href="showAdmin.action?adminId=${receipt.adminByCarrierId.id}">${receipt.adminByCarrierId.realName}</a>
       				</td>
                	 <td/>
       				<td align="center"><label for="comments" > 接收人:</label></td>
       				<td>
       				<a href="showAdmin.action?adminId=${receipt.adminByRecipientId.id}">${receipt.adminByRecipientId.realName}</a>
       				</td>
       				 <td/>
					</tr>
					<tr>
					
                	<td align="center" ><label for="comments" > 发送日期:</label></td>
       				<td>${receipt.sendTime}</td>
                	 <td/>
       				<td align="center"><label for="comments" > 接收日期:</label></td>
       				<td>${receipt.recvTime}</td>
       				 <td/>
					</tr>
					<tr style="height:25px;" ></tr>
					
                 <tr> 		
						<td align="center"><label for="comments">编号</label></td>
						<td align="center"><label for="comments">重量</label></td>
						<td align="center"><label for="comments">体积</label></td>
						<td align="center"><label for="comments">价格</label></td>
						<td align="center"><label for="comments">状态</label></td>
						<td align="center"><label for="comments">查看</label></td>
						<td/>
				  </tr>
                 <s:iterator value="orderList">
				<tr> 
                   		
						<td align="center"><s:property value="id"/></td>
						<td align="center"><s:property value="weight"/></td>
						<td align="center"><s:property value="volume"/></td>
						<td align="center"><s:property value="price"/></td>
						
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
						<td><a href="showOrder.action?orderID=<s:property value="id"/>"><img src="../images/info.png" alt="" title="" border="0" /></a></td>
						<td/>
				  </tr>
                 </s:iterator>
                 
                 <tr style="height:25px;"></tr>
                 <tr> 
                   		
						<td align="center"><label for="comments">编号</label></td>
						<td align="center"><label for="comments">车牌</label></td>
						<td align="center"><label for="comments">重量</label></td>
						<td align="center"><label for="comments">体积</label></td>
						<td align="center"><label for="comments">型号</label></td>
						<td align="center"><label for="comments">生产商</label></td>
						<td/>
				  </tr>
                 <s:iterator value="vehicleList">
				<tr> 
                   		
						<td align="center"><s:property value="id"/></td>
						<td align="center"><s:property value="license"/></td>
						<td align="center"><s:property value="capacity"/></td>
						<td align="center"><s:property value="volume"/></td>
						<td align="center"><s:property value="model"/></td>
						<td align="center"><s:property value="manufacturer"/></td>
						<td/>
				  </tr>
                 </s:iterator>
                 
    </tbody>
</table>
                   <a href="javascript:goback();" class="bt_red"><span class="bt_red_lft"></span><strong>返回</strong><span class="bt_red_r"></span></a><a href="#" class="bt_red"></a>    
                </fieldset>
         </form>
         </div>  
     
     </div><!-- end of right content-->
                              
     </div>   <!--end of center content -->               
                     
     <div class="clear"></div>
     </div> <!--end of main content-->
	
    <jsp:include page="footer.jsp" flush="true"/>

</div>		
</body>
</html>