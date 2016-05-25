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
<title>TransactionUpdater manager - BK Securities core engine</title>
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
						style="float: right;">Transaction updater manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listTransactionUpdaters}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List TransactionUpdater</h2>
							<div class="table-responsive">
								<table id="dataTable" class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="100">Index</th>
											<th width="200">ID</th>
											<th>Time</th>
											<th width="200">State</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listTransactionUpdaters}" var="u"
										varStatus="loop">
										<tr>
											<td style="text-align: center">${loop.index +1}</td>
											<td>${u.id}</td>
											<td>${u.time}</td>
											<td>${u.state}</td>
											<td><a
												href="<c:url value='/core/editTransactionUpdater/${u.id}' />">Edit</a></td>
											<td><a
												href="<c:url value='/core/removeTransactionUpdater/${u.id}' />">Delete</a></td>
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
						<h2>Add Transaction updater</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addTransactionUpdater"
								method="POST" role="form">
								<legend>Add new company category</legend>




								<div class="form-group">
									<label for="">State</label> <input type="hidden"
										class="form-control" name="id"
										value="${transactionUpdater.id}" id=""
										placeholder="Demo content"> 
										<input type="number"
										class="form-control" name="state"
										value="${transactionUpdater.state}" id=""
										placeholder="Demo content">
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
		});
	</script>
</body>
</html>
