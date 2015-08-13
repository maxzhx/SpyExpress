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
        
        <h2>权限管理</h2>
     
         <div class="form">
         <form action="updateRole.action" method="post" class="niceform">
         
                <fieldset>
                 <dl>
                    <dt>人物：
                    <dd><s:textfield name="role.name"/></dd>
                    </dl>
                      <dl>
                    <dt>
                     <s:if test="%{role.vehicle==1}">
                    <input type="checkbox" name="selectAuthorList" checked="checked" value="1" style="margin-top:-10px"/> 
	 				</s:if>
	 				<s:else>
                    <input type="checkbox" name="selectAuthorList" value="1" style="margin-top:-10px"/> 
	 				</s:else>
                    <dd>&nbsp;&nbsp;&nbsp;车辆管理</dd>
                    </dl>
                          <dl>
                    <dt>
					<s:if test="%{role.station==1}">
                    <input type="checkbox" name="selectAuthorList" checked="checked" value="2" style="margin-top:-10px"/> 
	 				</s:if>
	 				<s:else>
                    <input type="checkbox" name="selectAuthorList" value="2" style="margin-top:-10px"/> 
	 				</s:else>
                    <dd>&nbsp;&nbsp;&nbsp;配送点管理</dd>
                    </dl>
                      <dl>
                    <dt>
					<s:if test="%{role.scope==1}">
                    <input type="checkbox" name="selectAuthorList" checked="checked" value="3" style="margin-top:-10px"/> 
	 				</s:if>
	 				<s:else>
                    <input type="checkbox" name="selectAuthorList" value="3" style="margin-top:-10px"/> 
	 				</s:else>
                    <dd>&nbsp;&nbsp;&nbsp;配送范围管理</dd>
                    </dl>
                      <dl>
                    <dt>
					<s:if test="%{role.receipt==1}">
                    <input type="checkbox" name="selectAuthorList" checked="checked" value="4" style="margin-top:-10px"/> 
	 				</s:if>
	 				<s:else>
                    <input type="checkbox" name="selectAuthorList" value="4" style="margin-top:-10px"/> 
	 				</s:else>
                    <dd>&nbsp;&nbsp;&nbsp;交接单管理</dd>
                    </dl>
                      <dl>
                    <dt>
					<s:if test="%{role.orders==1}">
                    <input type="checkbox" name="selectAuthorList" checked="checked" value="5" style="margin-top:-10px"/> 
	 				</s:if>
	 				<s:else>
                    <input type="checkbox" name="selectAuthorList" value="5" style="margin-top:-10px" style="margin-top:-10px"/> 
	 				</s:else>
                    <dd>&nbsp;&nbsp;&nbsp;订单管理</dd>
                    </dl>
                      <dl>
                    <dt>
					<s:if test="%{role.report==1}">
                    <input type="checkbox" name="selectAuthorList" checked="checked" value="6" style="margin-top:-10px"/> 
	 				</s:if>
	 				<s:else>
                    <input type="checkbox" name="selectAuthorList" value="6" style="margin-top:-10px"/> 
	 				</s:else>
                    <dd>&nbsp;&nbsp;&nbsp;报表管理</dd>
                    </dl>
                      <dl>
                    <dt>
					<s:if test="%{role.users==1}">
                   <dt><input type="checkbox" name="selectAuthorList" checked="checked" value="7" style="margin-top:-10px"/> </dt>
	 				</s:if>
	 				<s:else>
                   <dt> <input type="checkbox" name="selectAuthorList" value="7" style="margin-top:-10px"/> </dt>
	 				</s:else>
                    <dd>&nbsp;&nbsp;&nbsp;用户管理</dd>
                    </dl>
                    
                     <dl class="submit">
                    <input  type="submit" name="submit" id="submit" value="确定" />
                    <!-- onClick=window.open("carInfo.jsp") -->
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