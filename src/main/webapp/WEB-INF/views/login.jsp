<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!DOCTYPE html> 
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>I N S A N I T Y</title>
	<!-- Meta data -->

	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/images/core/favicon.ico" rel="shortcut icon">
	<style type="text/css"> 
		body{
		background-image: url('${pageContext.request.contextPath}/resources/slide/slideSource/slideImage/b6.jpg') !important;
	} 
</style>
</head>
<body class="homepage">
	<div class="header">
	<div class="container-fluid">
		<div class="col-md-offset-5 col-md-2 col-lg-offset-5 col-lg-2 col-xs-offset-4 col-xs-4">
			<a><img src="${pageContext.request.contextPath}/resources/images/core/hdgLogo.png" class="img-responsive"></a>
		</div>
	</div>
		<!-- <h1><span style="color: #FF0000;">LIBERATION LAB</span></h1> -->
	</div>
	<div class="boxlogin">
		<form id="fm1" action="${pageContext.request.contextPath}/authentication" method="post">

			<div class="boxlogin-in">
				<div class="padding">
					<input id="username" name="username" class="form-control" required="required" placeholder="Username" type="text"/>
				</div>
				
				<div class="padding" style="padding-top: 10px ">
					<input id="password" name="password" class="required form-control"  required="required" placeholder="Password" type="password" value="" size="25" autocomplete="off">
				</div>
				<br/>
				<br/>
				<div class="row" style="text-align: center;">
					<p style="color:red; padding:0px 10px;">
						<c:out value="${sessionScope.loginErrorMessage}"/>
						<c:out value="${sessionScope.loginRequiredMessage}"/>
						
					</p>
					<p style="color:blue; padding:0px 10px;">
						<c:out value="${sessionScope.welcomeMessage}"/>
					</p>
					<% 
					session.removeAttribute("loginErrorMessage"); 
					session.removeAttribute("loginRequiredMessage"); 
					session.removeAttribute("welcomeMessage"); 
					%>
				</div>
				<div class="padding"> 
					<input class="login" name="submit" value="Login" type="submit">
				</div>
				<div class="padding t1">
					<a style="color: #555; font-size: 12px;" href="#"> Forgot password</a> 
					<a> | </a> 
					<a style="font-size: 12px;" href="${pageContext.request.contextPath}/register"> <b>Register</b> </a>
					</div>
				</div>
			</form>
		</div>
		<footer id="footer">
			<div class="row">
				<div class="no-print" style="color: white !important">
					<b>Liberation Lab © 2016</b> | 
					<a  href="http://www.nth7.com/viewArticle/82">Terms and conditions</a> | 
					<a  href="https://fb.com/liberty4692">Contact us</a> 
				</div>
			</div>
		</footer>

	</body>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
	<script type="text/javascript">

	</script>
	</html>
