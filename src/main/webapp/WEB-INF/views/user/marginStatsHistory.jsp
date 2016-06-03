<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lịch sử margin | Liberty Invest</title>
<!-- Meta data -->


<!-- Theme setting starts -->
<c:if test="${empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style2.css">
</c:if>
<c:if test="${!empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/${sessionScope.theme}">
</c:if>
<!-- Theme setting ends-->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/core/favicon.ico">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<style>
table {
	color: blue;
}
.listArticle {
	min-height: 370px !important;
}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="../template/frontend/header.jsp"></jsp:include>
			<!-- ====================== BODY STARTS =================================== -->
			<%@ include file="../template/frontend/menu/menu.jsp"%>
			<!--2. Main body-->
			<div class="row " style="margin: 0px 10px">
				<div class="col-md-12 listArticle"
					style="padding-left: 10px; padding-right: 10px;">
					<div
						style="border-bottom: 1px solid #00aeef; padding-top: 0px; padding-bottom: 10px; margin-top: 0px; margin-bottom: 5px;">
						<span
							style="text-transform: uppercase; font-size: 23px; font-weight: bold; color: #00aeef; float: left">
							Lịch sử sử dụng margin</span> &nbsp; <a id="btn1"
							style="float: right; margin-left: 6px; padding: 3px 12px;"
							href="${pageContext.request.contextPath}/user/balance"
							class="btn btn-primary"> <i class="fa fa-list-alt"> Quản
								lý tài khoản </i>
						</a> <a id="btn1"
							style="float: right; margin-left: 6px; padding: 3px 12px;"
							href="${pageContext.request.contextPath}/user/trading"
							class="btn btn-primary"> <i class="fa fa-sign-in">
								&nbsp; Đặt lệnh </i>
						</a> <span style="float: right; margin-top: 10px; color: red">Lãi
							vay margin hiện tại: ${marginRate}% / năm</span>

					</div>
					<div class="col-xs-12">
						<c:if test="${!empty sessionScope.updateMessage}">
							<div class="alert alert-success">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <strong>
									${sessionScope.updateMessage} <% session.removeAttribute("updateMessage");%>
								</strong>
							</div>
						</c:if>
						<c:if test="${!empty sessionScope.updateError}">
							<div class="alert alert-danger">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <strong>
									${sessionScope.updateError} <% session.removeAttribute("updateError"); %>
								</strong>
							</div>
						</c:if>
						<div class="row" style="position: relative; min-height: 320px;">
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="30">STT</th>
											<th width="30">ID tài khoản</th>
											<!-- <th width="30">ID danh mục</th> -->
											<th width="80">Mã CK</th>
											<th width="80">Số lượng</th>
											<th width="80">Giá mua</th>
											<th width="100" style="min-width: 80px !important">Giá
												trị mua</th>
											<th width="80" style="min-width: 10px !important">Tỉ lệ
												margin</th>
											<th width="80" style="min-width: 10px !important">Tiền
												vay</th>
											<th width="80" style="min-width: 10px !important">Lãi
												vay</th>
											<th width="80" style="min-width: 10px !important">Ngày
												mua</th>
											<th width="80" style="min-width: 10px !important">Ngày
												bán</th>
										</tr>
									</thead>
									<c:forEach items="${listPortfolios}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center; font-weight: bold">${loop.index +1}</td>
											<td>${u.balanceId}</td>
											<%-- <td>${u.portfolioId}</td> --%>
											<td style="color: blue; font-weight: bold"><c:forEach
													items="${listStocks}" var="stock">
													<c:if test="${stock.stockId == u.stockId}"> 
														${stock.stockName} 
														<c:set var="thisMarginRate" scope="session"
															value="${stock.stockMarginRate}" />
													</c:if>
												</c:forEach></td>
											<td class="formatQuantity" style="text-align: right">${u.quantity}</td>
											<td style="text-align: right">${u.buyPrice}</td>
											<td class="formatNummber" style="text-align: right">${u.buyPrice * u.quantity*1000}</td>
											<td style="text-align: right">${thisMarginRate}</td>
											<td class="formatNummber"
												style="text-align: right; color: red">${u.marginDebt}</td>
											<td class="formatNummber"
												style="text-align: right; color: red"><c:forEach
													items="${marginDebtList}" var="debt">
													<c:if test="${debt.portfolioId == u.portfolioId}"> 
														${debt.marginDebt}
													</c:if>
												</c:forEach></td>
											<td class="formatTime">${u.buyDate}</td>
											<td class="formatTime">${u.sellDate}</td>
										</tr>
									</c:forEach>
									</div>
								</table>
							</div>
							<div class="col-xs-12"
								style=" position: absolute; bottom: 0; padding-left: 0px; padding-right:0px">
								<table id="dataTable" style="margin-bottom: 0px"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="40%" style="min-width: 70% !important;">Tỉ lệ
												force sell : 30%</th>
											<th width="80" style="min-width: 110px !important;">Tổng
												vốn vay margin: <span style="float: right; color: #000;"
												class="formatNummber">${totalMarginDebt}</span>
											</th>
											<th width="80" style="min-width: 110px !important;">Tổng
												lãi vay: <span style="float: right; color: #000;"
												class="formatNummber">${totalMarginDebtInterest}</span>
											</th>
											<th width="80" style="min-width: 110px !important;">Tổng
												vốn và lãi: <span style="float: right; color: #000;"
												class="formatNummber">${totalMarginDebt + totalMarginDebtInterest}</span>
											</th>
										</tr>
									</thead>
								</table> 
							</div>
						</div>
					</div>
				</div>
				<%-- 
				<div class="col-md-3" style="padding-right: 0px">
					<div class="col-xs-12 sideBarWrapper">
						<div class="Side-bar">
							<%@ include file="../template/frontend/rightside.jsp"%>
						</div>
					</div>
				</div> --%>
			</div>
		</div>
		<!-- ====================== BODY ENDS =================================== -->
		<!--3. Footer include-->
	</div>
	<div class="col-xs-12" style="margin-top: 10px">
		<%@ include file="../template/backend/footer.jsp"%>
	</div>
	</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/accounting.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/insanity.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
				$('#dataTable').DataTable();
				$('#cashInput').keyup(function() {
					var raw_num = $(this).val();
					var form_num = accounting.formatMoney(raw_num);
					$('#cashDisplay').html(form_num);
				}); 
				$(".formatNummber").digits2();
				$(".formatPercent").formatPercent();
				$(".formatTime").formatTime();
				$(".formatQuantity").formatQuantity(); 
			});
</script>
