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
<title>Company manager - BK Securities core engine</title>
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
						style="float: right;">Company manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menu.jsp"%>  
			</div>
			<div class="row">
				<c:if test="${!empty listCompany}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Company</h2>
							<div class="table-responsive">
							<table class="table table-hover table-striped table-bordered">
								<thead>
									<tr>
										<th width="50">Index</th>
										<th width="100">Company ID</th>
										<th width="100">Full name</th>
										<th width="100">Category</th>
										<th width="200">BOD</th>
										<th width="200">Contact</th>
										<th width="200">Info</th>
										<th width="50">State</th>
										<th width="50">Edit</th>
										<th width="50">Delete</th>
									</tr>
								</thead>
								<c:forEach items="${listCompany}" var="u" varStatus="loop">
									<tr>
										<td style="text-align:center">${loop.index +1}</td>
										<td>${u.companyId}</td>
										<td>${u.companyName}</td> 
										<td>
											<c:forEach items="${listCompanyCategory}" var="cc" >
												<c:if test="${cc.companyCategoryId == u.companyCategoryId}">
													${cc.companyCategoryName}
												</c:if>
											</c:forEach>
										</td> 
										<td>${fn:substring(u.companyBOD,0,200).replace("<", "[HTML TAG]")}</td>
										<td>${fn:substring(u.companyContact,0,200).replace("<", "[HTML TAG]")}</td>
										<td>${fn:substring(u.companyInfo,0,200).replace("<", "[HTML TAG]")}</td>
										<td>${u.companyState}</td> 
										<td><a
											href="<c:url value='/core/editCompany/${u.companyId}' />">Edit</a></td>
										<td><a
											href="<c:url value='/core/removeCompany/${u.companyId}' />">Delete</a></td>
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
						<h2>Add company</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addCompany"
								method="POST" role="form">
								<legend>Add new company</legend>

								<div class="form-group">
									<label for="">Company name</label> <input type="hidden"
										class="form-control" name="companyId" value="${company.companyId}"
										id="" placeholder="Demo content"> <input type="text"
										class="form-control" name="companyName" value="${company.companyName}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Category Id</label> 
									
											<c:forEach items="${listCompanyCategory}" var="cc" >
												<c:if test="${cc.companyCategoryId == u.companyCategoryId}">
													${cc.companyCategoryName}
												</c:if>
											</c:forEach>
											
											
										<select name="companyCategoryId" id="input" class="form-control">
											<c:forEach items="${listCompanyCategory}" var="cc" >
												<option value="${cc.companyCategoryId}" 
													<c:if test="${ cc.companyCategoryId == company.companyCategoryId}"> selected="selected" </c:if> ">
													${cc.companyCategoryName}
												</option>
											</c:forEach>
										</select> 

								<div class="form-group">
									<label for="">Board of directors</label> <input type="text"
										class="form-control" name="companyBOD"
										value="${company.companyBOD}" id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Contact</label> <input type="text"
										class="form-control" name="companyContact"
										value="${company.companyContact}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Info</label> <input type="text"
										class="form-control" name="companyInfo" value="${company.companyInfo}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">State</label> <input type="text"
										class="form-control" name="companyState"
										value="${company.companyState}" id=""
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

</body>
</html>
