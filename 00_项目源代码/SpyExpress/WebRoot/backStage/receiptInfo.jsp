<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script type="text/javascript" src="../js/selectAll.js"></script>
<script type="text/javascript">
	function checkNoReceipt(name){
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
            ymPrompt.alert('没有选中任何交接单！',null,null,'提示');
         }
         else
         {
         	form1.action="deleteMultiReceipt.action";
			form1.submit();
		}
	}
	function searchReceipt(){
		form1.action="searchReceipt.action";
		form1.submit();
	}
	function arriveMultiReceipt(name){
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
            ymPrompt.alert('没有选中任何交接单！',null,null,'提示');
         }
         else
         {
			form1.action="arriveMultiReceipt.action";
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

    <h2>交接单信息管理</h2>    
     <form name="form1" action="" method="post">
    <table id="rounded-corner" summary="2007 Major IT Companies' Profit" class="niceform">                             
<thead>
    <tr>
       <td/>
       <td style="width:100px"><s:textfield name="receiptIDString" style="width:30px"></s:textfield></td>
        <td ></td>
         <td style="width:100px"></td>
         <td>
         <s:select list="#{1:'在途',2:'已到达'}" id="selectType" name="state" headerKey="0" headerValue="所有">
             </s:select> 
         </td>
          <td>
          <s:select list="stationList"  listValue="name" listKey="id" 
                            name="sourceStationID" headerKey="0" headerValue="所有"></s:select>
          </td>
           <td>
           <s:select list="stationList"  listValue="name" listKey="id" 
                            name="destStationID" headerKey="0" headerValue="所有"></s:select>
           </td>
            <td><a href="javascript:searchReceipt();"><img src="../images/search.png" alt="" title="" border="0" /></a></td>
        
</a></td>
     <td><a href="flashReceiptSearchCondition.action"><img src="../images/error.png" alt="" title="" border="0" style="height: 22px; "/></a></td>
        </tr>
    	<tr>
        	<th scope="col" class="rounded-company"></th>
            <th scope="col" class="rounded">封单号</th>
            <th scope="col" class="rounded">发送时间</th>
			 <th scope="col" class="rounded">接收时间</th>
            <th scope="col" class="rounded">当前状态</th>
			<th scope="col" class="rounded">源配送点</th>
            <th scope="col" class="rounded">目的配送点</th>
			      <th scope="col" class="rounded">查看</th>
            <th scope="col" class="rounded-q4">删除</th>

        </tr>
    </thead>
    <tfoot>
    	<tr>
        <td colspan="9" align="left">
             <a href="javascript:checkAll('selectedIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>全选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:checkAllNo('selectedIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>取消</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:reserveCheck('selectedIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>反选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
        	<!-- <input type="checkbox" name="" value="" /><label>取消</label>
        	<input type="checkbox" name="" value="" style="width:30px"/><label>反选</label> --></td>
        <!-- <td colspan="5" class="rounded-foot-left"><em></em></td>
  -->
        </tr>
   
    </tfoot>
    <s:iterator value="receiptList">
    <tbody>
    	<tr>
        	<td><input type="checkbox" name="selectedIDList" value="<s:property value="id"/>"/></td>
            <td><s:property value="id"/></td>
            <td><s:property value="sendTime"/></td>
            <td><s:property value="recvTime"/></td>
            <s:if test="%{status==1}">
   			 <td>在途</td>
  			 </s:if>
  			 <s:else>
  			 <td>已到达</td>
  			 </s:else>
			 <td><s:property value="stationBySourceStaId.name"/></td>
			  <td><s:property value="stationByDestStaId.name"/></td>
			   <td><a href="showReceipt.action?receiptID=<s:property value="id"/>"><img src="../images/info.png" alt="" title="" border="0" /></a></td>
            <td><a href="deleteReceipt.action?receiptID=<s:property value="id"/>" class="ask"><img src="../images/trash.png" alt="" title="" border="0" /></a></td>
        </tr> 
        
    </tbody>
    </s:iterator>
</table>
</form>
     <form name="form3" action="showReceiptCurrentPage.action" method="post" class="niceform">
        <div class="pagination">
        <dt style="width:500px;align=center">
        <s:if test="%{currentPage==1}">
        <a href="showReceiptCurrentPage.action?currentPage=1" onclick="return false">首页</a>
        <a href="showReceiptCurrentPage.action?currentPage=${currentPage-1}" onclick="return false"><< 上一页</a>
        </s:if>
        <s:else>
        <a href="showReceiptCurrentPage.action?currentPage=1" >首页</a>
        <a href="showReceiptCurrentPage.action?currentPage=${currentPage-1}" ><< 上一页</a>
        </s:else>
 
        <s:if test="%{pageBean.totalPages!=0}">
        <a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(0)}">${pageBean.pageList.get(0)}</a>
        </s:if>
        <s:else>
        <a href="">1</a>
        </s:else>
        <s:if test="%{pageBean.totalPages>=2}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(1)}">${pageBean.pageList.get(1)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=3}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(2)}">${pageBean.pageList.get(2)}</a>
  		</s:if>
  		<s:else></s:else>
  		<s:if test="%{pageBean.totalPages>=4}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(3)}">${pageBean.pageList.get(3)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=5}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(4)}">${pageBean.pageList.get(4)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=6}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(5)}">${pageBean.pageList.get(5)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=7}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(6)}">${pageBean.pageList.get(6)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=8}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(7)}">${pageBean.pageList.get(7)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{pageBean.totalPages>=9}">
  		<a href="showReceiptCurrentPage.action?currentPage=${pageBean.pageList.get(8)}">${pageBean.pageList.get(8)}</a>
  		</s:if>
  		<s:else></s:else>

        <s:if test="%{currentPage==pageBean.totalPages}">
        <a href="showReceiptCurrentPage.action?currentPage=${currentPage+1}" onclick="return false">下一页 >></a>
        <a href="showReceiptCurrentPage.action?currentPage=${pageBean.totalPages}" onclick="return false">尾页</a>
        </s:if>
        <s:else>
        <a href="showReceiptCurrentPage.action?currentPage=${currentPage+1}" >下一页 >></a>
        <a href="showReceiptCurrentPage.action?currentPage=${pageBean.totalPages}">尾页</a>
        </s:else>
       <an>共有${pageBean.totalPages}页  跳到</an>
       </dt>
       <dt style="width:90px;align="left"">      
        <s:textfield name="sCurrentPage" style="width:25px"></s:textfield><an>页</an>
       <a href="javascript:form3.submit();">跳</a>
       </dt>
        </div>
       </form>  
 <a href="javascript:checkNoReceipt('selectedIDList');" class="bt_red ask" ><span class="bt_red_lft"></span><strong>删除</strong><span class="bt_red_r"></span></a><a href="#" class="bt_red"></a>
		 <s:if test="%{state==1}">
	 <a href="javascript:arriveMultiReceipt('selectedIDList');" class="bt_green"><span class="bt_green_lft"></span><strong>确认</strong><span class="bt_green_r"></span></a><a href="#" class="bt_green"></a>
	 </s:if> 

     </div><!-- end of right content-->
                              
     </div>   <!--end of center content -->               
                     
     <div class="clear"></div>
     </div> <!--end of main content-->
	
    <jsp:include page="footer.jsp" flush="true"/>

</div>		
</body>
</html>