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
<title>Lịch sử giao dịch | Liberty Invest</title>
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
	color: black;
}
.listArticle{
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
				<!-- <div class="col-md-9 listArticle" -->
				<div class="col-md-12 listArticle"
					style="padding-left: 10px; padding-right: 10px;">
					<div
						style="border-bottom: 1px solid #00aeef; padding-top: 0px; padding-bottom: 10px; margin-top: 0px; margin-bottom: 5px;">
						<span
							style="text-transform: uppercase; font-size: 23px; font-weight: bold; color: #00aeef; float: left">
							Lịch sử đặt lệnh</span> &nbsp; <span
							style="float: right; margin-top: 10px">User ID:
							${user.userId} - ${user.userFullName}</span>
					</div>
					<div class="col-xs-12">
						<c:if test="${!empty sessionScope.updateMessage}">
							<div class="alert alert-success">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <strong>
									${sessionScope.updateMessage} <% session.removeAttribute("updateMessage");  %>
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
						<div class="row">
							<div class="table-responsive">
								<table id="dataTable" style="color: blue"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="20">STT</th>
											<th width="30">TK</th>
											<th width="30">ID</th>
											<th width="50">Mã CK</th>
											<th width="80" style="max-width: 80px !important; padding-right:2px;">Hành động</th>
											<th width="80">Loại lệnh</th>
											<th width="80">Giá</th>
											<th width="80">Khối lượng</th>
											<th width="80" style="max-width: 100px !important; padding-right:8px;">Tổng GT</th>
											<th width="90" >Thời gian</th>
											<th width="80">Trạng thái</th>
										</tr>
									</thead>
									<c:forEach items="${listOrders}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center; font-weight: bold">${loop.index +1}</td>
											<td>${u.balanceId}</td>
											<td>${u.orderId}</td>
											<td style="color: blue; font-weight: bold"><c:forEach
													items="${listStocks}" var="stock">
													<c:if test="${stock.stockId == u.stockId}"> 
														${stock.stockName} 
													</c:if>
												</c:forEach></td>
											<td style="text-align: right; max-width: 80px !important;">${u.action}</td>
											<td style="text-align: right">${u.orderType}</td>
											<td style="text-align: right">${u.price}</td>
											<td class="formatQuantity" style="text-align: right">${u.quantity}</td>
											<td class="formatNummber"  style="text-align: right;max-width: 100px !important;">${u.price * u.quantity*1000}</td>
											<td class="formatTime" >${u.createdTime}</td>
											<td style="text-align: center; color:red;<c:if test="${u.orderState == 'WAITING'}">color: orange;</c:if> <c:if test="${u.orderState == 'SUCCEEDED'}">color: green;</c:if>">
												<c:if test="${u.orderState == 'SUCCEEDED'}">Đã khớp</c:if>
												<c:if test="${u.orderState == 'UNSUCCESSED'}">Không khớp</c:if>
												<c:if test="${u.orderState == 'WAITING'}">Chờ khớp</c:if>
												<c:if test="${u.orderState == 'CANCELLED'}">Đã hủy</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>

	<%-- 			<div class="col-md-3" style="padding-right: 0px">
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
<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/accounting.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/insanity.js"></script>
<script type="text/javascript">
	$(document).ready( function() { 
				 $('#dataTable').DataTable({
				        "aLengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
				        "iDisplayLength": -1
				    }); 
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
