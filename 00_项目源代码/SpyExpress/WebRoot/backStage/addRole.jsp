<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_role()
  {
	   if(document.getElementById("rolename").value==""){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="addRole.action";
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
        
        <h2>增加角色</h2>
     
         <div class="form">
         <form name="form1" action="" method="post" class="niceform">
         
                <fieldset>
                 <dl>
                    <dt>人物：
                    <dd><s:textfield name="role.name" id="rolename"/>
                    <div id="v_rolename" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
                 <br/>
                      <dl>
                      
                    <dt>
                    <input type="checkbox" name="selectAuthorList" value="1" style="margin-top:-10px"/> 
                    <dd>&nbsp;&nbsp;&nbsp;车辆管理</dd>
                    </dl>
                          <dl>
                    <dt>
                    <input type="checkbox" name="selectAuthorList" value="2" style="margin-top:-10px"/> 
                    <dd>&nbsp;&nbsp;&nbsp;配送点管理</dd>
                    </dl>
                      <dl>
                    <dt>
                    <input type="checkbox" name="selectAuthorList" value="3" style="margin-top:-10px"/> 
                    <dd>&nbsp;&nbsp;&nbsp;配送范围管理</dd>
                    </dl>
                      <dl>
                    <dt>
                    <input type="checkbox" name="selectAuthorList" value="4" style="margin-top:-10px"/> 
                    <dd>&nbsp;&nbsp;&nbsp;交接单管理</dd>
                    </dl>
                      <dl>
                    <dt>
                    <input type="checkbox" name="selectAuthorList" value="5" style="margin-top:-10px"/> 
                    <dd>&nbsp;&nbsp;&nbsp;订单管理</dd>
                    </dl>
                      <dl>
                    <dt>
                    <input type="checkbox" name="selectAuthorList" value="6" style="margin-top:-10px"/> 
                    <dd>&nbsp;&nbsp;&nbsp;报表管理</dd>
                    </dl>
                      <dl>
                    <dt>
                    <input type="checkbox" name="selectAuthorList" value="7" style="margin-top:-10px"/> 
                    <dd>&nbsp;&nbsp;&nbsp;用户管理</dd>
                    </dl>
                    
                     <dl class="submit">
                    <input  type="button"  onclick="verify_role();" value="确定" />
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