<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@ page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Article manager - BK Securities core engine</title>
<!-- Meta data -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminstyle.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->

<link
	href="${pageContext.request.contextPath}/resources/images/core/favicon.ico"
	rel="shortcut icon">


<%-- 
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> 
--%>

<style type="text/css">
</style>
</head>
<body>

	<div class="container-fluid" style="width: 95%">
		<div class="row">
			<div class="row">
				<h1>
					<span style="color: #FF0000;">LIBERATION core engine</span> <span
						style="float: right;">Article manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listArticles}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Articles</h2>
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-responsive table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="50">Index</th>
											<th width="50">ID</th>
											<th width="120">Type</th>
											<th width="120">Title</th>
											<th width="120">Summary</th>
											<th>Content</th>
											<th width="120">Image</th>
											<th width="120">Creator ID</th>
											<th width="120">Public at</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listArticles}" var="a" varStatus="loop">
										<tr style="height: 80px;">
											<td style="text-align: center; font-weight: bold">${loop.index}</td>
											<td style="text-align: center;">${a.articleId}</td>
											<td style="word-break: break-all;">${a.articleTypeId}</td>
											<td>${a.articleTitle}</td>
											<td>${fn:substring(a.articleSummary,0,100)}</td>
											<td>${fn:substring(a.articleContent,0,200).replace("<", "[HTML TAG]")}</td>
											<td style="word-break: break-all;">${a.articleImage}</td>
											<td>${a.articleCreatorId}</td>
											<td>${a.articlePublicationTime}</td>
											<td><a
												href="<c:url value='/core/editArticle/${a.articleId}' />">Edit</a></td>
											<td><a
												href="<c:url value='/core/removeArticle/${a.articleId}' />">Delete</a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</c:if>

				<br />

				<div class="panel panel-default">
					<div class="panel-body">
						<h2>Add article</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addArticle"
								method="POST" role="form">
								<legend>Add new article</legend>

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

									<textarea name="articleContent"
										value="${article.articleContent}" id="input"
										class="form-control" rows="10" placeholder="Demo content"
										required="required">${article.articleContent}</textarea>

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
			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
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
							$('#dataTable').DataTable();
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
	<ckeditor:replace replace="input" basePath="${pageContext.request.contextPath}/resources/js/ckeditor2/" />
</body>
</html>
