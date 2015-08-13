<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        <h2>修改订单状态</h2>
     
         <div class="form">
         <form action="" method="post" class="niceform">
         
                <fieldset>
                    <dl>
                        <dt>
                          <label for="email">订单编号</label>
                        </dt>
                        <dd><input type="text" name="" id="" size="54" /></dd>
                    </dl>
                      <dl>
                        <dt><label for="email">当前状态</label></dt>
                        <dd><select size="1" name="gender" id="">
                                <option value="">未出发</option>
                                <option value="">厦门</option>
								<option value="">长沙</option>
                            </select></dd>
                    </dl>       
                    <dl>
                        <dt><label></label></dt>
                        
                    </dl>
                    
                     <dl class="submit">
                    <input type="submit" name="submit" id="submit" value="修改" />
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