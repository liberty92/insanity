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
<!-- CSS starts -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/core/favicon.ico">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
<!-- Theme setting starts -->
<c:if test="${empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style2.css">
</c:if>
<c:if test="${!empty sessionScope.theme}">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/${sessionScope.theme}">
</c:if>
<!-- Theme setting ends-->
<!-- CSS ends -->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="template/frontend/header.jsp"></jsp:include>
			<!-- ====================== BODY STARTS =================================== -->
			<%@ include file="template/frontend/menu/menu.jsp"%>
			<!--2. Main body-->
			<div class="row" style="margin: 0px">
				<object style="overflow: hidden; display: block;" width="100%"
					height="491px"
					data="${pageContext.request.contextPath}/resources/slide/slide.htm"></object>
				<!-- 
			<div class="listArticle" style="margin:0px 10px; padding:10px 0px; min-height:830px;"> -->
				<div class="col-md-9" style="padding-left: 10px; padding-right: 0px">
					<%@ include file="template/frontend/homepage-tabs.jsp"%>
					<div class="col-xs-12">
						<div class="row insanityHome">
							<div class="title" style="margin-top: 100px">
								<div class="insanity">Insanity</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="Side-bar">
						<%@ include file="template/frontend/rightside.jsp"%>
					</div>
				</div>
			</div>
		</div>
		<!-- ====================== BODY ENDS =================================== -->
		<!--3. Footer include-->
	</div>
	<div class="col-xs-12" style="margin-top: 10px">
		<%@ include file="template/frontend/footer.jsp"%>
	</div>
	</div>
</body>
</html>
<!-- JS starts-->
<script src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- JS ends-->
<script type="text/javascript">
	$(document).ready(function() {
		insanity();
	});
</script>
