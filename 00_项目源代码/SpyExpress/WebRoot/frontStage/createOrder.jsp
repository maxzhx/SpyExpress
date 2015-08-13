<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>烟草物流前台系统</title>
   <!--<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
 		<script>  $(function() {    $( "#datepicker" ).datepicker();  }); 
      </script>-->
      <script>
  function verify_order1()
  {
	   if((document.getElementById("order_revcName").value=="")||(document.getElementById("ordercustomermobile").value=="")
		||(document.getElementById("ordercustomeradd").value=="")||(document.getElementById("orderweight1").value=="")
		   ||(document.getElementById("ordervolume1").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		   	form1.action="frontaddOrder.action";
		   	form1.submit();
		 }
  }
  </script>
      </head>
      
<body>
<%@ include file="calendar.jsp" %>

<div id="main_container">

	<%@ include file="head.jsp" %>
    
    <div class="main_content">
    
    <%@ include file="menu.jsp" %>
                 
    <div class="center_content">  
    
    
    
    <div class="left_content">
    
    		<%@ include file="left.jsp" %>
    </div>  
    
    <div class="right_content">            
      <!--<input class="Wdate" type="text"  onfocus="new WdatePicker(this,'%Y-%M-%D %h:%m:%s',true)" /> 
    -->
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;下单</h2> 
   	<div class="form">
         <form name="form1" method="post" class="niceform">
         <fieldset>	
        	<table border="0" cellpadding="4" cellspacing="1" style="width:100%" height="20">
                  
                  <tr> 
                   <td align="center" width="60px;"> 
                   <label for="comments" align="center">发货地:</label></td>
                       <td>  <s:select list="stationList"  listValue="name" listKey="id" 
                            name="sourceStationID"></s:select>
					</td>
                	</tr>
                	<tr style="height:15px;"></tr>
               		 <tr>
                        <td align="center"><label for="comments">目的地:</label></td>
                        <td> <s:select list="stationList"  listValue="name" listKey="id" 
                            name="destStationID"></s:select>
						</td>
						<td/>
                 	</tr> 
                 <tr style="height:15px;"></tr><%--
                 <tr>
       				<td align="center" width="146px"><label for="comments" > 配送时间:</label></td>
       				<td><input type="text" size="22"    id="celandar_select"/>   
                </td><!--class="date_select"  style="border-radius: 6px;"
                --><td/>    
                <!--
                 <td align="center"><label for="comments">发货日期:</label></td>
				<td> <input class="Wdate" type="text"  onfocus="new WdatePicker(this,'%Y-%M-%D %h:%m:%s',true)" /> </td>
				-->
				</tr>
				--%><tr style="height:15px;"></tr>
                   <tr> 
                   	<td dir=""></td>
					<td align="left"><label for="comments">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;寄件人资料</label></td>
					<td/>
					<td align="left"><label for="comments">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货人资料</label></td>
					</tr>
                 
                    <tr>
                        <td align="center"><label for="comments">姓名:</label></td>
                        <td><s:textfield name="order.customer.realName" /></td>
                        <td/>
						<td>
							<s:textfield name="order.recvName"  id="order_revcName"/>
							  <div id="v_orname" style="" class="verify">
                      			<image src="../images/error.gif"/>
                      			<label style="" class="verify-label">不能为空.</label>
                      		 </div>
						</td>
                    </tr>
                     <tr>
                        <td align="center"><label for="comments">电话:</label></td>
                       <td><s:textfield name="order.customer.mobilephone" id="ordercustomermobile"/></td>
                       <td/>
						<td><s:textfield name="order.recvPhone" />
						<div id="v_orphone" style="" class="verify">
                      			<image src="../images/error.gif"/>
                      			<label style="" class="verify-label">11位手机号.</label>
                      		 </div>
                      	</td>
                    </tr>
				    <tr>
                        <td align="center"><label for="comments">地址:</label></td>
                       <td><s:textfield name="order.customer.address" id="ordercustomeradd"/></td>
                       <td style="width:5px;"/>
						<td style="width:290px;"><s:textfield name="order.recvAddress" />
						<div id="v_oraddress" style="" class="verify">
                      			<image src="../images/error.gif"/>
                      			<label style="" class="verify-label">不能为空.</label>
                      	</div></td>
                    </tr>
                    <tr/>
               	 <tr>
                 <td colspan="2"><h3>&nbsp;&nbsp;货物信息填写</h3></td></tr>
				<tr>
				<td align="center" ><label for="comments">重量(kg):</label></td>
					<td style="width:290px;"><s:textfield name="order.weight" id="orderweight1"/>
					 <div id="v_orweight" style="" class="verify">
                      			<image src="../images/error.gif"/>
                      			<label style="" class="verify-label">必须是数字.</label>
                      		 </div>
                    </td>
				</tr>
					<tr>
				   <td align="center"><label for="comments">体积(m³):</label></td>
					<td><s:textfield name="order.volume" id="ordervolume1"/>
					<div id="v_orvolume" style="" class="verify">
                      			<image src="../images/error.gif"/>
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
                  <input  type="button"  onclick="verify_order1();" value="提交" />
					 </td>
                  <td/>
                     </tr>
                     </table>
                    
                     
                    
                </fieldset>
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