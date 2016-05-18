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
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->



<c:if test="${empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
</c:if>
<c:if test="${!empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/${sessionScope.theme}">
</c:if>
	
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/core/favicon.ico">
<!-- JS -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bk.js"></script>
<!-- 
LOCAL -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="../template/frontend/header.jsp"></jsp:include>
			<!-- ====================== BODY STARTS =================================== -->
			<%@ include file="../template/frontend/menu/menu.jsp"%>
			<!--2. Main body-->

			<div class="row " style="margin: 0px 10px">
				<div class="col-md-9 listArticle"
					style="padding-left: 10px; padding-right: 10px;">
					<h2
						style="border-bottom: 1px solid grey; font-size: 20px; font-weight: normal; color: #00aeef; padding-top: 0; margin-top: 0px; text-transform: uppercase;">
						${listArticles[0].articleTypeId}</h2>


					<ul class="Post-list Justify-list"
						style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px">
						<c:if test="${!empty listArticles}">
							<c:forEach items="${listArticles}" var="a" varStatus="loop">
								<div class="Article-item clearfix">
									<a
										href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
										method="get" class="Thumb nailthumb-container"
										style="overflow: hidden; padding: 0px; width: 180px; height: 130px;">
										<img class="Thumb2" src="${a.articleImage}"
										style="width: 100%; height: 100%;">
									</a>
									<div class="articleInfo">
										<a
											href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
											method="get"><span
											style="color: #00AEEF; font-size: 16px; font-weight: bold">${a.articleTitle}</span>
										</a> <br /> <span style="color: grey">Đăng ngày: </span> <span
											style="color: grey">${a.articlePublicationTime}</span>
										<p style="text-align: justify; color: white">
											${a.articleSummary}</p>
									</div>
								</div>
								<br />
							</c:forEach>
						</c:if>
					</ul>



					<%-- 

					<img
						src="${pageContext.request.contextPath}/resources/images/core/head.png"
						class="img-responsive" style="min-height: 100px" alt="Image"> --%>
				</div>

				<div class="col-md-3" style="padding-right: 0px">
					<div class="col-xs-12 sideBarWrapper">
						<div class="Side-bar">
							<%@ include file="../template/frontend/rightside.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ====================== BODY ENDS =================================== -->
		<!--3. Footer include-->
	</div>
	<div class="col-xs-12" style="margin-top: 10px">
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
