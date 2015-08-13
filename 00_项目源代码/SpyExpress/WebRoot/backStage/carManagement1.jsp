<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
        
         <h2>车辆调度</h2> 
         <div class="form">
         <form action="" method="post" class="niceform">
         
               <fieldset>
                   
                    <dl>
                       <dt><label for="comments"> 起始地:</label></dt>
                        <dd><select size="1" name="gender" id="">
                                <option value="">思明区</option>
                                <option value="">Select option 2</option>
                                <option value="">Select option 3</option>
                                <option value="">Select option 4</option>
                                <option value="">Select option 5</option>
                            </select></dd>
                    </dl>
					 <dl>
                        <dt>
                          <label for="comments">目的地:</label>
                        </dt>
                        <dd> <select size="1" name="gender" id="">
                                <option value="">思明区</option>
                                <option value="">Select option 2</option>
                                <option value="">Select option 3</option>
                                <option value="">Select option 4</option>
                                <option value="">Select option 5</option>
                            </select>
							</dd>
                    </dl>
                
                   
                   
                     <dl class="submit">
				
                    <a href="carManagement2.jsp" class="bt_blue"><span class="bt_red_lft"></span><strong>确定</strong><span class="bt_blue_r"></span></a>
					
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