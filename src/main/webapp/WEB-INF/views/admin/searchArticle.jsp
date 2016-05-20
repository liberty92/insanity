<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>


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
<style>
label, .dataTables_info{
	color:white;
}
</style>
</head>
<body>
	<div class="container-fluid 111">
		<div class="row">
			<jsp:include page="../template/backend/header.jsp"></jsp:include>
			<!-- ====================== BODY STARTS =================================== -->
			<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			<!--2. Main body-->

			<div class="col-xs-12">

				<div class="listArticle" style="margin-bottom:10px">

					<div class="title">

						<span style="color: #00aeef; font-size: 2em; margin-left: 10px">
						Có ${fn:length(listArticles)} kết quả tìm kiếm cho từ khóa: ${keyword}
						</span>
						
					</div>


					<div class="table-responsive" style="margin: 0px 10px">
						<table id="dataTable"
							class="table table-responsive table-hover table-striped table-bordered">
							<thead>
								<tr>
									<th width="50">Index</th>
									<th width="100">Type</th>
									<th width="120">Title</th>
									<th width="100">Article Image</th>
									<th width="100">Creator ID</th>
									<th width="100">Publication Time</th>
									<th width="50">Edit</th>
									<th width="50">Delete</th>
								</tr>
							</thead>
							<c:if test="${!empty listArticles}">
								<c:forEach items="${listArticles}" var="a" varStatus="loop">
									<tr>
										<td>${loop.index +1}</td>
										<td>${a.articleTypeId}</td>
										<td>${a.articleTitle}</td>
										<td style="padding: 0px; margin: auto"><c:if
												test="${!empty a.articleImage}">
												<img
													style="max-height: 60px; max-width: 100px; margin: auto; padding: 1px; width: 100%"
													src="${a.articleImage}" />
											</c:if></td>
										<td>${a.articleCreatorId}</td>
										<td>${a.articlePublicationTime}</td>
										<td><a
											href="<c:url value='/admin/editArticle/${a.articleId}' />"><i
												style="color: #333" class="fa fa-pencil-square-o fa-2x"></i></a></td>
										<td><a
											href="<c:url value='/admin/removeArticle/${a.articleId}' />"><i
												style="color: red" class="fa fa-times fa-2x"></i></a></td>
									</tr>
								</c:forEach>
							</c:if>
						</table>

						<div class="col-xs-12" style="padding:0px;">
							<button type="button" class="btn btn-primary btn-lg" style="float: left;" 
								onclick="location.href ='${pageContext.request.contextPath}/admin/addArticleForm';">
								<i style="color:white" class="fa fa-plus-square" >
								</i> Add article</button>
								
								
								<span style="float: right; font-weight:bold; color:white">Total:
									<span style="font-weight:bold; color:#00aeef ">${fn:length(listArticles)} articles</span>
								 </span>
						</div>
					</div>

					<br />



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
$(document).ready(function() {
	$('#dataTable').DataTable();
} );
</script>
