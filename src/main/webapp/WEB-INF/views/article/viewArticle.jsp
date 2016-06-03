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
<title>${article.articleTitle} | Liberty Invest</title>
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
				<div class="col-md-9 listArticle" style="padding-left: 10px; padding-right: 10px;  ">
					<h2 id="articleTypeHeader">${articleTypeHeader}</h2>
			
			
								
							<h3 style="font-size:20px; font-weight:normal; color:#00aeef ;padding-top: 0; margin-top: 0px; text-transform: uppercase;">
							${article.articleTitle}
							</h3>

							<h4 style="">
                            ${article.articleSummary}                       
                            </h4>
							<div>
                            <div  style="color:white; text-align: justify;">
                            
                            ${article.articleContent}  
                            </div>
                            	
                            <br/> 
                            <p style="color:#00aeef" class="formatTime">${article.articlePublicationTime}</p>	
                            </div>

 
				</div>

				<div class="col-md-3" style="padding-right:0px">
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

<script src="${pageContext.request.contextPath}/resources/js/insanity.js"></script>

<script type="text/javascript"> 
$.fn.formatTimePublicationTime = function () {
	return this.each(function() {
		var a = ($(this).text());
		$(this).text("Đăng ngày "+a.substring(10, 19) + " "+ a.substring(8, 10) + "/"+a.substring(5, 7)+"/"+a.substring(0, 4) );
	})
};


$(document).ready(function(){ 
		$("#articleTypeHeader").articleTypeHeader();
		$(".formatTime").formatTimePublicationTime();
	});
</script>
