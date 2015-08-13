<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_Vehicle()
  {
	   if((document.getElementById("vehiLicense").value=="")||(document.getElementById("vehiModel").value=="")
		||(document.getElementById("vehiManufac").value=="")||(document.getElementById("vehiCapa").value=="")
		   ||(document.getElementById("vehiVolume").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="addVehicle.action";
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
        
        <h2>添加车辆</h2>
     
         <div class="form">
         <s:form name="form1" action="" method="post" cssClass="niceform">
         
                <fieldset>
                    <dl>
                        <dt><label for="email">车牌号&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="vehicle.license"  id="vehiLicense"/>
                        <div  style="display:block;" class="verify">
                        <image src="../images/icon-info.gif" style="width:16px;height:16px;"></image>
                        <label style="" class="verify-label">形如:闽D-71H01</label>
                        </div></dd>
                    </dl>
                    <dl>
                        <dt><label for="email">车辆型号&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="vehicle.model" id="vehiModel"/>
                        <div id="v_vemodel" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">生产厂家&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="vehicle.manufacturer" id="vehiManufac"/>
                        <div id="v_vemanufacturer" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
                      <dl>
                        <dt><label for="password">购买时间&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="vehicle.timeBuying"  id="celandar_select"/></dd>
                    </dl> 
                    <dl>
                        <dt><label for="password">载重量(kg)&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="vehicle.capacity" id="vehiCapa"/>
                        <div id="v_vecapacity" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">体积(m³)&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="vehicle.volume" id="vehiVolume"/>
                        <div id="v_vevolume" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></dd>
                    </dl>
                     <dl>
                        <dt><label for="gender">选择配送线路&nbsp;</label></dt>
                        <dd>
                        <s:doubleselect  name="vehicle.stationBySourceId.id"
									list="stationList" listValue="name" listKey="id"
									doubleList="destStationMap.get(top.id)" doubleListValue="name" doubleListKey="id"
									doubleName="vehicle.stationByDestId.id" />
                        </dd>
                    </dl>
                    
                    <dl>
                        <dt><label></label></dt>
                        
                    </dl>
                    
                     <dl class="submit">
                     <input  type="button"  onclick="verify_Vehicle();" value="提交" />
                    <!-- onClick=window.open("carInfo.jsp") -->
                     </dl>
                     
                     
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