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
						style="float: right;">User manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menu.jsp"%>  
			</div>
			<div class="row">
				<c:if test="${!empty listUsers}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Users</h2>
							<div class="table-responsive">
							<table class="table table-hover table-striped table-bordered">
								<thead>
									<tr>
										<th width="100">User ID</th>
										<th width="100">Username</th>
										<th width="80">Password</th>
										<th>User full name</th>
										<th width="80">User role</th>
										<th width="100">User profile picture</th>
										<th width="50">User age</th>
										<th width="100">User email</th>
										<th width="100">User phone number</th>
										<th width="100">User address</th>
										<th width="50">Edit</th>
										<th width="50">Delete</th>
									</tr>
								</thead>
								<c:forEach items="${listUsers}" var="u">
									<tr>
										<td>${u.userId}</td>
										<td>${u.username}</td>
										<!-- SENSITIVE DATA -->
										<!-- <td>${u.password}</td> -->
										<td>**********</td>
										<td>${u.userFullName}</td>
										<td>
											<c:forEach items="${listUserRoles}" var="ur">
												<c:if test="${ur.userId == u.userId}">
													${ur.userRole}
                                            	</c:if> 
											</c:forEach>
										</td>
										<td style="padding:0px">
											<c:if test="${!empty u.userProfilePicture}">
                                            	<img style="max-height:60px; max-width:100px; margin:auto; padding:1px; width:100%" src="${u.userProfilePicture}" />
                                            </c:if> 
										</td>
										<td>${u.userAge}</td>
										<td>${u.userEmail}</td>
										<td>${u.userPhoneNumber}</td>
										<td>${u.userAddress}</td>
										<td><a
											href="<c:url value='/core/editUser/${u.userId}' />">Edit</a></td>
										<td><a
											href="<c:url value='/core/removeUser/${u.userId}' />">Delete</a></td>
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
								<legend>Add new user</legend>

								<div class="form-group">
									<label for="">Username</label> <input type="hidden"
										class="form-control" name="userId" value="${user.userId}"
										id="" placeholder="Demo content"> <input type="text"
										class="form-control" name="username" value="${user.username}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Password</label> <input type="text"
										class="form-control" name="password" value="${user.password}"
										id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Full name</label> <input type="text"
										class="form-control" name="userFullName"
										value="${user.userFullName}" id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Profile picture</label> <input type="text"
										class="form-control" name="userProfilePicture"
										value="${user.userProfilePicture}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
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
