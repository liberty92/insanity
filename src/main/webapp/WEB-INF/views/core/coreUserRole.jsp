<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UserRole manager - BK Securities core engine</title>
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
						style="float: right;">User role manager</span>
				</h1>
			</div>
			
			<div class="row">
				<%@ include file="../template/frontend/menu/menu.jsp"%>  
			</div>

			<div class="row">
				<c:if test="${!empty listUserRoles}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List user role</h2>
							<div class="table-responsive">
							<table class="table table-hover table-striped table-bordered">
								<thead>
									<tr>
										<th width="200">User role ID</th>
										<th width="200">User Id</th>
										<th>User role</th>
										<th width="100">Edit</th>
										<th width="100">Delete</th>
									</tr>
								</thead>
								<c:forEach items="${listUserRoles}" var="u">
									<tr>
										<td>${u.userRoleId}</td>
										<td>${u.userId}</td>
										<td>${u.userRole}</td>
										<td><a
											href="<c:url value='/core/editUserRole/${u.userRoleId}' />">Edit</a></td>
										<td><a
											href="<c:url value='/core/removeUserRole/${u.userRoleId}' />">Delete</a></td>
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
						<h2>Add user role</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addUserRole"
								method="POST" role="form">
								<legend>Add new user role</legend>

								<div class="form-group">
									<label for="">User Id</label> <input type="hidden"
										class="form-control" name="userRoleId"
										value="${userRole.userRoleId}" id=""
										placeholder="Demo content"> <input type="text"
										class="form-control" name="userId" value="${userRole.userId}"
										id="" placeholder="Demo content">
									<%--
								<select name="" id="input" class="form-control"
									required="required">
									<c:if test="${!empty listUserRoles}">
										<c:forEach items="${listUserRoles}" var="u">
											<option class="id" value="${u.userId}">${u.userId}</option>
										</c:forEach>
									</c:if>
								</select>
								--%>

								</div>

								<div class="form-group">
									<label for="">Role</label>
									<%-- 
							<select name="" id="input"
								class="form-control" required="required">
								<option value="CUSTOMER">CUSTOMER</option>
								<option value="NEWS_MANAGER">NEWS_MANAGER</option>
								<option value="SYSTEM_MANAGER">SYSTEM_MANAGER</option>
							</select>
							--%>

									<input type="text" class="form-control" name="userRole"
										value="${userRole.userRole}" id="" placeholder="Demo content">
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
 
	<script src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>

	<script type="text/javascript">
		function checkDuplicateOption() {
			var listId = [];
			$("option.id").each(function() {
				if (listId.indexOf($(this).val()) < 0) {
					listId.push($(this).val());
				} else {
					$(this).remove();
					console.log("Duplicate : " + $(this).val());
				}
				// Add $(this).val() to your list
			});
		}

		$(document).ready(function() {

		});
	</script>
</body>
</html>
