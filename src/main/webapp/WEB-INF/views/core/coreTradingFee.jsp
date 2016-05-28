<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TradingFee manager - BK Securities core engine</title>
<!-- Meta data -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
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
						style="float: right;">Fees and Interest rates manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listTradingFees}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>Fees and Interest rates setting</h2>
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="100">Index</th>
											<th width="200">ID</th>
											<th width="200">Trading fee name</th>
											<th width="200">From value</th>
											<th width="200">Through value</th>
											<th width="200">Fee value</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listTradingFees}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center">${loop.index +1}</td>
											<td>${u.id}</td>
											<td>${u.name}</td>
											<td class="<c:if test="${u.id > 2}">formatNummber </c:if> " style="text-align: right"><c:if test="${u.id > 2}">${u.fromValue} </c:if></td>
											<td class="<c:if test="${u.id > 2}">formatNummber </c:if> "" style="text-align: right"><c:if test="${u.id > 2}">${u.throughValue} </c:if> </td>
											<td style="text-align: right; color:red">${u.value}%</td>
											<td><a
												href="<c:url value='/core/editTradingFee/${u.id}' />">Edit</a></td>
											<td>
											
											<c:if test="${u.id > 2 }">
											<a
												href="<c:url value='/core/removeTradingFee/${u.id}' />">Delete</a>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</c:if>

				<br />

				<div class="panel panel-default">
					<div class="panel-body">
						<h2>Add trading fee setting</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addTradingFee"
								method="POST" role="form">
								<legend>Add new setting</legend>




								<div class="form-group">
									<label for="">Setting name</label> <input type="hidden"
										class="form-control" name="id" value="${tradingFee.id}" id=""
										placeholder="Demo content"> <input type="text"
										class="form-control" name="name" value="${tradingFee.name}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">From value</label> <input type="number"
										step="10e6" class="form-control" name="fromValue"
										value="${tradingFee.fromValue}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Through value</label> <input type="number"
										step="10e6" class="form-control" name="throughValue"
										value="${tradingFee.throughValue}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Fee value</label> <input type="number"
										step="0.01" class="form-control" name="value"
										value="${tradingFee.value}" id="" placeholder="Demo content">
								</div>


								<br />

								<button type="submit" class="btn btn-primary">Submit</button>
							</form>

							<br />

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
	
	$.fn.digits2 = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			if(a <= 10e90){
				$(this).text(accounting.formatMoney(a));
			}
			else{
				$(this).text("Infinity");
			}
				
		})
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
	
		$(document).ready(function() {
			$(".formatNummber").digits2();
		});
	</script>
</body>
</html>
