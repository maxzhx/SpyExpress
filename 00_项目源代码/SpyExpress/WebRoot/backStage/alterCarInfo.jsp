<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_mVehicle()
  {
	   if((document.getElementById("vehicleLicense").value=="")||(document.getElementById("vehicleModel").value=="")
		||(document.getElementById("vehicleManufac").value=="")||(document.getElementById("vehicleCapa").value=="")
		   ||(document.getElementById("vehicleVolume").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="updateVehicle.action";
		   	form1.submit();
		 }
  }
  </script>
</head>
<body>
<jsp:include page="../frontStage/calendar.jsp"></jsp:include>

<div id="main_container">
    
<jsp:include page="header.jsp" />   
    <div class="main_content">   
    <jsp:include page="menu.jsp" />                  
    <div class="center_content">       
    <jsp:include page="left.jsp"/>
    
<div class="right_content">            
        
        <h2>修改车辆信息</h2>
     	
         <div class="form">
         <s:form name="form1" action="" method="post">
         
                <fieldset>
                	 <table id="dd" border="0" cellpadding="6" cellspacing="1" style="width:100%" height="20" class="niceform">
                 	
                 	<tr>
                    <td align="center" width="180px"><label for="email">车辆编号</label></td>
                    <td ><s:label name="vehicle.id" readonly="true" />
                    </td>
                 	</tr>
                
                	<tr>
                		<td align="center"><label for="email">车牌号</label></td>
                        <td><s:textfield name="vehicle.license" id="vehicleLicense"/>
                        <div  style="display:block;" class="verify">
                        <image src="../images/icon-info.gif" style="width:16px;height:16px;"></image>
                        <label style="" class="verify-label">形如:闽D-71H01</label>
                        </div></td>
                      
                   </tr>
                   
                	<tr>
                		<td align="center"><label for="email">状态</label></td>
                        <td><s:select list="#{1:'空闲',2:'在途',3:'调度中'}" id="selectType" name="vehicle.status" value="vehicle.status">
             </s:select> </td>
                      
                   </tr>

                    <tr>
                        <td align="center"><label for="email">车辆型号</label></td>
                        <td><s:textfield name="vehicle.model" id="vehicleModel"/>
                        <div id="v_vemodel" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></td>
                       
                    </tr>
                    <tr>
                        <td align="center"><label for="password">生产厂家</label></td>
                        <td><s:textfield name="vehicle.manufacturer" id="vehicleManufac"/>
                        <div id="v_vemanufacturer" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></td>
                    </tr>
                   <tr>
                        <td align="center"><label for="password">购买时间</label></td>
                        <td><s:textfield name="vehicle.timeBuying"  id="celandar_select"
                        /></td><!--onfocus="CalendarWebControl.show(this,true,this.value);" 
                    --></tr>
                    <tr>
                        <td align="center" width="150px"><label for="password">载重量(kg)</label></td>
                        <td><s:textfield name="vehicle.capacity" id="vehicleCapa"/>
                        <div id="v_vecapacity" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
                    </tr>
                     <tr>
                        <td align="center"><label for="password">体积(m³)</label></td>
                        <td><s:textfield name="vehicle.volume" id="vehicleVolume"/>
                        <div id="v_vevolume" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
                    </tr>
                    <tr>
                        <td align="center"><label for="gender">配送路线</label></td>
                        <td>
                        <s:if test="%{stationID!=vehicle.stationByDestId.id}">
							 <s:doubleselect  name="vehicle.stationBySourceId.id"
									list="stationList" listValue="name" listKey="id" value="vehicle.stationBySourceId.id"
									doubleList="destStationMap.get(top.id)" doubleListValue="name" doubleListKey="id"
									doubleName="vehicle.stationByDestId.id" />
						</s:if>
						<s:else>
						<s:doubleselect  name="vehicle.stationBySourceId.id"
									list="destStationList" listValue="name" listKey="id"
									doubleList="stationList" doubleListValue="name" doubleListKey="id"
									doubleName="vehicle.stationByDestId.id" />
						</s:else>
                        </td>
                    </tr>
                    <tr>
                        <td align="center"><label for="password">交接单编号</label></td>
                        <td><s:textfield name="vehicle.receipt.id" />
                        <div id="v_vehiclereceipt" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">形如:10000011</label>
                        </div></td>
                    </tr>
                    <tr>
                        <td><label></label></td>
                        
                    </tr>
                    <tr>
                    <td></td>
                     <td class="submit" align="left">
                    <input  type="button"  onclick="verify_mVehicle();" value="提交" />
                    <!-- onClick=window.open("carInfo.jsp") -->
                     </td>
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