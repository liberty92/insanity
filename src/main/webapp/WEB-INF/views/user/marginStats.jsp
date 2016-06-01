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
<title>Thống kê margin | Liberty Invest</title>
<!-- Meta data -->

<!-- CDN -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">

<c:if test="${empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style2.css">
</c:if>
<c:if test="${!empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/${sessionScope.theme}">
</c:if>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/core/favicon.ico">
<!-- 
LOCAL -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">

<%-- <link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet"> --%>

<!-- JS -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
</head>
<script
	src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bk.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/accounting.min.js"></script>

<style>
table {
	color: blue;
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
				<div class="col-md-12 listArticle"
					style="padding-left: 10px; padding-right: 10px;">
					<div
						style="border-bottom: 1px solid #00aeef; padding-top: 0px; padding-bottom: 10px; margin-top: 0px; margin-bottom: 5px;">
						<span
							style="text-transform: uppercase; font-size: 23px; font-weight: bold; color: #00aeef; float: left">
							Thống kê sử dụng margin</span> &nbsp; <a id="btn1"
							style="float: right; margin-left: 6px; padding: 3px 12px;"
							href="${pageContext.request.contextPath}/user/marginStatsHistory"
							class="btn btn-primary"> <i class="fa fa-history"> Lịch
								sử margin </i>
						</a> <a id="btn1"
							style="float: right; margin-left: 6px; padding: 3px 12px;"
							href="${pageContext.request.contextPath}/user/tradingAndTaxFee"
							class="btn btn-primary"> <i class="fa fa-list-alt">
								&nbsp; Thuế và phí giao dịch </i>
						</a> <span style="float: right; margin-top: 10px; color: red">Lãi
							vay margin hiện tại: ${marginRate}% / năm</span>

					</div>



					<div class="col-xs-12">


						<c:if test="${!empty sessionScope.updateMessage}">
							<div class="alert alert-success">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <strong>
									${sessionScope.updateMessage} <%
 	session.removeAttribute("updateMessage");
 %>
								</strong>
							</div>
						</c:if>
						<c:if test="${!empty sessionScope.updateError}">
							<div class="alert alert-danger">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <strong>
									${sessionScope.updateError} <%
 	session.removeAttribute("updateError");
 %>
								</strong>
							</div>
						</c:if>

						<div class="row" style="position: relative; min-height: 320px;">





							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="10">STT</th>
											<th width="10">ID tài khoản</th>
											<th width="10">Tỉ lệ margin</th>
											<th width="10">ID danh mục</th>
											<th width="10">Mã CK</th>
											<th width="10">Số lượng</th>
											<th width="80">Giá mua</th>
											<th width="10" style="min-width: 10px !important">Giá
												trị mua</th>
											<th width="10" style="min-width: 10px !important">Margin</th>
											<th width="10" style="min-width: 10px !important">Tiền
												vay</th>
											<th width="10" style="min-width: 10px !important">Lãi
												vay</th>
											<th width="80" style="min-width: 110px !important">Ngày
												mua</th>
										</tr>
									</thead>

									<c:forEach items="${listPortfolios}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center; font-weight: bold">${loop.index +1}</td>
											<td>${u.balanceId}</td>
											<td style="color: blue; font-weight: bold" class="formatPercent2">
												<c:forEach items="${listBalances}" var="balance">
													<c:if test="${balance.balanceId == u.balanceId}"> 
														${balance.balanceMarginRate} 
													</c:if>
												</c:forEach>
											</td>
											<td>${u.portfolioId}</td>
											<td style="color: blue; font-weight: bold">
												<c:forEach
													items="${listStocks}" var="stock">
													<c:if test="${stock.stockId == u.stockId}"> 
														${stock.stockName} 
														<c:set var="thisMarginRate" scope="session"
															value="${stock.stockMarginRate}" />
													</c:if>
												</c:forEach>
											</td>
											<td class="formatQuantity" style="text-align: right">${u.quantity}</td>
											<td style="text-align: right">${u.buyPrice}</td>
											<td class="formatNummber" style="text-align: right">${u.buyPrice * u.quantity*1000}</td>
											<td style="text-align: right">${thisMarginRate}</td>
											<td class="formatNummber"
												style="text-align: right; color: red">${u.marginDebt}</td>
											<td class="formatNummber" style="text-align: right; color:red">
												<c:forEach items="${marginDebtList}" var="debt">
													<c:if test="${debt.portfolioId == u.portfolioId}"> 
														${debt.marginDebt}
													</c:if>
												</c:forEach>
											</td>

											<td class="formatTime">${u.buyDate}</td>
										</tr>
									</c:forEach>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>

<script type="text/javascript">



	$.fn.digits = function() {
		return this.each(function() {
			$(this).text(
					$(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		})
	};

	$.fn.digits2 = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			$(this).text(accounting.formatMoney(a));
		})
	};

	$.fn.formatPercent = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			var b = Math.round(a * 100) / 100;
			$(this).text(b +"%");
		})
	};
	

	$.fn.formatPercent2 = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			var b = Math.round(a * 100) ;
			$(this).text(b +"%");
		})
	};
	
	$.fn.formatTime = function() {
		return this.each(function() {
			var a = ($(this).text());
			$(this).text(a.substring(10, 19) + " "+ a.substring(8, 10) + "/"+a.substring(5, 7)+"/"+a.substring(0, 4) );
		})
	};
	
	$.fn.formatQuantity = function() {
		return this.each(function() {
			 
			
			var a = parseFloat($(this).text());
			var str = accounting.formatMoney(a);
			$(this).text(str.substring(0, str.length - 2));
		})
	};

	function confirmDelete() {
		var x = 2;
		bootbox.prompt("Hãy nhập OK để xác nhận xóa tài khoản", function(result) {                
			  if (result == "OK") {
				  x = 4;
				  alert(x>3);
			  }
		});
		
		return x>3;
	};

	accounting.settings = {
		currency : {
			symbol : " đ", // default currency symbol is '$'
			format : "%v%s", // controls output: %s = symbol, %v = value/number (can be object: see below)
			decimal : ".", // decimal point separator
			thousand : ",", // thousands separator
			precision : 0
		// decimal places
		},
		number : {
			precision : 0, // default precision on numbers is 0
			thousand : ",",
			decimal : "."
		}
	};
	/* var xx = ${user.userId};
	var x2 = accounting.formatMoney(xx);
	$('#n1').html(x2); */

	$(document).ready(
			function() {
				
				$('#dataTable').DataTable();

				$('#cashInput').keyup(function() {
					var raw_num = $(this).val();
					var form_num = accounting.formatMoney(raw_num);
					$('#cashDisplay').html(form_num);
				});
				/* $("body").keyup(function(){ 
						$(".formatNummber").html(accounting.formatMoney(123456789));
					}); */
				//$(".formatNummber").html(accounting.formatMoney($(this).val()));
				// $(".formatNummber").digits();
				$(".formatNummber").digits2();
				$(".formatPercent2").formatPercent2();
				$(".formatPercent").formatPercent();
				$(".formatTime").formatTime();
				$(".formatQuantity").formatQuantity();
				var glow = $('.insanity');
				setInterval(function() {
					glow.hasClass('glow') ? glow.removeClass('glow') : glow
							.addClass('glow');
				}, 4000);
			});
</script>
