<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>烟草物流后台系统</title>
		<script type="text/javascript" src="../js/selectAll.js">
</script>
		<script type="text/javascript">
function checkNoSubReport(name) {
	var el = document.getElementsByTagName('input');
	var len = el.length;
	var flag = 0;
	for ( var i = 0; i < len; i++) {
		if ((el[i].type == "checkbox") && (el[i].name == name)) {
			if (el[i].checked == true) {
				flag = 1;
			}
		}
	}
	if (flag == 0) {
		ymPrompt.alert('没有选中任何报表！', null, null, '提示');
	} else {
		form1.action = "deleteMultiReportForSub.action";
		form1.submit();
	}
}
function searchReport() {
	var regex = /^ *\d{2}年 (\d{2}月|第一季度|第二季度|第三季度|第四季度|全年) *$/;
	var test = document.getElementById('date').value;
	if (test != "" && test.match(regex) == null) {
		alert("报表时间格式不正确！示例：13年 07月");
	} else {
		form1.action = "searchReportForSub.action";
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

						<h2>
							配送点报表
						</h2>
						<form name="form1" action="showAllReportForSub.action"
							method="post" class="niceform">
							<table id="rounded-corner"
								summary="2007 Major IT Companies' Profit">
								<thead>
									<tr>
										<td></td>
										<td style="width: 100px">
											<s:textfield id="date" name="searchDate" style="width:55px"></s:textfield>
										</td>
										<td>
											<s:select
												list="{'月报 发货','月报 收货','季报 发货','季报 收货','年报 发货','年报 收货'}"
												name="searchType" headerKey="" headerValue=""></s:select>

										</td>
										<td>
											<s:select list="stationList" listKey="id" listValue="name"
												name="selectStaId" headerKey="0" headerValue="" />
										</td>
										<td />
											<td />
												<td />
													<td>
													</td>
													<td>
														<a href="javascript:searchReport();"><img
																src="../images/search.png" alt="" title="" border="0" />
														</a>
													</td>
													<td>
														<a href="cancelSearchForSub.action"><img
																src="../images/error.png" alt="" title="" border="0"
																style="height: 22px;" /> </a>
													</td>
									</tr>
									<tr align="center">
										<th scope="col" class="rounded-company"></th>
										<th scope="col" class="rounded">
											报表时间
										</th>
										<th scope="col" class="rounded">
											报表类型
										</th>
										<th scope="col" class="rounded">
											配送点
										</th>
										<th scope="col" class="rounded">
											总重量
										</th>
										<th scope="col" class="rounded">
											总体积
										</th>
										<th scope="col" class="rounded">
											配送收入
										</th>
										<th scope="col" class="rounded">
											生成时间
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
										<td colspan="10" align="left">
											<a href="javascript:checkAll('selectList');" class="lbt_blue"><span
												class="lbt_blue_lft"></span><strong>全选</strong><span
												class="lbt_blue_r"></span> </a><a href="#" class="lbt_blue"></a>
											<a href="javascript:checkAllNo('selectList');"
												class="lbt_blue"><span class="lbt_blue_lft"></span><strong>取消</strong><span
												class="lbt_blue_r"></span> </a><a href="#" class="lbt_blue"></a>
											<a href="javascript:reserveCheck('selectList');"
												class="lbt_blue"><span class="lbt_blue_lft"></span><strong>反选</strong><span
												class="lbt_blue_r"></span> </a><a href="#" class="lbt_blue"></a>
										</td>
									</tr>

								</tfoot>

								<tbody>
									<s:iterator value="reportList">
										<tr align="center">
											<td>
												<input type="checkbox" name="selectList"
													value="<s:property value="viewName"/>" style="margin-top:15px"/>
											</td>
											<td>
												<s:property value="rpDate" />
											</td>
											<td>
												<s:if test="rpType==4 ">
														年报 发货
												</s:if>
												<s:elseif test="rpType==5">
														季报 发货
												</s:elseif>
												<s:elseif test="rpType==6">
														月报 发货
												</s:elseif>
												<s:elseif test="rpType==7">
														年报 收货
												</s:elseif>
												<s:elseif test="rpType==8">
														季报 收货
												</s:elseif>
												<s:elseif test="rpType==9">
														月报 收货
												</s:elseif>
												<s:else>
													<s:property value="rpType" />
												</s:else>
											</td>
											<td>
												<s:property value="station.name" />
											</td>
											<td>
												<s:property value="totalWeight" />
											</td>
											<td>
												<s:property value="totalVolume" />
											</td>
											<td>
												<s:property value="totalIncome" />
											</td>
											<td>
												<s:date name="gnDate" format="yyyy.MM.dd" />
											</td>
											<td>
												<a
													href="showReportItemForSub.action?viewName=<s:property value="viewName"/>">
													<img src="../images/info.png" alt="" title="" border="0" />
												</a>
											<td>
												<a
													href="deleteReportForSub.action?viewName=<s:property value="viewName"/>"
													class="ask"><img src="../images/trash.png" alt=""
														title="" border="0" /> </a>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							<div style="display: block">
						<s:if test="searchType!=''  && selectStaId!=0 && searchDate==''">
						<jsp:include page="grpTime.jsp" />
					</s:if>
						</div>
						</form>
						<form name="form3" action="showReportSubCurrentPage.action"
							method="post" class="niceform">
							<div class="pagination">
								<dt style="width: 500px">
									<s:if test="%{currentPage==1}">
										<a href="showReportSubCurrentPage.action?currentPage=1"
											onclick="return false">首页</a>
										<a
											href="showReportSubCurrentPage.action?currentPage=${currentPage-1}"
											onclick="return false"><< 上一页</a>
									</s:if>
									<s:else>
										<a href="showReportSubCurrentPage.action?currentPage=1">首页</a>
										<a
											href="showReportSubCurrentPage.action?currentPage=${currentPage-1}"><<
											上一页</a>
									</s:else>

									<s:if test="%{pageBean.totalPages!=0}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(0)}">${pageBean.pageList.get(0)}</a>
									</s:if>
									<s:else>
                                        <a href="">1</a>
                                    </s:else>
									<s:if test="%{pageBean.totalPages>=2}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(1)}">${pageBean.pageList.get(1)}</a>
									</s:if>
									<s:else></s:else>

									<s:if test="%{pageBean.totalPages>=3}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(2)}">${pageBean.pageList.get(2)}</a>
									</s:if>
									<s:else></s:else>
									<s:if test="%{pageBean.totalPages>=4}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(3)}">${pageBean.pageList.get(3)}</a>
									</s:if>
									<s:else></s:else>

									<s:if test="%{pageBean.totalPages>=5}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(4)}">${pageBean.pageList.get(4)}</a>
									</s:if>
									<s:else></s:else>

									<s:if test="%{pageBean.totalPages>=6}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(5)}">${pageBean.pageList.get(5)}</a>
									</s:if>
									<s:else></s:else>

									<s:if test="%{pageBean.totalPages>=7}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(6)}">${pageBean.pageList.get(6)}</a>
									</s:if>
									<s:else></s:else>

									<s:if test="%{pageBean.totalPages>=8}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(7)}">${pageBean.pageList.get(7)}</a>
									</s:if>
									<s:else></s:else>

									<s:if test="%{pageBean.totalPages>=9}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.pageList.get(8)}">${pageBean.pageList.get(8)}</a>
									</s:if>
									<s:else></s:else>

									<s:if test="%{currentPage==pageBean.totalPages}">
										<a
											href="showReportSubCurrentPage.action?currentPage=${currentPage+1}"
											onclick="return false">下一页 >></a>
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.totalPages}"
											onclick="return false">尾页</a>
									</s:if>
									<s:else>
										<a
											href="showReportSubCurrentPage.action?currentPage=${currentPage+1}">下一页
											>></a>
										<a
											href="showReportSubCurrentPage.action?currentPage=${pageBean.totalPages}">尾页</a>
									</s:else>

									<an>
									共有${pageBean.totalPages}页 跳到
									</an>
								</dt>
								<dt style="width: 90px">

									<s:textfield name="scurrentPage" cssStyle="width:25px"></s:textfield>
									<an>
									页
									</an>
									<a href="javascript:form3.submit();">跳</a>
								</dt>
							</div>
							<a href="javascript:checkNoSubReport('selectList');"
								class="bt_red tip"><span class="bt_red_lft tip"></span><strong>删除</strong><span
								class="bt_red_r"></span> </a><a href="#" class="bt_red"></a>
						</form>


					</div>
					
				</div>
				<!--end of center content -->

				<div class="clear"></div>
			</div>
			<!--end of main content-->

			<jsp:include page="footer.jsp" flush="true" />

		</div>
	</body>
</html>