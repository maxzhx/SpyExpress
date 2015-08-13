<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
</head>
<body>
<div id="main_container">

	<jsp:include page="header.jsp" />   
    <div class="main_content">   
    <jsp:include page="menu.jsp" />                  
    <div class="center_content">       
    <jsp:include page="left.jsp"/>
    
<div class="right_content">
        
         <h2>生成交接单</h2> 
         <s:form name="fomr1" action="selectOrderAndVehicle.action" enctype="multipart/form-data" 
								javascriptTooltip="true">
               <fieldset>
               	<table border="0" cellpadding="4" cellspacing="1" style="width:100%" height="20"  class="niceform">
							
                   <tr>

                  
                   <td align="right" valign="top"><br/><label>源地址</label><br/><br/><label>目的地址</label></td>
                   <td valign="baseline">

								<s:doubleselect  name="sourceStationID"
									list="sourceStationList" listValue="name" listKey="id" value="sourceStationID"
									doubleList="destStationMap.get(top.id)" doubleListValue="name" doubleListKey="id"
									doubleName="destStationID" />
			          <td/>
                     </tr>
                     <tr>
                     <tr class="submit">
				  
				     <td colspan="4" align="center">
                    <span class="bt_red_lft"></span><strong><s:submit value="下一步" cssClass="btn btn-primary" /></strong><span class="bt_blue_r"></span>
                    </td>
                    
					
                     </tr>
                    
                  </table>
                </fieldset>
                  </s:form>
     
     </div><!-- end of right content-->
                              
     </div>   <!--end of center content -->               
                     
     <div class="clear"></div>
     </div> <!--end of main content-->
	
    <jsp:include page="footer.jsp" flush="true"/>

</div>		
</body>
</html>