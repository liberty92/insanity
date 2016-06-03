<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Portfolio manager - BK Securities core engine</title>
<!-- Meta data -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminstyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/accounting.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/images/core/favicon.ico"
	rel="shortcut icon">
<link
	href="${pageContext.request.contextPath}/resources/css/select2.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<%-- 
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/images/core/favicon.ico" rel="shortcut icon">

 --%>
<style type="text/css">
</style>
</head>
<body>
	<div class="container-fluid" style="width: 95%">
		<div class="row">
			<div class="row">
				<h1>
					<span style="color: #FF0000;">LIBERATION core engine</span> <span
						style="float: right;">Portfolio manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
					<br />
					
					
				<div class="panel panel-default row">
					<div class="panel-body">
						<h2>Add portfolio</h2>
						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addPortfolio"
								method="POST" role="form">

								<div class="row">

									<div class="col-sm-3">

										<div class="form-group">
											<label for="">Balance Id</label> <input type="hidden"
												class="form-control" name="portfolioId"
												value="${portfolio.portfolioId}" id=""
												placeholder="Demo content">
											<%-- 
										<input type="number"
										class="form-control" name="balanceId" value="${portfolio.balanceId}"
										id="" placeholder="Demo content"> --%>

											<select name="balanceId" id="input"
												class="form-control dropdownSelect" required="required">
												<c:forEach items="${listBalances}" var="balance">
													<option value="${balance.balanceId}"
														<c:if test="${balance.balanceId == portfolio.balanceId}"> selected="selected" </c:if>>
														<c:forEach items="${listUsers}" var="u">
															<c:if test="${balance.userId == u.userId}"> ${u.userFullName} </c:if>
														</c:forEach> - ${balance.balanceId}
													</option>
												</c:forEach>
											</select>
										</div>

										<div class="form-group">
											<label for="">Stock ID</label> <select name="stockId"
												id="input" class="form-control dropdownSelect"
												required="required">
												<c:forEach items="${listStocks}" var="stock">
													<option value="${stock.stockId}"
														<c:if test="${stock.stockId == portfolio.stockId}"> selected="selected" </c:if>>
														${stock.stockName}</option>
												</c:forEach>
											</select>
											<%-- <input type="number"
										class="form-control" name="stockId" value="${portfolio.stockId}"
										id="" placeholder="Demo content"> --%>
										</div>
									</div>

									<div class="col-sm-3">
										<div class="form-group">
											<label for="">Buy price</label> <input type="number"
												step="0.1" class="form-control" name="buyPrice"
												value="${portfolio.buyPrice}" id=""
												placeholder="Demo content">
										</div>

										<div class="form-group">
											<label for="">Sell price</label> <input type="number"
												step="0.1" class="form-control" name="sellPrice"
												value="${portfolio.sellPrice}" id=""
												placeholder="Demo content">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label for="">Quantity</label> <input type="number" step="10"
												class="form-control" name="quantity"
												value="${portfolio.quantity}" id=""
												placeholder="Demo content">
										</div>
										<label for="">Buy date</label>
										<div class='input-group date'>
											<input type='text' id='datetimepicker2' name="buyDate"
												value="${portfolio.buyDate}" class="form-control" /> <span
												class="input-group-addon"> <span
												id="datetimepickericon" class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
									<div class="col-sm-3"></div>
									<div class="col-sm-3">
										<label for="">Sell date</label>
										<div class='input-group date'>
											<input type='text' id='datetimepicker' name="sellDate"
												value="${portfolio.sellDate}" class="form-control" /> <span
												class="input-group-addon"> <span
												id="datetimepickericon" class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
										<br />
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</form>
							<br />
						</div>
					</div>
				</div>
			<div class="row">
				<c:if test="${!empty listPortfolios}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Portfolios</h2>
							<div class="table-responsive">
								<table class="table table-hover table-striped table-bordered"
									id="dataTable">
									<thead>
										<tr>
											<th width="50">Index</th>
											<th width="50">ID</th>
											<th width="150">Balance ID & Owner info</th>
											<th width="50">Stock ID</th>
											<th width="50">Buy price</th>
											<th width="50">Buy value</th>
											<th width="50">Sell price</th>
											<th width="50">Quantity</th>
											<th width="50">Buy date</th>
											<th width="50">Sell date</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listPortfolios}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center; font-weight: bold">${loop.index +1}</td>
											<td>${u.portfolioId}</td>
											<td>${u.balanceId}<c:forEach items="${listBalances}"
													var="balance">
													<c:if test="${balance.balanceId == u.balanceId}">
														<c:forEach items="${listUsers}" var="user">
															<c:if test="${balance.userId == user.userId}">
																<br /> ${user.userFullName} </c:if>
														</c:forEach>
														<br />${balance.balanceName}
	                                           	</c:if>
												</c:forEach>
											</td>
											<td>${u.stockId}<br /> <c:forEach items="${listStocks}"
													var="stock">
													<c:if test="${stock.stockId == u.stockId}"> 
													${stock.stockName} 
												</c:if>
												</c:forEach>
											</td>
											<td class="" style="text-align: right; color: blue"><span
												style="clear: both">${u.buyPrice}</span></td>
											<td class="formatNummber">
												${(u.buyPrice)*(u.quantity)*1000}</td>
											<td class="" style="text-align: right; color: blue"><span
												style="clear: both">${u.sellPrice}</span><br />&nbsp; <fmt:parseNumber
													var="i" type="number"
													value="${(u.sellPrice)*(u.quantity)*1000}" pattern="#,###" />
												<c:out value="${i}" /> đ</td>
											<td class=""
												style="text-align:right; color:green; <c:if test="${ (u.sellPrice*u.quantity - u.buyPrice*u.quantity)<0 && (u.sellPrice != 0)  }">  color: red </c:if>    ">
												<span class="formatQuantity" style="clear: both">${u.quantity}</span>
												<br /> <c:if test="${u.sellPrice != 0}">
													<fmt:parseNumber var="i" type="number"
														value="${(u.sellPrice*u.quantity - u.buyPrice*u.quantity)*1000 }"
														pattern="#,###" />
													<c:out value="${i}" /> đ<br />&nbsp;
												<fmt:parseNumber var="i2" type="number"
														value="${(u.sellPrice*u.quantity - u.buyPrice*u.quantity)/(u.buyPrice*u.quantity)*100 }" />
													<fmt:formatNumber type="number" maxFractionDigits="2"
														value="${i2}" var="i3" />
													<c:out value="${i3}" />%
											</c:if>
											</td>
											<td class="formatTime">${u.buyDate}</td>
											<td class="formatTime">${u.sellDate}</td>
											<td><a
												href="<c:url value='/core/editPortfolio/${u.portfolioId}' />">Edit</a></td>
											<td><a
												href="<c:url value='/core/removePortfolio/${u.portfolioId}' />">Delete</a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</c:if>

		
			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/insanity.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#dataTable').DataTable();
							$(".formatNummber").digits2();
							$(".formatPercent").formatPercent();
							$(".formatTime").formatTime();
							$(".formatQuantity").formatQuantity();

							/* $("a").click(function(){
								$(".formatNummber").digits();
							}); */
							/* $(".formatNummber").breakLine(); */

							var $datetimepicker = $('#datetimepicker');

							var d = new Date();
							var showDate = (("00" + (d.getMonth() + 1))
									.slice(-2)
									+ "/"
									+ ("00" + d.getDate()).slice(-2)
									+ "/"
									+ d.getFullYear()
									+ " "
									+ ("00" + d.getHours()).slice(-2)
									+ ":"
									+ ("00" + d.getMinutes()).slice(-2) + ":" + ("00" + d
									.getSeconds()).slice(-2));

							$('#datetimepicker').val(showDate);

							if ("${portfolio.sellDate}" != null
									&& ("${portfolio.sellDate}").length > 0) {
								$('#datetimepicker').val(
										formatDate("${portfolio.sellDate}"));
							}

						});
	</script>

</body>
</html>
