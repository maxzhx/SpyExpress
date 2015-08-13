<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
							<s:property value="report.rpDate" />  总公司报表详情
						</h2>


						<table id="rounded-corner"
							summary="2007 Major IT Companies' Profit">
							<thead align="center">
								<tr>

									<th scope="col" class="rounded">
										配送点名称
									</th>
									<th scope="col" class="rounded">
										重量（公斤）
									</th>
									<th scope="col" class="rounded">
										体积（立方米）
									</th>
									<th scope="col" class="rounded-q4">
										收入（元）
									</th>
								</tr>
							</thead>

							<tbody>
								<s:iterator value="headItems">
									<tr align="center">

										<td>
											<s:property value="stationName" />
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
									</tr>
								</s:iterator>

							</tbody>
						</table>



						<div style="display: block">
							<jsp:include page="grp.jsp" flush="true" /></div>

					</div>
					<!-- end of right content-->


				</div>
				<!--end of center content -->

				<div class="clear"></div>
			</div>
			<!--end of main content-->

			<jsp:include page="footer.jsp" flush="true" />

		</div>
	</body>
</html>