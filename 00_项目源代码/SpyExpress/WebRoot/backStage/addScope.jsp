<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.ttd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_Scope()
  {
	   if((document.getElementById("scopeFKP").value=="")||(document.getElementById("scopeKP").value=="")
		||(document.getElementById("scopeFCP").value=="")||(document.getElementById("scopeCP").value=="")
		   ||(document.getElementById("scopedura").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="addScope.action";
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
        
        <h2>添加配送范围</h2>
     
         <div class="form">
       
         <s:form  name="form1" method="post" action="" class="niceform">
         
                <fieldset>
                <table border="0" cellpadding="4" cellspacing="1" style="witdh:100%" height="20"  class="niceform">
							
                   <tr>
                   <td style="width:50px"/>
                  <td align="right" valign="top"><br/><label>源地址</label><br/><br/><label>目的地址</label></td>
                   <td valign="baseline">

								<s:doubleselect  name="sourceID"
									list="stationLists" listValue="name" listKey="id"
									doubleList="destStationMap.get(top.id)" doubleListValue="name" doubleListKey="id"
									doubleName="destID" />
			          <td/> 
			         </tr>
                   <%--  <tr>
                    <td><label for="gender">配送点：&nbsp;</label></td>
                    <td style="margin-left:200px;height:80px;"> 
                    <s:doubleselect  name="sourceStationID"
						list="stationLists" listValue="name" listKey="id" value="sourceStationID"
						doubleList="destStationMap.get(top.id)" doubleListValue="name" doubleListKey="id"
						doubleName="destStationID"/>
					 </td> --%>
                        <!--  <td><label for="gender">源配送点&nbsp;</label></td>
                        <td>
                            <s:select list="stationList"  listValue="name" listKey="id" 
                            name="scope.stationBySourceStaId.id"  value="scope.stationBySourceStaId.id"></s:select>
                        </td>
                    </tr>
                     <tr>
                        <td><label for="gender">目的配送点&nbsp;</label></td>
                        <td>
                            <s:select list="stationList"  listValue="name" listKey="id" 
                            name="scope.stationByDestStaId.id"  value="scope.stationByDestStaId.id"></s:select>
                        </td>-->
                  <!--   </tr> -->
					 <tr>
					 <td/>
                        <td align="right"><label for="password">首公斤价格(元/kg)&nbsp;&nbsp;&nbsp;</label></td>
                          <td><s:textfield name="scope.firstKgPrice" id="scopeFKP"/>
                          <div id="v_scopeFKP" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div>
                          </td>
                    </tr>
                     <tr>
                     <td/>
                        <td align="right"><label for="password">次公斤价格(元/kg)&nbsp;&nbsp;&nbsp;</label></td>
                       <td><s:textfield name="scope.kgPrice" id="scopeKP"/>
                       <div id="v_scopeKP" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
                    </tr>
                     <tr>
                     <td/>
                        <td align="right"><label for="password">首立方价格(元/m³)&nbsp;&nbsp;&nbsp;</label></td>
                         <td><s:textfield name="scope.firstCubicPrice" id="scopeFCP"/>
                         <div id="v_scopeFCP" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
                    </tr>
                     <tr>
                     <td/>
                        <td align="right"><label for="password">次立方价格(元/m³)&nbsp;&nbsp;&nbsp;</label></td>
                         <td><s:textfield name="scope.cubicPrice" id="scopeCP"/>
                         <div id="v_scopeCP" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
                    </tr>
					  <tr>
					  <td/>
                        <td align="right"><label for="password">配送时长(h)&nbsp;&nbsp;&nbsp;</label></td>
                       <td><s:textfield name="scope.duration" id="scopedura"/>
                       <div id="v_scopedura" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">必须是数字.</label>
                        </div></td>
                    </tr>
					  <tr>
					  <td/>
                        <td align="right"><label for="comments">备注信息&nbsp;&nbsp;&nbsp;</label></td>
                         <td><s:textarea name="scope.note" /></td>
                    </tr>
                     <tr class="submit">
                      <td colspan="4" align="center">
                    <input  type="button"  onclick="verify_Scope();" value="提交" /></td>
                     <!-- onClick=window.open("scopeInfo.jsp") -->
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