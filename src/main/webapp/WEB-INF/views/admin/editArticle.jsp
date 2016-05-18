<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
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

				<div class="listArticle" style="margin-bottom:10px">

					<div class="title">

						<span style="color: #00aeef; font-size: 2em; margin-left: 10px">${listArticles[0].articleTypeId}</span>
						
					</div>


				<div class="panel panel-default" style="border-radius:0px; border: none; background: rgba(100,180,220,0.2); color: white">
					<div class="panel-body">
						<div>
							<form
								action="${pageContext.servletContext.contextPath}/admin/addArticle"
								method="POST" role="form">
								<legend style="color:white">
								<c:if test="${empty article.articleId}">
									Add new article
								</c:if>
								<c:if test="${!empty article.articleId}">
									Edit article | ${article.articleTitle}
								</c:if>
								</legend>

								<div class="form-group">
									<label for="">Type</label> <input type="hidden"
										class="form-control" name="articleId"
										value="${article.articleId}" id="" placeholder="Demo content">

									<input type="text" class="form-control" name="articleTypeId"
										value="${article.articleTypeId}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Title</label> <input type="text"
										class="form-control" name="articleTitle"
										value="${article.articleTitle}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Summary</label> <input type="text"
										class="form-control" name="articleSummary"
										value="${article.articleSummary}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Content</label> 

									<textarea name="articleContent" id="editor1" class="form-control" rows="10" placeholder="Demo content" required="required">
									${article.articleContent}
									</textarea>
 
								</div>



								<div class="form-group">
									<label for="">Creator ID</label> <input type="text"
										class="form-control" name="articleCreatorId"
										value="${article.articleCreatorId}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Image</label> <input type="text"
										class="form-control" name="articleImage"
										value="${article.articleImage}" id=""
										placeholder="Demo content">
								</div>


								<label for="">Article Publication Time</label>
								<div class='input-group date'>
									<input type='text' id='datetimepicker'
										name="articlePublicationTime"
										value="${article.articlePublicationTime}" class="form-control" />
									<span class="input-group-addon"> <span
										id="datetimepickericon" class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>

								<br />

								<button type="submit" class="btn btn-primary">Submit</button>
							</form>

							<br />

						</div>
					</div>
				</div>

					<br />
 


				</div>


			</div>

			<!-- ====================== BODY ENDS =================================== -->
			<!--3. Footer include-->
		</div>
		<div class="row">
			<%@ include file="../template/backend/footer.jsp"%>
		</div>
	</div>
	
	
	<script
		src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript">
		// $('#datetimepicker').datetimepicker();

		function formatDate(value) {
			if (value) {
				Number.prototype.padLeft = function(base, chr) {
					var len = (String(base || 10).length - String(this).length) + 1;
					return len > 0 ? new Array(len).join(chr || '0') + this
							: this;
				}
				var d = new Date(value), dformat = [
						(d.getMonth() + 1).padLeft(), d.getDate().padLeft(),
						d.getFullYear() ].join('/')
						+ ' '
						+ [ d.getHours().padLeft(), d.getMinutes().padLeft(),
								d.getSeconds().padLeft() ].join(':');
				return dformat;
			}
		}

		$('#datetimepicker').datetimepicker({
			format : 'DD-MM-YYYY HH:mm:ss'
		});

		$(document)
				.ready(
						function() {

							var $datetimepicker = $('#datetimepicker');

							var d = new Date();
							var showDate = (("00" + (d.getMonth() + 1))
									.slice(-2)
									+ "/"
									+ ("00" + d.getDate()).slice(-2)
									+ "/"
									+ d.getFullYear()
									+ " "
									+ ("00" + d.getHours()).slice(-2)
									+ ":"
									+ ("00" + d.getMinutes()).slice(-2) + ":" + ("00" + d
									.getSeconds()).slice(-2));

							$('#datetimepicker').val(showDate);

							if ("${article.articlePublicationTime}" != null
									&& ("${article.articlePublicationTime}").length > 0) {
								$('#datetimepicker')
										.val(
												formatDate("${article.articlePublicationTime}"));
							}

						});
	</script>
	<ckeditor:replace replace="editor1" basePath="${pageContext.request.contextPath}/resources/js/ckeditor2/" />
</body>
</html> 

