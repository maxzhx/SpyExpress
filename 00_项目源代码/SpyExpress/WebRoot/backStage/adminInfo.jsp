<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script type="text/javascript" src="../js/selectAll.js"></script>
<script type="text/javascript">
 function checkNoUser(name) 
 {  
        var el = document.getElementsByTagName('input');
        var len = el.length;
        var flag=0;
        for(var i=0; i<len; i++)
        {
             if((el[i].type=="checkbox") && (el[i].name==name))
              {
                   if(el[i].checked == true)
                   {
                        flag=1;
                   }
              }
         } 
         if(flag==0)
         {
             ymPrompt.alert('没有选中任何员工！',null,null,'提示');
         }
         else{
			form1.action="deleteMultiAdmin.action";
           form1.submit();
         }
}
function searchAdmin(){
	form1.action="searchAdmin.action";
	form1.submit();
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
 
    <h2>员工信息管理</h2>                                 
    <form name="form1" action="" method="post">
    <table id="rounded-corner" summary="2007 Major IT Companies' Profit" class="niceform">
    <thead>
   <tr>   
  			<td></td>
        	<td style="width: 120px">
        		<s:textfield name="adminIdString" style="width: 60px"></s:textfield>
        	</td>
           
            <td style="width: 120px">
           		<s:textfield name="realName" style="width: 60px"></s:textfield>
            </td>
             <td>   
            	<s:select list="sRoleList" listKey="id" listValue="name" name="searchRoleId" headerKey="0" headerValue="所有"></s:select>
              </td>
              <td>   
            	<s:select list="sStationList" listKey="id" listValue="name" name="searchStationId" value="searchStationId" headerKey="0" headerValue="所有"></s:select>
              </td>
			
    <td/>
     <td style="width: 50px"><a href="javascript:searchAdmin();"><img src="../images/search.png" alt="" title="" border="0" /></a></td>
     <td style="width: 50px"><a href="cancelAdmin.action"><img src="../images/error.png" alt="" title="" border="0" style="height: 22px; "/></a></td>
        </tr>
    	<tr>
        	<th scope="col" class="rounded-company"></th>
            <th scope="col" class="rounded">编号</th>
			  <th scope="col" class="rounded">姓名</th>
			   <th scope="col" class="rounded">角色</th>
			    
				<th scope="col" class="rounded">配送点</th>
				  <th scope="col" class="rounded">查看</th>
			   <th scope="col" class="rounded">编辑</th>
            <th scope="col" class="rounded-q4">删除</th>
        </tr>
    </thead>
     
    <tfoot>
    	<tr>
        <td colspan="10" align="left">
             <a href="javascript:checkAll('selectedIdList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>全选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:checkAllNo('selectedIdList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>取消</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:reserveCheck('selectedIdList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>反选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
        	<!-- <input type="checkbox" name="" value="" /><label>取消</label>
        	<input type="checkbox" name="" value="" style="width:30px"/><label>反选</label> --></td>
        <!-- <td colspan="5" class="rounded-foot-left"><em></em></td>
  -->
        </tr>
   
    </tfoot>
    	<s:iterator value="adminList"> 
    <tbody>
    	<tr>
        	<td><input type="checkbox" name="selectedIdList" value="<s:property value="id"/>"/></td>
            <td align="center"><s:property value="id"/></td>
            <td align="center"><s:property value="realName"/></td>
			<td align="center"><s:property value="role.name"/></td>
			
            <td align="center"><s:property value="station.name"/></td>
             <td><a href="showAdmin.action?adminId=<s:property value="id"/>&currentPage"><img src="../images/info.png" alt="" title="" border="0" /></a></td>
            <td align="center"><a href="showUpdateAdmin.action?adminId=<s:property value="id"/>"><img src="../images/user_edit.png" alt="" title="" border="0" /></a></td>
            <td align="center"><a class="ask" href="deleteAdmin.action?adminId=<s:property value="id"/>"><img src="../images/trash.png" alt="" title="" border="0" /></a></td>
        </tr> 
        </s:iterator>
    </tbody>
      
</table>
       </form> 
	<form name="form3" action="adminCurrentPage.action" method="post" class="niceform">
        <div class="pagination">
         <dt style="width:500px">
        	      <s:if test="%{currentPage==1}">
        <a href="adminCurrentPage.action?currentPage=1" onclick="return false">首页</a>
        <a href="adminCurrentPage.action?currentPage=${currentPage-1}" onclick="return false"><< 上一页</a>
        </s:if>
        <s:else>
        <a href="adminCurrentPage.action?currentPage=1" >首页</a>
        <a href="adminCurrentPage.action?currentPage=${currentPage-1}" ><< 上一页</a>
        </s:else>
   
        <a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(0)}">${pageBean.pageList.get(0)}</a>
        
        <s:if test="%{pageBean.totalPages>=2}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(1)}">${pageBean.pageList.get(1)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=3}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(2)}">${pageBean.pageList.get(2)}</a>
  		</s:if>
  		<s:else></s:else>
  		<s:if test="%{pageBean.totalPages>=4}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(3)}">${pageBean.pageList.get(3)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=5}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(4)}">${pageBean.pageList.get(4)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=6}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(5)}">${pageBean.pageList.get(5)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=7}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(6)}">${pageBean.pageList.get(6)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=8}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(7)}">${pageBean.pageList.get(7)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=9}">
  		<a href="adminCurrentPage.action?currentPage=${pageBean.pageList.get(8)}">${pageBean.pageList.get(8)}</a>
  		</s:if>
  		<s:else></s:else>

        <s:if test="%{currentPage==pageBean.totalPages}">
        <a href="adminCurrentPage.action?currentPage=${currentPage+1}" onclick="return false">下一页 >></a>
        <a href="adminCurrentPage.action?currentPage=${pageBean.totalPages}" onclick="return false">尾页</a>
        </s:if>
        <s:else>
        <a href="adminCurrentPage.action?currentPage=${currentPage+1}" >下一页 >></a>
        <a href="adminCurrentPage.action?currentPage=${pageBean.totalPages}">尾页</a>
        </s:else>
           <an>共有${pageBean.totalPages}页  跳到</an>
       </dt>
       <dt style="width:90px">
       
        <s:textfield name="sAdminCurrentPage" style="width:25px"></s:textfield><an>页</an>
       <a href="javascript:form3.submit();">跳</a>
       </dt>
        </div> 
     </form>
     <a href="javascript:checkNoUser('selectedIdList');" class="bt_red tip"><span class="bt_red_lft"></span><strong>删除</strong><span class="bt_red_r"></span></a><a href="#" class="bt_red"></a>
	 <a href="showAddAdmin.action" class="bt_green"><span class="bt_green_lft"></span><strong>增加</strong><span class="bt_green_r"></span></a><a href="#" class="bt_green"></a> 
    
     
     </div><!-- end of right content-->
                              
     </div>   <!--end of center content -->               
                     
     <div class="clear"></div>
     </div> <!--end of main content-->
	
    <jsp:include page="footer.jsp" flush="true"/>

</div>		
</body>
</html>