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
        	 
	 <h2>可用车辆</h2>                                 
     <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company"></th>
            <th scope="col" class="rounded">编号</th>
            <th scope="col" class="rounded">当前状态</th>
            <th scope="col" class="rounded">所属配送点</th>
			 <th scope="col" class="rounded">型号</th>
            <th scope="col" class="rounded">购买时间</th>
			<th scope="col" class="rounded">生产厂家</th>
            <th scope="col" class="rounded">调度</th>
            <th scope="col" class="rounded-q4">确认到达</th>
        </tr>
    </thead>
        <tfoot>
    	<tr>
        	<td colspan="10" class="rounded-foot-left"><em></em></td>
        
        </tr>
    </tfoot>
    <tbody>
    	<tr>
        	<td><input type="checkbox" name="" /></td>
            <td>1111</td>
            <td>未发车</td>
            <td>宁波</td>
			<td>AX123</td>
			<td>2013年</td>
			<td>厦门</td>
            <td><a href="#"><img src="../images/confirm.jpg" alt="" title="" border="0" /></a></td>
            <td>可调度</td>
            
        </tr> 
        <tr>
        	<td><input type="checkbox" name="" /></td>
            <td>1111</td>
            <td>未发车</td>
            <td>宁波</td>
			<td>AX123</td>
			<td>2013年</td>
			<td>厦门</td>
            <td><a href="#"><img src="../images/confirm.jpg" alt="" title="" border="0" /></a></td>
            <td>可调度</td>
            
        </tr> 
        <tr>
        	<td><input type="checkbox" name="" /></td>
            <td>1111</td>
            <td>未发车</td>
            <td>宁波</td>
			<td>AX123</td>
			<td>2013年</td>
			<td>厦门</td>
            <td><a href="#"><img src="../images/confirm.jpg" alt="" title="" border="0" /></a></td>
            <td>可调度</td>
            
        </tr> 
        
        
    		<tr>
        	<td><input type="checkbox" name="" /></td>
            <td>1111</td>
            <td>未发车</td>
            <td>宁波</td>
			<td>AX123</td>
			<td>2013年</td>
			<td>厦门</td>
			<td>已调度</td>
            <td><a href="#"><img src="../images/valid2.jpg" alt="" title="" border="0" /></a></td>
            
        </tr> 
        	<tr>
        	<td><input type="checkbox" name="" /></td>
            <td>1111</td>
            <td>未发车</td>
            <td>宁波</td>
			<td>AX123</td>
			<td>2013年</td>
			<td>厦门</td>
			<td>已调度</td>
            <td><a href="#"><img src="../images/valid2.jpg" alt="" title="" border="0" /></a></td>
            
        </tr> 
        	<tr>
        	<td><input type="checkbox" name="" /></td>
            <td>1111</td>
            <td>未发车</td>
            <td>宁波</td>
			<td>AX123</td>
			<td>2013年</td>
			<td>厦门</td>
			<td>已调度</td>
            <td><a href="#"><img src="../images/valid2.jpg" alt="" title="" border="0" /></a></td>
            
        </tr> 
        
    		
    </tbody>
</table>
   
	 <a href="" class="bt_green"><span class="bt_green_lft"></span><strong>调度</strong><span class="bt_green_r"></span></a><a href="#" class="bt_green"></a>
	 <a href="" class="bt_green"><span class="bt_green_lft"></span><strong>确认</strong><span class="bt_green_r"></span></a><a href="#" class="bt_green"></a>
	  
     
     
        <div class="pagination">
        <span class="disabled"><< prev</span><span class="current">1</span><a href="">2</a><a href="">3</a><a href="">4</a><a href="">5</a>…<a href="">10</a><a href="">11</a><a href="">12</a>...<a href="">100</a><a href="">101</a><a href="">next >></a></div> 
	<h2/>

     </div><!-- end of right content-->
                              
     </div>   <!--end of center content -->               
                     
     <div class="clear"></div>
     </div> <!--end of main content-->
	
    <jsp:include page="footer.jsp" flush="true"/>

</div>		
</body>
</html>