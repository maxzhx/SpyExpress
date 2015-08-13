<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>烟草物流后台系统</title>
<script type="text/javascript" src="../js/selectAll.js"></script>
<script type="text/javascript">
function orderAndVehicleCheckAll(name) {
	checkAll(name);
	updateWeightAndVolume();
} 
function orderAndVehicleCheckAllNo(name) {
	checkAllNo(name);
	updateWeightAndVolume();
} 
function orderAndVehicleReserveCheck(name) {
	reserveCheck(name);
	updateWeightAndVolume();
} 
function showReceiptOrderCurrentPage(){
	form1.action="showReceiptOrderCurrentPage.action";
	form1.submit();
}
function showReceiptVehicleCurrentPage(){
	form1.action="showReceiptVehicleCurrentPage.action";
	form1.submit();
}
function selectCarrierAndRecipient(){
	var el = document.getElementsByTagName('input');
    var len = el.length;
    var orderFlag=0;
    var vehicleFlag=0;
    for(var i=0; i<len; i++)
    {
         if((el[i].type=="checkbox") && (el[i].name=='selectedOrderIDList'))
          {
               if(el[i].checked == true)
               {
            	   orderFlag=1;
               }
          }
         if((el[i].type=="checkbox") && (el[i].name=='selectedVehicleIDList'))
         {
              if(el[i].checked == true)
              {
            	  vehicleFlag=1;
              }
         }
     } 
     if(orderFlag==0)
     {
          ymPrompt.alert('请选择要发送的订单！',null,null,'提示');
     }
     else if(vehicleFlag==0){
          ymPrompt.alert('请选择配送的车辆！',null,null,'提示');
     }
     else{
    	 var tvw = document.getElementsByName("totalVehicleWeight");
    	    var tvv = document.getElementsByName("totalVehicleVolume");
    		var tow = document.getElementsByName("totalOrderWeight");
    		var tov = document.getElementsByName("totalOrderVolume");
    		if(parseFloat(tow[0].value) > parseFloat(tvw[0].value)){
    			ymPrompt.alert("错误！订单总重量大于车辆总载重量！",null,null,'提示');
    		}
    		else if(parseFloat(tov[0].value)>parseFloat(tvv[0].value)){
    			ymPrompt.alert("错误！订单总体积大于车辆总容积！",null,null,'提示');
    		}
    		else{
    		form1.action="selectCarrierAndRecipient.action";
    		form1.submit();
    		}
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
<form name="form1" action="" class="niceform">       
    <table id="rounded-corner" summary="2007 Major IT Companies' Profit"> 
  
    <h2>订单信息</h2>                                 
    <thead>
  
    <tr>
    <td/>
    <td colspan="1" style="align:right"><label>当前总重量</label></td>
    <td colspan="1"><s:textfield name="totalOrderWeight" readonly="true" style="width:80px"/></td>
    <td colspan="1"><label>当前总体积</label></td>
    <td colspan="2"><s:textfield name="totalOrderVolume" readonly="true" style="width:80px"/></td>
    </tr>
    	<tr>
        	<th scope="col" class="rounded-company"></th>
            <th scope="col" class="rounded">编号</th>
            <th scope="col" class="rounded">当前状态</th>
			 <th scope="col" class="rounded">重量</th>
			 <th scope="col" class="rounded">体积</th>
            <th scope="col" class="rounded-q4">当前配送点</th>
        </tr>
    </thead>
    <tfoot>
    	<tr>
        <td colspan="9" align="left">
             <a href="javascript:orderAndVehicleCheckAll('selectedOrderIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>全选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:orderAndVehicleCheckAllNo('selectedOrderIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>取消</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:orderAndVehicleReserveCheck('selectedOrderIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>反选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
        	<!-- <input type="checkbox" name="" value="" /><label>取消</label>
        	<input type="checkbox" name="" value="" style="width:30px"/><label>反选</label> --></td>
        <!-- <td colspan="5" class="rounded-foot-left"><em></em></td>
  -->
        </tr>
   
    </tfoot>
    <s:iterator value="orderList">
    <tbody>
    	<tr align="center">
        	<td><input type="checkbox" name="selectedOrderIDList" value="<s:property value="id"/>"></td> 
            <td><s:property value="id"/></td>
            <s:if test="%{status==1}">
           <td>未确认</td>
           </s:if>
           <s:elseif test="%{status==2}">
           <td>待发货</td>
           </s:elseif>
           <s:elseif test="%{status==3}">
           <td>途中</td>
           </s:elseif>
           <s:elseif test="%{status==4}">
           <td>未收货</td>
           </s:elseif>
           <s:elseif test="%{status==5}">
           <td>已完成</td>
           </s:elseif>
           <s:else>
           <td>已取消</td>
           </s:else>
            <td><s:property value="weight"/></td>
            <td><s:property value="volume"/></td>
            <td><s:property value="station.name"/></td>
            <input name="orderWeight" type="hidden" value="<s:property value="weight"/>">
            <input name="orderVolume" type="hidden" value="<s:property value="volume"/>">
        </tr> 
         	
    </tbody>
    </s:iterator>

</table>
        <div class="pagination">
        <dt style="width:500px">
        <s:if test="%{orderCurrentPage==1}">
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=1" onclick="return false">首页</a>
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderCurrentPage-1}" onclick="return false"><< 上一页</a>
        </s:if>
        <s:else>
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=1" >首页</a>
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderCurrentPage-1}" ><< 上一页</a>
        </s:else>
 
        <s:if test="%{orderPageBean.totalPages!=0}">
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(0)}">${orderPageBean.pageList.get(0)}</a>
        </s:if>
        <s:else>
        <a href="">1</a>
        </s:else>
        
        
        
        <s:if test="%{orderPageBean.totalPages>=2}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(1)}">${orderPageBean.pageList.get(1)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{orderPageBean.totalPages>=3}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(2)}">${orderPageBean.pageList.get(2)}</a>
  		</s:if>
  		<s:else></s:else>
  		<s:if test="%{orderPageBean.totalPages>=4}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(3)}">${orderPageBean.pageList.get(3)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{orderPageBean.totalPages>=5}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(4)}">${orderPageBean.pageList.get(4)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{orderPageBean.totalPages>=6}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(5)}">${orderPageBean.pageList.get(5)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{orderPageBean.totalPages>=7}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(6)}">${orderPageBean.pageList.get(6)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{orderPageBean.totalPages>=8}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(7)}">${orderPageBean.pageList.get(7)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{orderPageBean.totalPages>=9}">
  		<a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.pageList.get(8)}">${orderPageBean.pageList.get(8)}</a>
  		</s:if>
  		<s:else></s:else>

        <s:if test="%{orderCurrentPage==orderPageBean.totalPages}">
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderCurrentPage+1}" onclick="return false">下一页 >></a>
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.totalPages}" onclick="return false">尾页</a>
        </s:if>
        <s:else>
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderCurrentPage+1}" >下一页 >></a>
        <a href="showReceiptOrderCurrentPage.action?orderCurrentPage=${orderPageBean.totalPages}">尾页</a>
        </s:else>
        <an>共有${orderPageBean.totalPages}页  跳到</an>
       </dt>
      <dt style="width:90px">
          
        <s:textfield name="sOrderCurrentPage" style="width:25px"></s:textfield><an>页</an>
       <a href="javascript:showReceiptOrderCurrentPage();">跳</a>
       </dt>
        </div> 
        
	 
	 <h2>车辆信息</h2>  
     <table id="rounded-corner" summary="2007 Major IT Companies' Profit" class="">
    <thead>
     <tr>
    <td/>
    <td colspan="1" style="align:right"><label>当前总重量</label></td>
    <td colspan="2"><s:textfield name="totalVehicleWeight" readonly="true" style="width:80px"/></td>
    <td colspan="2"><label>当前总体积</label></td>
    <td colspan="2"><s:textfield name="totalVehicleVolume" readonly="true" style="width:80px"/></td>
    	<tr>
    	<tr>
        	<th scope="col" class="rounded-company"></th>
            <th scope="col" class="rounded">编号</th>
            <th scope="col" class="rounded">当前状态</th>
			 <th scope="col" class="rounded">载重量</th>
			 <th scope="col" class="rounded">体积</th>
            <th scope="col" class="rounded">所在配送点</th>
            <th scope="col" class="rounded">目的配送点</th>
			<th scope="col" class="rounded-q4">生产厂家</th>
        </tr>
    </thead>
       <tfoot>
    	<tr>
        <td colspan="9" align="left">
             <a href="javascript:orderAndVehicleCheckAll('selectedVehicleIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>全选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:orderAndVehicleCheckAllNo('selectedVehicleIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>取消</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
             <a href="javascript:orderAndVehicleReserveCheck('selectedVehicleIDList');" class="lbt_blue"><span class="lbt_blue_lft"></span><strong>反选</strong><span class="lbt_blue_r"></span></a><a href="#" class="lbt_blue"></a>
        	<!-- <input type="checkbox" name="" value="" /><label>取消</label>
        	<input type="checkbox" name="" value="" style="width:30px"/><label>反选</label> --></td>
        <!-- <td colspan="5" class="rounded-foot-left"><em></em></td>
  -->
        </tr>
   
    </tfoot>
     <s:iterator value="vehicleList">
    <tbody>
    	<tr align="center">
        	<td><input type="checkbox" name="selectedVehicleIDList" value="<s:property value="id"/>" style="margin-top:10px"/></td>
            <td><s:property value="id"/></td>
            <s:if test="%{status==1}">
  			  <td>空闲</td>
 			  </s:if>
  			 <s:elseif test="%{status==2}">
  			 <td>在途</td>
  			 </s:elseif>
  			 <s:else>
 			  <td>调度中</td>
 			  </s:else>
            <td><s:property value="capacity"/></td>
            <td><s:property value="volume"/></td>
            <td><s:property value="stationBySourceId.name"/></td>
            <td><s:property value="stationByDestId.name"/></td>
			<td><s:property value="manufacturer"/></td>
			<input name="vehicleWeight" type="hidden" value="<s:property value="capacity"/>">
            <input name="vehicleVolume" type="hidden" value="<s:property value="volume"/>">
        </tr>     	
    </tbody>
    </s:iterator>


