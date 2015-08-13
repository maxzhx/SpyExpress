<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.spy.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>烟草物流前台系统</title>
	</head>
	<body>
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
							查询结果
						</h2>
						<div class="form">

							<form action="" method="post" class="niceform">

								<table id="rounded-corner"
									summary="2007 Major IT Companies' Profit">
									<thead>

									</thead>
									<tfoot>
										<tr>


										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td align="center">
												<label for="comments">
													订单号:
												</label>
											</td>
											<td>
												${order.id}
											</td>
											<td />
												<td />
										</tr>
										<!--<table border="0" cellpadding="4" cellspacing="1" style="width:100%" height="20" class="niceform">
                   -->
										<tr>
											<td align="center">
												<label for="comments">
													发货地:
												</label>
											</td>
											<td>
												${sourceStation}
											</td>



											<td align="center">
												<label for="comments">
													配送价格:
												</label>
											</td>
											<td>
												${order.price} 元
											</td>


										</tr>
										<tr>

											<td align="center">
												<label for="comments">
													目的地:
												</label>
											</td>
											<td>
												${destStation}
											</td>


											<td align="center">
												<label for="comments">
													货物重量:
												</label>
											</td>
											<td>
												${order.weight} 公斤
											</td>

										</tr>
										<tr>
											<td align="center">
												<label for="comments">
													预计路径:
												</label>
											</td>
											<td>
												${order.path}
											</td>



											<td align="center">
												<label for="comments">
													货物体积:
												</label>
											</td>
											<td>
												${order.volume} 立方米
											</td>

										</tr>
										<tr>


											<td align="center">
												<label for="comments">
													当前站点:
												</label>
											</td>
											<td>
												${order.station.name}
											</td>
											<td align="center">
												<label for="comments">
													订单状态:
												</label>

												<s:if test="%{order.status==1}">
													<td>
														未确认
													</td>
												</s:if>
												<s:elseif test="%{order.status==2}">
													<td>
														待发货
													</td>
												</s:elseif>
												<s:elseif test="%{order.status==3}">
													<td>
														途中
													</td>
												</s:elseif>
												<s:elseif test="%{order.status==4}">
													<td>
														未收货
													</td>
												</s:elseif>
												<s:elseif test="%{order.status==5}">
													<td>
														已完成
													</td>
												</s:elseif>
												<s:else>
													<td>
														已取消
													</td>
												</s:else>
											</td>

										</tr>

										<tr>
											<td align="center">
												<label for="comments">
													发货时间:
												</label>
											</td>
											<td>
												${order.sendTime}
											</td>
											<td align="center">
												<label for="comments">
													收货时间:
												</label>
											</td>
											<td>
												${order.recvTime}
											</td>
										</tr>
										<tr>
										<td align="center" ><label for="comments" > 订单配送信息:</label></td>
										<td colspan="3">${pathMessage}</td>
										</tr>
										<tr>
											<td align="center">
												<label for="comments">
													备注信息:
												</label>
											</td>
											<td>
												${order.note}
											</td>
											<td align="center">
												<label for="comments">
													二维码:
												</label>
											</td>
											<td>
												<img
													src="http://chart.apis.google.com/chart?cht=qr&chs=100x100&chl=订单号:${order.id}" />
											</td>
										</tr>

										<tr style="height: 15px;"></tr>
										<tr>
											<td />
												<td>
													<label for="comments">
														寄件人资料
													</label>
												</td>

												<td>
													<label for="comments">
														收货人资料
													</label>
												</td>
												<td />
										</tr>

										<tr>
											<td align="center">
												<label for="comments">
													姓名:
												</label>
											</td>
											<td>
												${order.customer.realName}
											</td>

											<td>
												${order.recvName}
											</td>
											<td />
										</tr>
										<tr>
											<td align="center">
												<label for="comments">
													电话:
												</label>
											</td>
											<td>
												${order.customer.mobilephone}
											</td>

											<td>
												${order.recvPhone}
											</td>
											<td />
										</tr>
										<tr>
											<td align="center">
												<label for="comments">
													地址:
												</label>
											</td>
											<td>
												${order.customer.address}
											</td>

											<td>
												${order.recvAddress}
											</td>
											<td />
										</tr>
										<tr />
									</tbody>
								</table>

							</form>
						</div>
					</div>
					<!-- end of right content-->

				</div>
				<!--end of center content -->

				<div class="clear"></div>
			</div>
			<!--end of main content-->

			<div class="footer">
				<%@ include file="foot.jsp"%>
			</div>

		</div>
	</body>
</html>