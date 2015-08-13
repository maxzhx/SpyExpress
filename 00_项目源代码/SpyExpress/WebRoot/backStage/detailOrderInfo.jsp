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
                        <dd></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">发货时间</label></dt>
                        <dd></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">收货时间</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="gender">当前状态</label></dt>
                        <dd> </dd>
                    </dl>
					 <dl>
                        <dt><label for="password">配送路径</label></dt>
                        <dd></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">重量</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">体积</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">运费</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">收件人姓名</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">收件人地址</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">收件人电话</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">收件人姓名</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">收件人地址</label></dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">收件人电话</label></dt>
                        <dd></dd>
                    </dl>
                     <dl>
                        <dt><label for="password">寄件人编号</label></dt>
                        <dd></dd>
                    </dl>
					
					<dl>
                        <dt><label for="password">配送点编号</label></dt>
                        <dd></dd>
                    </dl>
        <a href="alterDetailOrderInfo.jsp" class="bt_red"><span class="bt_red_lft"></span><strong>修改</strong><span class="bt_red_r"></span></a><a href="#" class="bt_red"></a>
                    
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