<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style> 
    .nobr br{display:none}   
</style>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_order()
  {
	   if((document.getElementById("orderRecvname").value=="")||(document.getElementById("orderRecvphone").value=="")
		||(document.getElementById("orderRecvaddr").value=="")||(document.getElementById("orderRecvaddr").value=="")
		   ||(document.getElementById("orderWeight").value=="")||(document.getElementById("orderVolume").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="backaddOrder.action";
		   	form1.submit();
		 }
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
        
         <h2>&nbsp;&nbsp;&nbsp;&nbsp;生成订单</h2> 
     <div class="form">

        <s:form action="" method="post"  name="form1">

         
        	<fieldset>	
				<table border="0" cellpadding="4" cellspacing="1" style="width:100%" height="20" class="niceform">
                   <tr> 
                  
                   <td align="center"><label>源地址</label><br/><br/><label>目的地址</label></td>
         		<td > 
     		
         		<div class="nobr">
					<s:doubleselect  theme="simple" name="sourceStationID"
					list="stationLists" listValue="name" listKey="id" value="sourceStationID"
					doubleList="destStationMap.get(top.id)" doubleListValue="name" doubleListKey="id"
					doubleName="destStationID"/> 
					</div>
				</td>
  				</tr> 
                 <tr style="height:20px;"></tr>
                   <tr> 
                   	<td dir=""></td>
					<td ><label for="comments">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货人资料</label></td>
					<td />
					<td ><label for="comments">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;寄件人资料</label></td>
					</tr>
                 
                     <tr>
                        <td align="center"><label for="comments">姓名:</label></td>
                        <td style="width:260px;"><s:textfield name="order.recvName" id="orderRecvname"/>
                        <div id="v_orname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></td>
                        <td align="center"><label for="comments">姓名:</label></td>
                        
						<td> <s:select list="customers"  listValue="realName" listKey="id" 
                            name="suctomerID"></s:select>
                  </tr>
                  <tr>
                        <td align="center"><label for="comments">电话:</label></td>
                       	<td><s:textfield name="order.recvPhone"  id="orderRecvphone"/>
                       	<div id="v_orphone" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">11位手机号.</label>
                        </div></td>
                       	<td/>
						<td><%--<s:textfield name="order.recvPhone" /></td>--%>
                  </tr>
				  <tr>
                        <td align="center"><label for="comments">地址:</label></td>
                       	<td><s:textfield name="order.recvAddress" id="orderRecvaddr"/>
                       	<div id="v_oraddress" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></td>
                       	<td/>
						<td><%--<s:textfield name="order.recvAddress" /></td>--%>
                  </tr>
                  <tr/>
               	 <tr>
                <td colspan="2"><h3>&nbsp;&nbsp;货物信息填写</h3></td></tr>
				<tr>
				<td align="center"><label for="comments">重量(kg):</label></td>
					<td><s:textfield name="order.weight"  id="orderWeight"/>
					<div id="v_orweight" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
				</tr>
					<tr>
				   <td align="center"><label for="comments">体积(m³):</label></td>
					<td><s:textfield name="order.volume" id="orderVolume"/>
					<div id="v_orvolume" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
					   
					</tr>
                     <tr>
				   <td align="center"><label for="comments">备注:</label></td>
				     <td><s:textfield name="order.note" /></td>
					</tr>
                   <tr class="submit">
                   <td/>
                   <td align="center">
                    <input  type="button"  onclick="verify_order();" value="提交" />
					 </td>
                  <td/>
                     </tr>
                     </table>
                    
                     
                    
                </fieldset>
         </s:form>
         </div>  
     
     </div><!-- end of right content-->
                              
     </div>   <!--end of center content -->               
                     
     <div class="clear"></div>
     </div> <!--end of main content-->
	
    <jsp:include page="footer.jsp" flush="true"/>

</div>		
</body>
</html>