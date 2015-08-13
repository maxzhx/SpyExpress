<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>烟草物流前台系统</title></head>

<body>
<div id="main_container">

	<div class="header">
    <%@ include file="head.jsp" %>
    </div>
    
    <div class="main_content">
    
    <%@include file="menu.jsp" %>
                    
    <div class="center_content">  
  
    <div class="left_content">
    
    		<%@include file="left.jsp" %>
    </div>  
    
    <div class="right_content">  
	
       
        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="../images/front2.jpg" data-thumb="../images/front2.jpg" alt="" />
                <img src="../images/front1.jpg" data-thumb="../images/front1.jpg" alt="" /></a>
                <img src="../images/front3.jpg" data-thumb="../images/front3.jpg" alt="" data-transition="slideInLeft" />
                <img src="../images/front4.jpg" data-thumb="../images/front4.jpg" alt="" />
            </div>
            <div id="htmlcaption" class="nivo-html-caption">
               
            </div>
        

    </div>
    <script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
		
    });
    </script>
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