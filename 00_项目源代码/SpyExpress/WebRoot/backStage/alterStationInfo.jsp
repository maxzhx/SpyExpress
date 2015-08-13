<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script>
  function verify_mStation()
  {
	   if((document.getElementById("mstationname").value=="")||(document.getElementById("mstationaddr").value=="")
		||(document.getElementById("mstationphone").value=="")){
		   ymPrompt.alert("信息未填写完整.",240,170,'提示');
	   }
	   else{
		 	form1.action="updateStation.action";
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
        
        <h2>编辑配送点</h2>
     
         <div class="form">
         <form name="form1" action="" method="post" class="niceform">
         
                <fieldset>
                    <dl>
                        <dt>
                          <label for="email">配送点编号&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd style="margin-top: 10px;margin-left:10px;"><s:label name="station.id" />
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                          <label for="email">配送点名称&nbsp;&nbsp;&nbsp;</label>
                        </dt>
                        <dd><s:textfield name="station.name" id="mstationname"/>
                        <div id="v_stationname" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">配送点地址&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="station.address" id="mstationaddr"/>
                        <div id="v_stationadd" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">不能为空.</label>
                        </div></dd>
                    </dl>     
                      <dl>
                        <dt><label for="password">配送点电话&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textfield name="station.phone" id="mstationphone"/>
                        <div id="v_stationphone" style="" class="verify">
                        <image src="../images/error.gif"></image>
                        <label style="" class="verify-label">电话格式不正确.</label>
                        </div></dd>
                    </dl>     
                    <dl>
                        <dt><label for="comments">备注信息&nbsp;&nbsp;&nbsp;</label></dt>
                        <dd><s:textarea name="station.note"/>
                    </dl>
                    
                    <dl>
                        <dt><label></label></dt>
                        
                    </dl>
                    
                     <dl class="submit">
                    <input  type="button"  onclick="verify_mStation();" value="提交" />
                    <!-- onClick=window.open("stationInfo.jsp") -->
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