<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_mAdmin()
  {
	   if((document.getElementById("madminname").value=="")||(document.getElementById("madminpass").value=="")
		||(document.getElementById("madminrname").value=="")||(document.getElementById("madminphone").value=="")
		   ||(document.getElementById("madminoccup").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="updateAdmin.action";
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
        
        <h2>修改员工信息</h2>
     
         <div class="form">
         <form  name="form1" action="" method="post" class="niceform">
         
                <fieldset>
                <dl>
                        <dt><label for="password">编号&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd style="margin-top: 10px;margin-left:10px;"><s:label name="admin.id" readonly="true"></s:label></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">登录账户&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd style="margin-top: 10px;margin-left:10px;">
                        <s:label name="admin.name" readonly="true" id="madminname"></s:label>
                        <div id="v_adminname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">登录密码&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="admin.pass" id="madminpass"></s:textfield>
                        <div id="v_adminpass" style="" class="verify" >
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">真实姓名&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="admin.realName" id="madminrname"></s:textfield>
                        <div id="v_adminrname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
                    <dl>
                        <dt><label for="gender">性别&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd>
                            <s:select list="{'男','女'}" name="admin.sex" value="admin.sex"></s:select>
                        </dd>
                    </dl>
					 <dl>
                        <dt><label for="password">电话号码&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="admin.phone" id="madminphone"></s:textfield>
                        <div id="v_adminphone" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">11位数字.</label>
                        </div></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">职位&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="admin.occupation" id="madminoccup"></s:textfield>
                        <div id="v_adminoccu" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>

                     <dl>
                        <dt><label for="password">角色&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:select list="roleList" listValue="name" listKey="id" name="roleId" value="admin.role.id">
                            </s:select></dd>
                    </dl>
					
					<dl>
                        <dt><label for="password">配送点&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd>
                         <s:select list="stationList" listValue="name" listKey="id"  name="stationId"  value="stationId">
                         </s:select>
                        </dd>
                    </dl>
               
               
                     <dl class="submit">
                    <input  type="button"  onclick="verify_mAdmin();" value="提交" /><!-- onClick=window.open("adminInfo.jsp") -->  
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