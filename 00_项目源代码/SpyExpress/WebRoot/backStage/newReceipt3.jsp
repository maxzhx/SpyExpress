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
         <div class="form">
         <form name="form1" action="createReceipt.action" method="post" class="niceform">
         
               <fieldset>
                    <dl>
                       <dt>
                         <label for="comments">承运人</label>
                       </dt>
                        <dd><s:select list="carrierList"  listValue="realName" listKey="id" 
                            name="carrierID" ></s:select></dd>
                    </dl>
                   
                    <dl>
                        <dt><label for="comments">接收人</label></dt>
						<dd><s:select list="recipientList"  listValue="realName" listKey="id" 
                            name="recipientID" ></s:select></dd>
                     
                    </dl>
                   
              
                     <dl class="submit">
				
                    <a href="javascript:form1.submit();" class="bt_blue"><span class="bt_red_lft"></span><strong>生成交接单</strong><span class="bt_blue_r"></span></a>
				
                     </dl>
                     
                     
                    
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