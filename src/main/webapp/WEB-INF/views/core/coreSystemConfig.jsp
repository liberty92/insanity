<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SystemConfig manager - BK Securities core engine</title>
<!-- Meta data -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminstyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/accounting.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/images/core/favicon.ico"
	rel="shortcut icon">
<%-- 
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/images/core/favicon.ico" rel="shortcut icon">

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
						style="float: right;">System config</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listSystemConfigs}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>System config</h2>
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="10">Index</th>
											<th width="200">Slide1</th>
											<th width="200">Slide2</th>
											<th width="200">Slide3</th>
											<th width="200">Slide4</th>
											<th width="200">SlideText1</th>
											<th width="200">SlideText2</th>
											<th width="200">SlideText3</th>
											<th width="200">SlideText4</th>
											<th width="200">Banner</th>
											<th width="200">Logo</th>
											<th width="200">FooterBanner</th>
											<th width="200">Video</th>
											<th width="200">Fanpage</th>
											<th width="200">Contact</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listSystemConfigs}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center">${loop.index +1}</td>
										 	<td>${slide1}</td>
										 	<td>${slide2}</td>
										 	<td>${slide3}</td>
										 	<td>${slide4}</td>
										 	<td>${slideText1}</td>
										 	<td>${slideText2}</td>
										 	<td>${slideText3}</td>
										 	<td>${slideText4}</td>
										 	<td>${banner}</td>
										 	<td>${logo}</td>
										 	<td>${footerBanner}</td>
										 	<td>${video}</td>
										 	<td>${fanpage}</td>
										 	<td>${contact}</td>
											<td><a
												href="<c:url value='/core/editSystemConfig/${u.configId}' />">Edit</a></td>
											<td>
											<c:if test="${u.configId != 1 }">
											<a
												href="<c:url value='/core/removeSystemConfig/${u.configId}' />">Delete</a>
												</td>
											</c:if>
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
						<h2>Edit system config</h2>
						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addSystemConfig"
								method="POST" role="form">
								<div class="form-group">
									<label for="">Slide 1</label> <input type="hidden"
										class="form-control" name="id" value="${systemConfig.configId}" id=""
										placeholder="Demo content"> <input type="text"
										class="form-control" name="slide1" value="${systemConfig.slide1}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Slide 2</label> <input type="text"
										step="10e6" class="form-control" name="slide2"
										value="${systemConfig.slide2}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Slide 3</label> <input type="text"
										step="10e6" class="form-control" name="slide3"
										value="${systemConfig.slide3}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Slide 4</label> <input type="text"
										step="10e6" class="form-control" name="slide4"
										value="${systemConfig.slide4}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Slide Text 1</label> <input type="text"
										step="10e6" class="form-control" name="slideText1"
										value="${systemConfig.slideText1}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Slide Text 2</label> <input type="text"
										step="10e6" class="form-control" name="slideText2"
										value="${systemConfig.slideText2}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Slide Text 3</label> <input type="text"
										step="10e6" class="form-control" name="slideText3"
										value="${systemConfig.slideText3}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Slide Text 4</label> <input type="text"
										step="10e6" class="form-control" name="slideText4"
										value="${systemConfig.slideText4}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Banner</label> <input type="text"
										step="10e6" class="form-control" name="banner"
										value="${systemConfig.banner}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Logo</label> <input type="text"
										step="10e6" class="form-control" name="logo"
										value="${systemConfig.logo}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Footer banner</label> <input type="text"
										step="10e6" class="form-control" name="footerBanner"
										value="${systemConfig.footerBanner}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Video</label> <input type="text"
										step="10e6" class="form-control" name="video"
										value="${systemConfig.video}" id="video"
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Fanpage</label> <input type="text"
										step="10e6" class="form-control" name="fanpage"
										value="${systemConfig.fanpage}" id=""
										placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Contact</label> <input type="text"
										step="10e6" class="form-control" name="contact"
										value="${systemConfig.contact}" id=""
										placeholder="Demo content">
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
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
	$.fn.digits2 = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			$(this).text(accounting.formatMoney(a));
		})
	};
	accounting.settings = {
			currency : {
				symbol : " đ", // default currency symbol is '$'
				format : "%v%s", // controls output: %s = symbol, %v = value/number (can be object: see below)
				decimal : ".", // decimal point separator
				thousand : ",", // thousands separator
				precision : 0
			// decimal places
			},
			number : {
				precision : 0, // default precision on numbers is 0
				thousand : ",",
				decimal : "."
			}
		};
		$(document).ready(function() {
			$(".formatNummber").digits2();
		});
	</script>
</body>
</html>
