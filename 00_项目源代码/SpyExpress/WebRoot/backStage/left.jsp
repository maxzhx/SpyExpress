<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>烟草物流后台系统</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/clockp.js"></script>
<script type="text/javascript" src="../js/clockh.js"></script> 
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddaccordion.js"></script>
<script type="text/javascript" src="../js/ymPrompt.js"></script>
<link rel="stylesheet" type="text/css" href="../css/dmm-green/ymPrompt.css" />
<script type="text/javascript">
ddaccordion.init({
	headerclass: "submenuheader", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", ""], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["suffix", "<img src='../images/plus.gif' class='statusicon' />", "<img src='../images/minus.gif' class='statusicon' />"], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})
</script>

<script type="text/javascript" src="../js/jconfirmaction.jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.ask').jConfirmAction();
	});
	
	$(document).ready(function() {
		$('.tip').jTipAction();
	});
	</script>

<script language="javascript" type="text/javascript" src="../js/niceforms.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../css/niceforms-default.css" />

</head>
<body>
<% int flag=(Integer)session.getAttribute("stationflag"); %>
 <div class="left_content">
    
    		
    
        <div class="sidebarmenu">
            	<s:if test="#session.vehicleState==0"></s:if>
            	<s:else>
                <a class="menuitem submenuheader" href="">车辆管理</a>
                <div class="submenu">
                    <ul>
                    <li><a href="newVehicle.action">添加车辆</a></li>
                    <li><a href="showAllVehicle.action?currentPage=1">管理车辆信息</a></li>
                    </ul>
                </div>
                 </s:else>
                 <s:if test="#session.stationState==0"></s:if>
                 <s:else>
                <a class="menuitem submenuheader" href="" >配送点管理</a>
                <div class="submenu">
                    <ul>
                    <li><a href="newStation.action">增加配送点</a></li>
                    <li><a href="showAllStation.action?currentPage=1">管理配送点信息</a></li>
                    </ul>
                </div>
               </s:else>
              	<s:if test="#session.scopeState==0"></s:if>
              	<s:else>
                <a class="menuitem submenuheader" href="">配送范围管理</a>
                <div class="submenu">
                    <ul>
                    <li><a href="newScope.action">增加配送范围</a></li>
                    <li><a href="showAllScope.action?currentPage=1">管理配送范围</a></li>
                    </ul>
                </div>
				</s:else>
				<s:if test="#session.receiptState==0"></s:if>
				<s:else>
				 <a class="menuitem submenuheader" href="">配送管理</a>
                <div class="submenu">
                    <ul>
                    <li><a href="selectSourceAndDest.action">生成交接单</a></li>
                    <li><a href="showAllReceipt.action?currentPage=1">管理交接单</a></li>
                    </ul>
                </div>
                </s:else>
                <s:if test="#session.orderState==0"></s:if>
                <s:else>
				 <a class="menuitem submenuheader" href="">订单管理</a>
                <div class="submenu">
                    <ul>
                    <li><a href="backnewOrder.action">生成订单</a></li>
                    <li><a href="showAllOrder.action?currentPage=1">管理订单</a></li>
                    </ul>
                </div>
                </s:else>
                <s:if test="#session.reportState==0"></s:if>
                <s:else>
            <a class="menuitem submenuheader" href="">报表管理</a>
			 <div class="submenu">
                    <ul>
                    <s:if test="#session.admin.role.id==3"></s:if>
                    <s:else>
                    <li><a href="addReportForHead.action">生成省公司报表</a></li>
                    <li><a href="showAllReportForHead.action">查看省公司报表</a></li>
                    </s:else>
                    <li><a href="addReportForSub.action">生成配送点报表</a></li>
                    <li><a href="showAllReportForSub.action">查看配送点报表</a></li>
                    </ul>
          </div>
        
			 </s:else>
			 <s:if test="#session.usersState==0"></s:if>
			 <s:else>
             <a class="menuitem submenuheader" href="">用户管理</a>
			 <div class="submenu">
                    <ul>
                    <li><a href="showAddAdmin.action">增加员工</a></li>
                    <li><a href="showAddCustomer.action">增加客户</a></li>
                    <li><a href="showAllAdmin.action">管理员工</a></li>
                    <li><a href="showAllCustomer.action" >管理客户</a></li>
                    <li><a href="newRole.action">增加角色</a></li>
                    <li><a href="showAllRole.action" >角色管理</a></li>
                    </ul>
          </div>  
           </s:else>
              
	    </div>
            
            
      </div>
</body>
</html>