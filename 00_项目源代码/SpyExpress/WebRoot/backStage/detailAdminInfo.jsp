<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.ttd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function goback()
  {
	  history.back();
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
        

        <h2>管理员信息详情</h2>

     
         <div class="form">
         <form action="" method="post" class="">
                <fieldset>
                <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
                    <tr>
                        <td align="center"><label for="">编号</label></td>
                        <td>${admin.id}</td>
                    </tr>
                     <tr>
                        <td align="center"><label for="password">登录账户</label></td>
                        <td>${admin.name}</td>
                    </tr>
                     <tr>
                        <td align="center"><label for="password">登录密码</label></td>
                        <td>${admin.pass}</td>
                    </tr>
                    <tr>
                        <td align="center"><label for="gender">真实姓名</label></td>
                        <td>${admin.realName}</td>
                    </tr>
                    <tr>
                        <td align="center"><label for="gender">性别</label></td>
                        <td>${admin.sex}</td>
                    </tr>
					 <tr>
                        <td align="center"><label for="password">电话</label></td>
                        <td>${admin.phone}</td>
                    </tr>
                     <tr>
                        <td align="center"><label for="password">职位</label></td>
                        <td>${admin.occupation}</td>
                    </tr>
                    <tr>
                        <td align="center"><label for="password">角色</label></td>
                        <td>${admin.role.name}</td>
                
                    </tr>
                    <tr>
                        <td align="center"><label for="password">配送点</label></td>
                        <td>${admin.station.name}</td>
                    </tr>
        
                 </table>   
  <a href="javascript:goback();" class="bt_red"><span class="bt_red_lft"></span><strong>返回</strong><span class="bt_red_r"></span></a><a href="#" class="bt_red"></a>                </fieldset>
                
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