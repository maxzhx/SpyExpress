<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_aCustomer()
  {
	   if((document.getElementById("acustname").value=="")||(document.getElementById("acustpass").value=="")
		||(document.getElementById("acustrname").value=="")||(document.getElementById("acustphone").value=="")
		   ||(document.getElementById("acustaddr").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="updateBackCustomer.action";
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
        
        <h2>修改客户信息</h2>
     
         <div class="form">
         <form action="" method="post" class="niceform" name="form1">
         
                <fieldset>
                <dl>
                        <dt><label for="password">编号&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd style="margin-top: 10px;margin-left:10px;"><s:label name="customer.id"></s:label></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">登录账户&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="customer.name" id="acustname"></s:textfield>
                        <div id="v_custname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">登录密码&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="customer.pass" id="acustpass"></s:textfield>
                        <div id="v_custpass" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>
                    </dl>
                    
                     <dl>
                        <dt><label for="password">姓名&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd><s:textfield name="customer.realName" id="acustrname"></s:textfield>
                        <div id="v_custrname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>
                    </dl>
                    <dl>
                        <dt><label for="gender">性别&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd>
                           <s:select list="{'男','女'}" name="customer.sex" value="customer.sex"></s:select>
                        </dd>
                    </dl>
					 <dl>
                        <dt>
                          <label for="password">单位号码&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd><s:textfield name="customer.unitphone"></s:textfield></dd>
                    </dl>
                     <dl>
                        <dt>
                          <label for="password">移动电话&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd><s:textfield name="customer.mobilephone" id="acustphone"></s:textfield>
                        <div id="v_custmphone" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">11位手机号.</label>
                        </div></dd>
                    </dl>

                     <dl>
                        <dt><label for="password">地址&nbsp;&nbsp;&nbsp;</label></dt>
                         <dd><s:textfield name="customer.address" id="acustaddr"></s:textfield>
                         <div id="v_custadd" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
					
					
               
                     <dl class="submit">
                     <input  type="button"  onclick="verify_aCustomer();" value="提交" />
                   <!--  onClick=window.open("customerInfo.jsp") -->
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