</table>
     <div class="pagination">
     <dt style="width:500px">
        <s:if test="%{vehicleCurrentPage==1}">
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=1" onclick="return false">首页</a>
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehicleCurrentPage-1}" onclick="return false"><< 上一页</a>
        </s:if>
        <s:else>
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=1" >首页</a>
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehicleCurrentPage-1}" ><< 上一页</a>
        </s:else>
 
        <s:if test="%{vehiclePageBean.totalPages!=0}">
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(0)}">${vehiclePageBean.pageList.get(0)}</a>
        </s:if>
        <s:else>
        <a href="">1</a>
        </s:else>
        
        
        
        <s:if test="%{vehiclePageBean.totalPages>=2}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(1)}">${vehiclePageBean.pageList.get(1)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{vehiclePageBean.totalPages>=3}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(2)}">${vehiclePageBean.pageList.get(2)}</a>
  		</s:if>
  		<s:else></s:else>
  		<s:if test="%{vehiclePageBean.totalPages>=4}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(3)}">${vehiclePageBean.pageList.get(3)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{vehiclePageBean.totalPages>=5}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(4)}">${vehiclePageBean.pageList.get(4)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{vehiclePageBean.totalPages>=6}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(5)}">${vehiclePageBean.pageList.get(5)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{vehiclePageBean.totalPages>=7}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(6)}">${vehiclePageBean.pageList.get(6)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{vehiclePageBean.totalPages>=8}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(7)}">${vehiclePageBean.pageList.get(7)}</a>
  		</s:if>
  		<s:else></s:else>
  		
  		<s:if test="%{vehiclePageBean.totalPages>=9}">
  		<a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.pageList.get(8)}">${vehiclePageBean.pageList.get(8)}</a>
  		</s:if>
  		<s:else></s:else>

        <s:if test="%{vehicleCurrentPage==vehiclePageBean.totalPages}">
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehicleCurrentPage+1}" onclick="return false">下一页 >></a>
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.totalPages}" onclick="return false">尾页</a>
        </s:if>
        <s:else>
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehicleCurrentPage+1}" >下一页 >></a>
        <a href="showReceiptVehicleCurrentPage.action?vehicleCurrentPage=${vehiclePageBean.totalPages}">尾页</a>
        </s:else>
          <an>共有${orderPageBean.totalPages}页  跳到</an>
       </dt>
       <dt style="width:90px">
          
        <s:textfield name="sVehicleCurrentPage" style="width:25px"></s:textfield><an>页</an>
       <a href="javascript:showReceiptOrderCurrentPage();">跳</a>
       </dt>
        </div> 
	 <a href="javascript:selectCarrierAndRecipient();" class="bt_green"><span class="bt_green_lft"></span><strong>下一步</strong><span class="bt_green_r"></span></a><a href="#" class="bt_green"></a> 
     
</form>    
</div><!-- end of right content--> 
     </div>   <!--end of center content -->               
                     
     <div class="clear"></div>
     </div> <!--end of main content-->
	
    <jsp:include page="footer.jsp" flush="true"/>

</div>		
</body>
</html>