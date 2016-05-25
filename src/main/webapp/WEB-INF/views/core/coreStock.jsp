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
<title>Stock manager - BK Securities core engine</title>
<!-- Meta data -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminstyle.css">
<link
	href="${pageContext.request.contextPath}/resources/css/select2.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>

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
th {
	text-align: center;
}

td {
	text-align: right;
}
</style>
</head>
<body>

	<div class="container-fluid" style="width: 95%">
		<div class="row">
			<div class="row">
				<h1>
					<span style="color: #FF0000;">LIBERATION core engine</span> <span
						style="float: right;">Stock manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listStock}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Stock</h2>
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="30">Index</th>
											<th width="50">ID</th>
											<th width="50">Name</th>
											<th width="100">Ex</th>
											<%-- <th width="100">Company</th> --%>
											<th width="50">Quan</th>
											<th width="50">Cap</th>
											<th width="50">PE</th>
											<th width="50">PP</th>
											<th width="50">EPS</th>
											<th width="50">ROE</th>
											<th width="50">ROA</th>
											<th width="50">Beta</th>
											<th width="50">Margin</th>
											<th width="50">Price</th>
											<th width="50">State</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listStock}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center">${loop.index +1}</td>
											<td>${u.stockId}</td>
											<td style="color: blue;text-align:center">${u.stockName}</td>
											<td>${u.stockExchangeId}</td>
									<%-- 		<td>
											${u.companyId} <br/>
												<c:forEach items="${listCompany}" var="company">
													<c:if test="${u.companyId == company.companyId}"> ${company.companyName} </c:if>
												</c:forEach>
											</td> --%>
											
											
											
											<td>${u.stockQuantity}<span
												style="float: right; color: red">M</span></td>
											<td>${u.stockCapitalization}<span
												style="float: right; color: red">B</span></td>
											<td>${u.stockPE}</td>
											<td>${u.stockPP}</td>
											<td>${u.stockEPS}</td>
											<td>${u.stockROE}</td>
											<td>${u.stockROA}</td>
											<td>${u.stockBeta}</td>
											<td>${u.stockMarginRate}</td>
											<td style="color: blue">${u.stockPrice}</td>
											<td>${u.stockState}</td>
											<td><a
												href="<c:url value='/core/editStock/${u.stockId}' />">Edit</a></td>
											<td><a
												href="<c:url value='/core/removeStock/${u.stockId}' />">Delete</a></td>
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
						<h2>Add stock</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addStock"
								method="POST" role="form">
								<legend>Add new stock</legend>

								<div class="form-group">
									<label for="">Stock name</label> <input type="hidden"
										class="form-control" name="stockId" value="${stock.stockId}"
										id="" placeholder="Demo content"> <input type="text"
										class="form-control" name="stockName"
										value="${stock.stockName}" id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Stock exchange Id</label> <select
										name="stockExchangeId" id="input" class="form-control"
										required="required">
										<option value="HSX"
											<c:if test="${stock.stockExchangeId == HSX}"> selected="selected" </c:if>>
											HSX</option>
										<option value="HNX"
											<c:if test="${stock.stockExchangeId == HNX}"> selected="selected" </c:if>>
											HNX</option>
									</select>
								</div>

								<div class="form-group">
									<label for="">Company id</label> 
									<%-- <input type="number"
										step="any" class="form-control" name="companyId"
										value="${stock.companyId}" id="" placeholder="Demo content"> --%>
										
										
										<select class="form-control dropdownSelect" name="companyId" required>
											<c:forEach items="${listCompany}" var="company">
												<option value="${company.companyId}" <c:if test="${stock.companyId == company.companyId}"> selected="selected" </c:if> >
													${company.companyId} - ${company.companyName}
												</option>
											</c:forEach>
										</select>
										
								</div>

								<div class="form-group">
									<label for="">Quantity</label><span
										style="float: right; color: red">Unit: Million</span> <input
										type="number" step="any" class="form-control"
										name="stockQuantity" value="${stock.stockQuantity}" id=""
										placeholder="Unit: Million">
								</div>

								<div class="form-group">
									<label for="">Capitalization</label><span
										style="float: right; color: red">Unit: Billion</span> <input
										type="number" step="any" class="form-control"
										name="stockCapitalization"
										value="${stock.stockCapitalization}" id=""
										placeholder="Unit: Billion">
								</div>

								<div class="form-group">
									<label for="">PE</label> <input type="number" step="any"
										class="form-control" name="stockPE" value="${stock.stockPE}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">PP</label> <input type="number" step="any"
										class="form-control" name="stockPP" value="${stock.stockPP}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">EPS</label> <input type="number" step="any"
										class="form-control" name="stockEPS" value="${stock.stockEPS}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">ROE</label> <input type="number" step="any"
										class="form-control" name="stockROE" value="${stock.stockROE}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">ROA</label> <input type="number" step="any"
										class="form-control" name="stockROA" value="${stock.stockROA}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Beta</label> <input type="number" step="any"
										class="form-control" name="stockBeta"
										value="${stock.stockBeta}" id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Margin rate</label> <input type="number"
										step="any" class="form-control" name="stockMarginRate"
										value="${stock.stockMarginRate}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Stock price</label> <input type="number"
										step="100" class="form-control" name="stockPrice"
										value="${stock.stockPrice}" id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">State</label> <input type="number" step="any"
										class="form-control" name="stockState"
										value="${stock.stockState}" id="" placeholder="Demo content">
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
		$(document).ready(function() {
			$('#dataTable').DataTable();
			$(".dropdownSelect").select2();
		});
	</script>

</body>
</html>
