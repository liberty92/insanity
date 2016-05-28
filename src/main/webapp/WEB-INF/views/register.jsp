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
<title>Đăng ký | Liberty Invest</title>
<!-- Meta data -->

<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/images/core/favicon.ico"
	rel="shortcut icon">
<style type="text/css">
body { 
	background: url('${pageContext.request.contextPath}/resources/images/core/banner7.jpg') no-repeat bottom center fixed; 
}
</style>
</head>
<body class="homepage">
	<div class="container-fluid">
		<div
			class="col-md-offset-5 col-md-2 col-lg-offset-5 col-lg-2 col-xs-offset-4 col-xs-4">
			<a href="${pageContext.request.contextPath}"><img style="max-width: 70%;"
				src="${pageContext.request.contextPath}/resources/images/core/hdgLogo.png"
				class="img-responsive"></a>
		</div>

		<div
			style="background-color: rgba(255, 255, 255, 0.7); border: 1px rgba(0, 0, 0, 0.3) solid; border-radius: 7px; padding-top: 15px;"
			class="col-sm-offset-2 col-sm-8">


			<form class="form-horizontal"  role="form" data-toggle="validator" action="${pageContext.request.contextPath}/registerAuthentication" method="post">
				<legend><span  class="col-sm-offset-2">Đăng ký</span></legend>
				<span  class="col-sm-offset-2" style="color:#a94442;">${sessionScope.registerErrorMessager}</span>
				<% session.removeAttribute("registerErrorMessager"); %>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Tên đăng
						nhập:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="" name="username" data-minlength="6"
							placeholder="Minimum 6 characters, special characters are not accepted" required  pattern="[A-Za-z0-9]*" maxlength="15">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="">Mật khẩu:</label>
					<div class="col-sm-10">
						<input type="password" data-minlength="6" class="form-control"
							id="inputPassword" name="password" placeholder="Required minimum 6 characters"
							required> <span class="help-block" style="margin-bottom: 0px; text-align:left">Tối thiểu 6 ký
							tự</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="">Xác nhận:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control"
							id="inputPasswordConfirm" data-match="#inputPassword"
							name="password3" data-match-error="Hai mật khẩu bạn đã nhập không khớp"
							placeholder="Have to match with the password" required>
						<div class="help-block with-errors"></div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="">Họ và
						tên:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id=""  name="userFullName"
							placeholder="full name" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="">Email:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id=""  name="userEmail"
							placeholder="Have to be a valid email address" required>
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary col-sm-10">Submit</button>
					</div>
				</div>
			</form>





		</div>


	</div>
</body>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
<script type="text/javascript">
	
</script>
</html>
