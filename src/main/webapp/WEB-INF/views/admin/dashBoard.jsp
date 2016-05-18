<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>I N S A N I T Y | Admin</title>
	<!-- Meta data -->

	<!-- CDN -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminstyle.css">
	<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/core/favicon.ico">
	<!-- JS -->
	<script
	src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bk.js"></script>

<%-- 
LOCAL
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
--%>
</head>
<body>
	<div class="container-fluid 111">
		<div class="row">
			<jsp:include page="../template/backend/header.jsp"></jsp:include>
			<!-- ====================== BODY STARTS =================================== -->
			<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			<!--2. Main body-->

			<div class="col-xs-12">

				<div class="pageBody">

					<div class="title">

						<div class="insanity">Insanity</div>
					</div>

		 

					
				<!-- 	<br/>
					<div class="row" style="color: white">
						<div class="col-sm-1"></div>
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"></div>
					</div>
					<br/>
					<div class="row" style="color: white">
						<div class="col-sm-1"></div>
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"></div>
					</div>
					<br/>
					<div class="row" style="color: white">
						<div class="col-sm-1"></div>
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"><i class="fa fa-credit-card fa-4x" style="color:white"></i>Tạo công ty</div> 
						<div class="col-sm-1"></div>
					</div>
		 
 -->


				</div>


			</div>

			<!-- ====================== BODY ENDS =================================== -->
			<!--3. Footer include-->
		</div>
		<div class="row">
			<%@ include file="../template/backend/footer.jsp"%>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(
		function() {
			var glow = $('.insanity');
			setInterval(function() {
				glow.hasClass('glow') ? glow.removeClass('glow') : glow
				.addClass('glow');
			}, 4000);
		});
	</script>
