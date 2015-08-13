<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>烟草物流前台系统</title>

<script type="text/javascript">
var status = '<s:property value="status"/>';
if(status == "1")
	alert("成功删除未确认订单！");
else if(status == "2")
	alert("订单以确认不能删除！");
document.getElementById('status').value="0";
function searchOrder() {
	form1.action = "searchOrder.action";
	form1.submit();
}
</script>
	</head>
	<body >
	
		<div id="main_container">

			<%@ include file="head.jsp"%>

			<div class="main_content">

				<%@ include file="menu.jsp"%>

				<div class="center_content">



					<div class="left_content">

						<%@ include file="left.jsp"%>
					</div>

					<div class="right_content">

						<h2>
							订单管理
						</h2>
						<form name="form1" action="" method="post" class="">
						<s:hidden name="status" id="status" value="0"/>
							<table id="rounded-corner"
								summary="2007 Major IT Companies' Profit" class="niceform" align="right">
								<thead>
									<tr style="width: 1607px;">
										<td>
										</td>
										<td>
											<s:textfield name="orderId" style="width: 40px; " />
										</td>
										<td>
											<s:select list="#{1:'未确认',2:'待发货',3:'途中',4:'未收货',5:'已完成'}"
												id="selectType" name="stateID" headerKey="0"
												headerValue="所有">
											</s:select>
										</td>

										<td>
										</td>
										<td>
										</td>

										<td>
											<s:select list="stationList" listValue="name" listKey="id"
												name="stationID" headerKey="0" headerValue="所有"></s:select>
										</td>
										<td>
											<a href="javascript:searchOrder();"><img
													src="../images/search.png" alt="" title="" border="0" />
											</a>
										</td>
										<td>
											<a href="flashSearchCondition.action"><img
													src="../images/error.png" alt="" title="" border="0"
													style="height: 22px;" />
											</a>
										</td>
									</tr>
									<tr>
										<th scope="col" class="rounded-company"></th>
										<th scope="col" class="rounded">
											编号
										</th>
										<th scope="col" class="rounded">
											当前状态
										</th>
										<th scope="col" class="rounded">
											重量
										</th>
										<th scope="col" class="rounded">
											体积
										</th>
										<th scope="col" class="rounded">
											当前站点
										</th>
										<th scope="col" class="rounded">
											查看
										</th>
										<th scope="col" class="rounded-q4">
											删除
										</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<!-- <input type="checkbox" name="" value="" /><label>取消</label>
        	<input type="checkbox" name="" value="" style="width:30px"/><label>反选</label> -->
										</td>
										<!-- <td colspan="5" class="rounded-foot-left"><em></em></td>
  -->
									</tr>

								</tfoot>
								<s:iterator value="orderList">
									<tbody>
										<tr>
											<td>
												<input type="checkbox" name="" />
											</td>
											<td align="center">
												<s:property value="id" />
											</td>
											<s:if test="%{status==1}">
												<td align="center">
													未确认
												</td>
											</s:if>
											<s:elseif test="%{status==2}">
												<td align="center">
													待发货
												</td>
											</s:elseif>
											<s:elseif test="%{status==3}">
												<td align="center">
													途中
												</td>
											</s:elseif>
											<s:elseif test="%{status==4}">
												<td align="center">
													未收货
												</td>
											</s:elseif>
											<s:elseif test="%{status==5}">
												<td align="center">
													已完成
												</td>
											</s:elseif>
											<s:else>
												<td align="center">
													已取消
												</td>
											</s:else>
											<td align="center">
												<s:property value="weight" />
											</td>
											<td align="center">
												<s:property value="volume" />
											</td>
											<td align="center">
												<s:property value="station.name" />
											</td>
											<td align="center">
												<a href="showOrder.action?orderID=<s:property value="id"/>"><img
														src="../images/info.png" alt="" title="" border="0" />
												</a>
											</td>
											<td align="center">
												<a
													href="deleteFrontOrder.action?orderID=<s:property value="id"/>"
													class="ask"><img src="../images/trash.png" alt=""
														title="" border="0" />
												</a>
											</td>
										</tr>

									</tbody>
								</s:iterator>
							</table>
						</form>
					
					<form name="form3" action="showOrderCurrentPage.action"
						method="post" class="niceform">
					
						<div class="pagination">
						<dt style="width:500px">
							<s:if test="%{currentPage==1}">
								<a href="showOrderCurrentPage.action?currentPage=1"
									onclick="return false">首页</a>
								<a
									href="showOrderCurrentPage.action?currentPage=${currentPage-1}"
									onclick="return false"><< 上一页</a>
							</s:if>
							<s:else>
								<a href="showOrderCurrentPage.action?currentPage=1">首页</a>
								<a
									href="showOrderCurrentPage.action?currentPage=${currentPage-1}"><<
									上一页</a>
							</s:else>

							<s:if test="%{pageBean.totalPages!=0}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(0)}">${pageBean.pageList.get(0)}</a>
							</s:if>
							<s:else>
								<a href="">1</a>
							</s:else>
							<s:if test="%{pageBean.totalPages>=2}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(1)}">${pageBean.pageList.get(1)}</a>
							</s:if>
							<s:else></s:else>

							<s:if test="%{pageBean.totalPages>=3}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(2)}">${pageBean.pageList.get(2)}</a>
							</s:if>
							<s:else></s:else>
							<s:if test="%{pageBean.totalPages>=4}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(3)}">${pageBean.pageList.get(3)}</a>
							</s:if>
							<s:else></s:else>

							<s:if test="%{pageBean.totalPages>=5}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(4)}">${pageBean.pageList.get(4)}</a>
							</s:if>
							<s:else></s:else>

							<s:if test="%{pageBean.totalPages>=6}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(5)}">${pageBean.pageList.get(5)}</a>
							</s:if>
							<s:else></s:else>

							<s:if test="%{pageBean.totalPages>=7}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(6)}">${pageBean.pageList.get(6)}</a>
							</s:if>
							<s:else></s:else>

							<s:if test="%{pageBean.totalPages>=8}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(7)}">${pageBean.pageList.get(7)}</a>
							</s:if>
							<s:else></s:else>

							<s:if test="%{pageBean.totalPages>=9}">
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.pageList.get(8)}">${pageBean.pageList.get(8)}</a>
							</s:if>
							<s:else></s:else>

							<s:if test="%{currentPage==pageBean.totalPages}">
								<a
									href="showOrderCurrentPage.action?currentPage=${currentPage+1}"
									onclick="return false">下一页 >></a>
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.totalPages}"
									onclick="return false">尾页</a>
							</s:if>
							<s:else>
								<a
									href="showOrderCurrentPage.action?currentPage=${currentPage+1}">下一页
									>></a>
								<a
									href="showOrderCurrentPage.action?currentPage=${pageBean.totalPages}">尾页</a>
							</s:else>

							<an>共有${pageBean.totalPages}页  跳到</an>
       </dt>
       <dt style="width:90px">
          
        <s:textfield name="scurrentPage" style="width:25px"></s:textfield><an>页</an>
       <a href="javascript:form3.submit();">跳</a>
       </dt>
       </div>
					
					</form>
					
					<a href="frontnewOrder.action" class="bt_green"><span
						class="bt_green_lft"></span><strong>增加</strong><span
						class="bt_green_r"></span>
					</a><a href="#" class="bt_green"></a>
					<s:if test="%{stateID==1}">
					</s:if>
				</div>
				<!-- end of right content-->

			</div>
			<!--end of center content -->

			<div class="clear"></div>
		
		<!--end of main content-->

		
</div>
<div class="footer">
			<%@ include file="foot.jsp"%>
		</div>
</div>
	</body>
</html>

