<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>403 Error - Access denied</title>
<!-- Meta data -->


	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/images/core/favicon.ico" rel="shortcut icon">
<style type="text/css">
.insanity, .noti{
	position: absolute;
	top: 82%;
	width: 98%;
	text-align: center;
	font-family: Arial;
	font-size: 1em;
	color: rgba(255, 255, 255, 0.8);
	text-shadow: 0px 0px 4px white;
	letter-spacing: 8px;
	-webkit-transition: text-shadow 2s linear;
	-moz-transition: text-shadow 2s linear;
	-ms-transition: text-shadow 2s linear;
	-o-transition: text-shadow 2s linear;
	transition: text-shadow 2s linear;
}
.insanity{
	top: 70%;
	font-size: 3em;
	letter-spacing: 1em;
}
.glow {
	text-shadow: 0px 0px 12px white;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="modal fade" id="loginModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">
							<i class="fa fa-flag" aria-hidden="true"></i> Welcome to
							Liberation Lab<c:if test="${!empty sessionScope.userFullName}">, ${sessionScope.userFullName}</c:if>.
							Please re login.
						</h4>
					</div>
					<div class="modal-body">

						<form role="form" id="loginForm" 
							action="${pageContext.request.contextPath}/authentication" method="POST">
							
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span> Username</label> <input
									type="text" class="form-control" name="username" id="usrname"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="psw"><span class="glyphicon glyphicon-lock"></span>
									Password</label> <input type="password" class="form-control"
									name="password" id="psw" placeholder="Enter password">
							</div>
							<!-- <div class="checkbox">
								<label><input type="checkbox" value="" checked>Remember me</label>
							</div> -->
							 
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" form="loginForm" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</div>
				</div>
			</div>
		</div>


	</div>
	<div id="insanity" class="insanity area">INSANITY</div>
	<div class="noti">403 ERROR - YOU DON'T HAVE PERMISSION TO ACCESS THIS PAGE</div>
	</div>
	<div style="position: fixed; z-index: -99; width: 100%; height: 100%">
		<iframe frameborder="0" height="100%" width="100%"
			src="https://youtube.com/embed/KT_C_X3oEX0?start=4&autoplay=1&controls=0&showinfo=0 autohide=1">
		</iframe>
	</div>

	<div id="backgroundDiv"
		style="position: fixed; z-index: -98; width: 100%; height: 100%; background: rgba(0, 0, 0, 0);">
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#insanity").click(function() {
						$("#loginModal").modal();
					});
					$("#backgroundDiv").dblclick(function() {
						$("#loginModal").modal();
					});

					var glow = $('.insanity');
					setInterval(function() {
						glow.hasClass('glow') ? glow.removeClass('glow') : glow
								.addClass('glow');
					}, 2000);
				});
	</script>
</body>
</html>
