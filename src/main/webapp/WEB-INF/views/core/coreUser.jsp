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
<title>User manager - BK Securities core engine</title>
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
						style="float: right;">User manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listUsers}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Users</h2>
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="10">User ID</th>
											<th width="10">Username</th>
											<!-- <th width="80">Password</th> -->
											<th width="100">User full name</th>
											<th width="80">User role</th>
											<th width="100">Profile picture</th>
											<th width="10">User age</th>
											<th width="10">User email</th>
											<th width="10">Phone number</th>
											<th width="10">User address</th>
											<th width="10">Edit</th>
											<th width="10">Del</th>
										</tr>
									</thead>
									<c:forEach items="${listUsers}" var="u">
										<tr>
											<td>${u.userId}</td>
											<td>${u.username}</td>
											<!-- SENSITIVE DATA -->
											<!-- <td>${u.password}</td> -->
											<!-- <td>**********</td> -->
											<td>${u.userFullName}</td>
											<td><c:forEach items="${listUserRoles}" var="ur">
													<c:if test="${ur.userId == u.userId}">
														<c:if  test="${ ur.userRole.length() == 8}"><span style='color:blue' > ${ur.userRole}</span></c:if>
														<c:if  test="${ ur.userRole.length() == 12}"><span style='color:green' > ${ur.userRole}</span></c:if>
														<c:if  test="${ ur.userRole.length() == 14}"><span style='color:red' > ${ur.userRole}</span></c:if>
														
													
                                            	</c:if>
												</c:forEach></td>
											<td style="padding: 0px"><c:if
													test="${!empty u.userProfilePicture}">
													<img
														style="max-height: 60px; max-width: 100px; margin: auto; padding: 1px; width: 100%"
														src="${u.userProfilePicture}" />
												</c:if></td>
											<td>${u.userAge}</td>
											<td>${u.userEmail}</td>
											<td>${u.userPhoneNumber}</td>
											<td>${u.userAddress}</td>
											<td><a
												href="<c:url value='/core/editUser/${u.userId}' />"><i class="fa fa-pencil-square-o  "></i></a></td>
											<td><a
												href="<c:url value='/core/removeUser/${u.userId}' />"><i style="color:red" class="fa fa-trash  "></i></a></td>
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
						<h2>Add user</h2>
						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addUser"
								method="POST" role="form">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="">Username</label> <input type="hidden"
												class="form-control" name="userId" value="${user.userId}"
												id="" placeholder="Demo content"> <input type="text"
												class="form-control" name="username"
												value="${user.username}" id="" placeholder="Demo content">
										</div>
										<div class="form-group">
											<label for="">Password</label> <input type="text"
												class="form-control" name="password"
												value="${user.password}" id="" placeholder="Demo content">
										</div>
										<div class="form-group">
											<label for="">Full name</label> <input type="text"
												class="form-control" name="userFullName"
												value="${user.userFullName}" id=""
												placeholder="Demo content">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="form-group">
												<label for="">Profile picture</label> <input type="text"
													class="form-control" name="userProfilePicture"
													value="${user.userProfilePicture}" id="imgProfileSrc"
													placeholder="Demo content">
											</div>
											<label for="">Age</label> <input type="text"
												class="form-control" name="userAge" value="${user.userAge}"
												id="" placeholder="Demo content">
										</div>
										<div class="form-group">
											<label for="">Phone number</label> <input type="text"
												class="form-control" name="userPhoneNumber"
												value="${user.userPhoneNumber}" id=""
												placeholder="Demo content">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="">Email</label> <input type="text"
												class="form-control" name="userEmail"
												value="${user.userEmail}" id="" placeholder="Demo content">
										</div>
										<div class="form-group">
											<label for="">Address</label> <input type="text"
												class="form-control" name="userAddress"
												value="${user.userAddress}" id="" placeholder="Demo content">
										</div>
										<br />
										<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
					<div class="col-xs-4 row">
						<img src="" id="imgProfile" class="img-responsive" />
					</div>
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
		$("#imgProfileSrc").keyup(function() {
			var imgSrc = $(this).val(); 
			$('#imgProfile').attr("src",imgSrc);
		});
	} );
</script>
</body>
</html>
