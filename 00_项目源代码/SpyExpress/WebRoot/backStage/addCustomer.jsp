<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_Customer()
  {
	   if((document.getElementById("custname").value=="")||(document.getElementById("custpass").value=="")
		||(document.getElementById("custrname").value=="")||(document.getElementById("custphone").value=="")
		   ||(document.getElementById("custaddr").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="addCustomer.action";
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
        
        <h2>添加客户</h2>
     
         <div class="form">
         <form name="form1" action="" method="post" class="niceform">
         
                <fieldset>
                    <dl>
                        <dt><label for="password">登录账户&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="customer.name" id="custname"></s:textfield>
                        <div id="v_custname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">登录密码&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="customer.pass" id="custpass"></s:textfield>
                        <div id="v_custpass" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">姓名&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd><s:textfield name="customer.realName" id="custrname"></s:textfield>
                        <div id="v_custrname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label></div></dd>
                    </dl>
                    <dl>
                        <dt><label for="gender">性别&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd>
                            <s:select list="{'男','女'}" name="customer.sex" value="customer.sex">
                            </s:select>
                        </dd>
                    </dl>
					 <dl>
                        <dt>
                          <label for="password">单位号码&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd><s:textfield name="customer.unitphone" ></s:textfield>
                        <%--<div id="v_custuphone" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">形如.</label>
                        </div>--%></dd>
                    </dl>
                     <dl>
                        <dt>
                          <label for="password">移动电话&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd><s:textfield name="customer.mobilephone" id="custphone"></s:textfield>
                        <div id="v_custmphone" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">11位手机号.</label>
                        </div></dd>
                    </dl>

                     <dl>
                        <dt><label for="password">地址&nbsp;&nbsp;&nbsp;</label></dt>
                         <dd><s:textfield name="customer.address" id="custaddr"></s:textfield>
                         <div id="v_custadd" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
					
					
               
                     <dl class="submit">
                    <input  type="button"  onclick="verify_Customer();" value="提交" />
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