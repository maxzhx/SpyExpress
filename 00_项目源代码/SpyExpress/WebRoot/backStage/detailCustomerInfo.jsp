<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.ttd">
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
        
        <h2>客户信息详情</h2>
     
         <div class="form">
         <form action="" method="post" >
                <fieldset>
                	<table id="rounded-corner">
                    <tr>
                        <td align="center"><label for="">编号</label></td>
                        <td>${customer.id}</td>
                    </tr>
                     <tr>
                        <td align="center"><label for="password">登录账户</label></td>
                        <td>${customer.name}</td>
                    </tr>
                     <tr>
                        <td align="center"><label for="password">登录密码</label></td>
                        <td>${customer.pass}</td>
                    </tr>
                    <tr>
                        <td align="center"><label for="gender">真实姓名</label></td>
                        <td>${customer.realName}</td>
                    </tr>
                    <tr>
                        <td align="center"><label for="gender">性别</label></td>
                        <td>${customer.sex}</td>
                    </tr>
					 <tr>
                        <td align="center"><label for="password">地址</label></td>
                        <td>${customer.address}</td>
                    </tr>
                     <tr>
                        <td align="center"><label for="password">移动电话</label></td>
                        <td>${customer.mobilephone}</td>
                    </tr>
                    <tr>
                        <td align="center"><label for="password">单位电话</label></td>
                        <td>${customer.unitphone}</td>
                    </tr>
             </table>
                  
        <a href="showAllCustomer.action?currentPage" class="bt_red"><span class="bt_red_lft"></span><strong>返回</strong><span class="bt_red_r"></span></a><a href="#" class="bt_red"></a>
                    
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