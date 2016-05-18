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
<title>CompanyCategory manager - BK Securities core engine</title>
<!-- Meta data -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/images/core/favicon.ico" rel="shortcut icon">
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

	<div class="container-fluid" style="width:95%" >
		<div class="row">
			<div class="row">
				<h1>
					<span style="color: #FF0000;">LIBERATION core engine</span> <span
						style="float: right;">CompanyCategory manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menu.jsp"%>  
			</div>
			<div class="row">
				<c:if test="${!empty listCompanyCategory}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List CompanyCategory</h2>
							<div class="table-responsive">
							<table class="table table-hover table-striped table-bordered">
								<thead>
									<tr>
										<th width="100">Index</th>
										<th width="200">Company category ID</th>
										<th width="200">Company category name</th>
										<th>Company category info</th>
										<th width="50">Edit</th>
										<th width="50">Delete</th>
									</tr>
								</thead>
								<c:forEach items="${listCompanyCategory}" var="u" varStatus="loop">
									<tr>
										<td style="text-align:center">${loop.index}</td>
										<td>${u.companyCategoryId}</td>
										<td>${u.companyCategoryName}</td> 
										<td>${fn:substring(u.companyCategoryInfo,0,200).replace("<", "[HTML TAG]")}</td>
										<td><a
											href="<c:url value='/core/editCompanyCategory/${u.companyCategoryId}' />">Edit</a></td>
										<td><a
											href="<c:url value='/core/removeCompanyCategory/${u.companyCategoryId}' />">Delete</a></td>
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
						<h2>Add company category</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addCompanyCategory"
								method="POST" role="form">
								<legend>Add new company category</legend>


								<div class="form-group">
									<label for="">Category ID</label> <input type="text"
										class="form-control" name="companyCategoryId" value="${companyCategory.companyCategoryId}"
										id="" placeholder="Demo content">
								</div> 

								<div class="form-group">
									<label for="">Info</label> <input type="text"
										class="form-control" name="companyCategoryName" value="${companyCategory.companyCategoryName}"
										id="" placeholder="Demo content">
								</div> 

								<div class="form-group">
									<label for="">Info</label> <input type="text"
										class="form-control" name="companyCategoryInfo" value="${companyCategory.companyCategoryInfo}"
										id="" placeholder="Demo content">
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

</body>
</html>
