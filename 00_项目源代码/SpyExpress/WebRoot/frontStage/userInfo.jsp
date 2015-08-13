<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>烟草物流前台系统</title>
<script>
  function verify_mCustomer()
  {
	  if(document.getElementById("customerpass").value!=document.getElementById("confirmpass").value) 
		{
		  	ymPrompt.alert("请重新确认密码.",240,170,'提示');
		}
	  else if((document.getElementById("customername").value=="")||(document.getElementById("customerpass").value=="")
		||(document.getElementById("confirmpass").value=="")||(document.getElementById("customeradd").value=="")
		   ||(document.getElementById("customerphone").value==""))
	   {
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	//alert("修改成功");
		   ymPrompt.alert("修改成功",240,170,'提示',"close");
		    gform.action="updateCustomer.action";
		    setTimeout("gform.submit()",1000);
		 }
  }
  </script>
</head>
<body>
<div id="main_container">

	<%@ include file="head.jsp" %>
    
    <div class="main_content">
    
    <%@ include file="menu.jsp" %>
                 
    <div class="center_content">  
    
    <div class="left_content">
    
    		<%@ include file="left.jsp" %>
    </div>  
    
        <div class="right_content">            
        
    <h2>修改账号信息</h2> 
     <div class="form">
         <form action="" method="post" class="niceform" name="gform">
         <fieldset>
                    <dl>
                        <dt><label for="email">用户名:</label></dt>
                        <dd style="margin-top: 10px;margin-left:10px;">
                        <s:label name="customer.name" readonly="true" id="customername"/>
                          <%--<div  style="display:block;" class="verify" >
                        <image src="../images/drop-no.gif"></image>
                        <label style="" class="verify-label">不可修改.</label></div></dd>--%>
                    </dl>
                    <dl>
                        <dt><label for="password">密码:</label></dt>
                        <dd><s:textfield name="customer.pass" id="customerpass"></s:textfield>
                          <div id="v_custpass" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>
                    </dl>
                     <dl>
                        <dt><label for="passwordagain">确认密码:</label></dt>
                        <dd><s:textfield name="confirmpass" id="confirmpass"></s:textfield>
                          <div id="v_custpassagain" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">两次密码要相同！</label></div></dd>
                    </dl>
                    
                 
                     <dl>
                        <dt><label for="email">详细地址:</label></dt>
                        <dd><s:textfield name="customer.address" id="customeradd"></s:textfield>
                          <div id="v_custadd" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>    
                    </dl>
					<dl>
                        <dt><label for="email">移动电话:</label></dt>
                        <dd><s:textfield name="customer.mobilephone" id="customerphone"></s:textfield>
                          <div id="v_custmphone" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">11位手机号.</label></div></dd>
                    </dl>
					<dl>
                        <dt><label for="email">单位电话:</label></dt>
                        <dd><s:textfield name="customer.unitphone"></s:textfield></dd>
                    </dl>
				
                     <dl  class="submit">	
		 			<input  type="button"  onclick="verify_mCustomer();" value="确定" />
                    <%--<a href="javascript:verify_mCustomer()" class="bt_blue" onclick="">
					<span class="bt_blue_lft"></span><strong>确定</strong><span class="bt_blue_r"></span></a>
                     --%></dl>
                     
                     
                    
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