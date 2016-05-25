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
	<title>Liberty Invest</title>
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

		 

			 	<br/>
					<div id="menuList" class="row" style="color: white"> 
						<div class="col-lg-offset-1 col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/user">
								<i class="fa fa-users fa-3x" style="color:white"></i><div>User</div>
							</a>
						</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/userRole">
								<i class="fa fa-braille fa-3x" style="color:white"></i><div>User role</div> 
							</a>
						</div>
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/balance">
								<i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Balance</div> 
							</a>
						</div>
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/portfolio">
								<i class="fa fa-list-alt  fa-3x" style="color:white"></i><div>Portfolio</div> 
							</a>
						</div>
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/company">
								<i class="fa fa-building fa-3x" style="color:white"></i><div>Company</div> 
							</a>
						</div>
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/companyCategory">
								<i class="fa fa-cubes fa-3x" style="color:white"></i><div>Company Category</div> 
							</a>
						</div>
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/stock">
								<i class="fa fa-first-order fa-3x" style="color:white"></i><div>Stock</div>
							</a>
						</div> 
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/priceBoard">
								<i class="fa fa-bank fa-3x" style="color:white"></i><div>Price board</div> 
							</a>
						</div>
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/orders">
								<i class="fa fa-gitlab fa-3x" style="color:white"></i><div>Order</div> 
							</a>
						</div>
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4">
							<a target="_blank" href="${pageContext.request.contextPath}/core/article">
								<i class="fa fa-list fa-3x" style="color:white"></i><div>Articles</div>
							</a>
						</div> 
						
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"></div>
					</div>
					
					
					<!--
					<br/>
					<div class="row" style="color: white">
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"></div>
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"></div>
					</div>
					<br/>
					<div class="row" style="color: white">
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"></div>
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"><i class="fa fa-credit-card fa-3x" style="color:white"></i><div>Tạo công ty</div> 
						<div class="col-lg-1 col-md-2 col-sm-3 col-xs-4"></div>
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
			$("#menuList").hide();
			$(".insanity").click(function(){
			    $("#menuList").toggle();
			});
			var glow = $('.insanity');
			setInterval(function() {
				glow.hasClass('glow') ? glow.removeClass('glow') : glow
				.addClass('glow');
			}, 4000);
		});
	</script>
