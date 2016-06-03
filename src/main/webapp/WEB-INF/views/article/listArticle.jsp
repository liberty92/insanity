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
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<style>
ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
}

ul.pagination li {display: inline;}

ul.pagination li a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
}

ul.pagination li a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}

ul.pagination li a:hover:not(.active) {background-color: #ddd;}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="../template/frontend/header.jsp"></jsp:include>
			<!-- ====================== BODY STARTS =================================== -->
			<%@ include file="../template/frontend/menu/menu.jsp"%>
			<!--2. Main body-->

			<div class="row " style="margin: 0px 10px">
				<div class="col-md-9 listArticle" style="position: relative;">
					<h2 id="articleTypeHeader"> ${articleTypeHeader}</h2>
					<ul class="listArticleItems" >
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
										</a> 
										<br/>
										<span style="color: grey" class="formatTime">${a.articlePublicationTime}</span>
										<p style="text-align: justify; color: white">
											${a.articleSummary}</p>
									</div>
								</div>
								<!-- <br /> -->
							</c:forEach>
							
						</c:if>
					</ul>
					
					<div style=" position:absolute; bottom: 5px; right:10px">
						<ul class="pagination" >
						  <li><a id="prev">Trang trước</a></li>
						  <li><a id="pageIndex">0</a></li>
						  <li><a id="next">Trang sau</a></li>
						</ul>
					</div>
					
					
					
					
				</div>
				<div class="col-md-3 sideBarWrapper0" style="padding-right: 0px; ">
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
		<%@ include file="../template/frontend/footer.jsp"%>
	</div>
	</div>
</body>
</html>

<script src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/insanity.js"></script>
<script type="text/javascript">
	var articleQuantity =0;
	var articleIndexNow =0;
	var totalPage = 1;
	var currentPage=1;
	
	$("#next").click(function(){
		if(currentPage < totalPage){
			$(".Article-item").slice(articleIndexNow -5,articleIndexNow).hide();
			$(".Article-item").slice(articleIndexNow,articleIndexNow +5).show();
			articleIndexNow = articleIndexNow+5;
			currentPage ++;
			$("#pageIndex").text(currentPage+"/"+totalPage);
		}
	});
	
	$("#prev").click(function(){
		if(currentPage > 1){
			$(".Article-item").slice(articleIndexNow-5,articleIndexNow).show();
			$(".Article-item").slice(articleIndexNow,articleIndexNow+5).hide();
			articleIndexNow = articleIndexNow -5;
			currentPage --;
			$("#pageIndex").text(currentPage+"/"+totalPage);
		}
	});
	
	$.fn.formatTimePublicationTime = function () {
		return this.each(function() {
			var a = ($(this).text());
			$(this).text("Đăng ngày "+a.substring(10, 19) + " "+ a.substring(8, 10) + "/"+a.substring(5, 7)+"/"+a.substring(0, 4) );
		})
	};

	$(document).ready(function(){ 
		$(".formatTime").formatTimePublicationTime();
		$("#articleTypeHeader").articleTypeHeader();
		$(".Article-item").hide();
		$(".Article-item").slice(0,5).show();
		articleQuantity = $(".Article-item").size();
		articleIndexNow = 5;
		currentPage=1;
		totalPage = Math.ceil(articleQuantity/5);
		$("#pageIndex").text(currentPage+"/"+totalPage); 
		});
</script>
