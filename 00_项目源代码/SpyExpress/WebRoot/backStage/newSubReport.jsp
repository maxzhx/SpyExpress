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

		<jsp:include page="header.jsp" />   
    <div class="main_content">   
    <jsp:include page="menu.jsp" />                  
    <div class="center_content">       
    <jsp:include page="left.jsp"/>

					<div class="right_content">

						<h2>
							生成配送点报表
						</h2>
						<div class="form">

							<s:form action="submitAddForSub" enctype="multipart/form-data"
								javascriptTooltip="true">
								<table border="0" cellpadding="4" cellspacing="1"
									style="width: 100%" height="20" class="niceform">
									<tr>
										<td align="right" style="padding-right: 20px">
											<label>
												选择年份
											</label>
										</td>
										<td>
											<s:select list="years" name="selectYear" label="年份"
												cssStyle="width:100px" />
										</td>

										<td align="right" style="padding-right: 20px">
											<label>
												选择配送点
											</label>
										</td>
										<td>
											<s:select list="stationList" listKey="id" listValue="name"
												name="selectStaId" label="配送点" cssStyle="width:100px" />
										</td>
									</tr>

									<tr>
										<td align="right" style="padding-right: 20px">
											<label>
												选择生成方式
											</label>
										</td>
										<td>
											<s:doubleselect list="{'按年', '按季度','按月'}" value="'按年'"
												doubleValue="'全年'"
												doubleList="top == '按月' ? {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'} : (top == '按年' ? {'全年'}:{'第一季度','第二季度','第三季度','第四季度'})"
												doubleName="selectDate" headerKey="0" emptyOption="true"
												cssStyle="width:100px" doubleCssStyle="width:100px" />
										</td>
										</td>

										<td align="right" style="padding-right: 20px">
											<label>
												选择报表类型
											</label>
										</td>
										<td>
											<s:select list="{'收货报表','发货报表'}" name="selectType"
												cssStyle="width:100px" />
										</td>
									</tr>
									<tr class="submit">
										<td />
											<td />
												<td />
										<td style="padding-top: 50px">
											<s:submit name="submit" id="submit" value="提交" />
										</td>
									</tr>
								</table>
							</s:form>

						</div>


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