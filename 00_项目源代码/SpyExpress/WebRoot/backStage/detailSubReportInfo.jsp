<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>烟草物流后台系统</title>
	</head>
	<body>
		<div id="main_container">

			<jsp:include page="header.jsp" flush="true" />
			<div class="main_content">
				<jsp:include page="menu.jsp" flush="true" />
				<div class="center_content">
					<jsp:include page="left.jsp" flush="true" />

					<div class="right_content">

						<h2>
							<s:property value="report.rpDate" />  <s:property value="report.station.name" />  配送点报表详情
						</h2>
						<table id="rounded-corner" class="niceform">
							<form name="form2" action="searchOrder.action" method="post">
								<thead>

									<tr align="center">
										<th scope="col" class="rounded-company"></th>
										<th scope="col" class="rounded">
											重量
										</th>
										<th scope="col" class="rounded">
											体积
										</th>
										<th scope="col" class="rounded">
											运费
										</th>
										<th scope="col" class="rounded">
											寄件人
										</th>
										<th scope="col" class="rounded">
											收件人
										</th>
										<th scope="col" class="rounded">
											收货时间
										</th>
									</tr>
								</thead>

							</form>

							<s:iterator value="subItems">
								<tr align="center">

									<td>
										<s:property value="orederId" />
									</td>
									<td>
										<s:property value="weight" />
									</td>
									<td>
										<s:property value="volume" />
									</td>
									<td>
										<s:property value="price" />
									</td>
									<td>
										<s:property value="sender" />
									</td>
									<td>
										<s:property value="receiver" />
									</td>
									<td>
										<s:date name="time" format="yyyy.MM.dd HH:mm" />
									</td>

								</tr>
							</s:iterator>

						</table>
						<form name="form3" action="showDetailSubCurrentPage.action"
							method="post" class="niceform">

							<div class="pagination">
							<dt style="width:400px">
								<s:if test="%{currentPage==1}">
									<a href="showDetailSubCurrentPage.action?currentPage=1"
										onclick="return false">首页</a>
									<a
										href="showDetailSubCurrentPage.action?currentPage=${currentPage-1}"
										onclick="return false"><< 上一页</a>
								</s:if>
								<s:else>
									<a href="showDetailSubCurrentPage.action?currentPage=1">首页</a>
									<a
										href="showDetailSubCurrentPage.action?currentPage=${currentPage-1}"><<
										上一页</a>
								</s:else>

								<s:if test="%{pageBean.totalPages!=0}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(0)}">${pageBean.pageList.get(0)}</a>
								</s:if>
								<s:else>
									<a href="">1</a>
								</s:else>
								<s:if test="%{pageBean.totalPages>=2}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(1)}">${pageBean.pageList.get(1)}</a>
								</s:if>
								<s:else></s:else>

								<s:if test="%{pageBean.totalPages>=3}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(2)}">${pageBean.pageList.get(2)}</a>
								</s:if>
								<s:else></s:else>
								<s:if test="%{pageBean.totalPages>=4}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(3)}">${pageBean.pageList.get(3)}</a>
								</s:if>
								<s:else></s:else>

								<s:if test="%{pageBean.totalPages>=5}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(4)}">${pageBean.pageList.get(4)}</a>
								</s:if>
								<s:else></s:else>

								<s:if test="%{pageBean.totalPages>=6}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(5)}">${pageBean.pageList.get(5)}</a>
								</s:if>
								<s:else></s:else>

								<s:if test="%{pageBean.totalPages>=7}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(6)}">${pageBean.pageList.get(6)}</a>
								</s:if>
								<s:else></s:else>

								<s:if test="%{pageBean.totalPages>=8}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(7)}">${pageBean.pageList.get(7)}</a>
								</s:if>
								<s:else></s:else>

								<s:if test="%{pageBean.totalPages>=9}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.pageList.get(8)}">${pageBean.pageList.get(8)}</a>
								</s:if>
								<s:else></s:else>

								<s:if test="%{currentPage==pageBean.totalPages}">
									<a
										href="showDetailSubCurrentPage.action?currentPage=${currentPage+1}"
										onclick="return false">下一页 >></a>
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.totalPages}"
										onclick="return false">尾页</a>
								</s:if>
								<s:else>
									<a
										href="showDetailSubCurrentPage.action?currentPage=${currentPage+1}">下一页
										>></a>
									<a
										href="showDetailSubCurrentPage.action?currentPage=${pageBean.totalPages}">尾页</a>
								</s:else>
        <an>共有${pageBean.totalPages}页  跳到</an>
       </dt>
       <dt style="width:90px">
          
        <s:textfield name="scurrentPage" style="width:25px"></s:textfield><an>页</an>
       <a href="javascript:form3.submit();">跳</a>
       </dt>
        </div> 

							</from>
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