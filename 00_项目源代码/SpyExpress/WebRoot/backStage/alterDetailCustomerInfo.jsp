<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
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
        
        <h2>订单信息</h2>
     
         <div class="form">
         <form action="" method="post" class="niceform">
                <fieldset>
                    <dl>
                        <dt><label for="">编号</label></dt>
                        <dd><input type="text" size="24" value="1231" name="" readOnly/></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">登陆账号</label></dt>
                        <dd><input type="text" size="24" value="" name=""/></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">登陆密码</label></dt>
                        <dd><input type="text" size="24" value="" name=""/></dd>
                    </dl>
                      <dl>
                        <dt><label for="password">真实姓名</label></dt>
                        <dd><input type="text" size="24" value="" name=""/></dd>
                    </dl>
                    <dl>
                        <dt><label for="gender">性别</label></dt>
                        <dd><select size="1"></select>      
                        </dd>
                    </dl>
					 <dl>
                        <dt><label for="password">地址</label></dt>
                        <dd><input type="text" size="24" value="" name=""/></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">单位电话</label></dt>
                        <dd><input type="text" size="24" value="" name=""/></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">个人电话</label></dt>
                        <dd><input type="text" size="24" value="" name=""/></dd>
                    </dl>
                    
                  
        <a href="#" class="bt_green"><span class="bt_green_lft"></span><strong>提交</strong><span class="bt_green_r"></span></a><a href="#" class="bt_green"></a>
                    
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