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
<title>Thông tin tài khoản | Liberty Invest</title>
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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
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
						style="border-bottom: 1px solid grey; font-size: 23px; font-weight: bold; color: #00aeef; padding-top: 0; margin-top: 0px; text-transform: uppercase;">
						Thông tin cá nhân</h2>



					<div class="col-xs-12">
						<c:if test="${!empty sessionScope.updateMessage}">
							<div class="alert alert-success">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <strong>
									${sessionScope.updateMessage} <%
 	session.removeAttribute("updateMessage");
 %>
								</strong>
							</div>
						</c:if>
						<c:if test="${!empty sessionScope.updateError}">
							<div class="alert alert-danger">
								<a href="#" class="close" data-dismiss="alert"
									aria-label="close">&times;</a> <strong>
									${sessionScope.updateError} <%
 	session.removeAttribute("updateError");
 %>
								</strong>
							</div>
						</c:if>

						<div class="col-sm-6">


							<div class="row">
							<div class="row">
								<p>
									Họ và tên: <span class="userInfo">${user.userFullName}</span>
								</p>
								<p>
									Tuổi: <span class="userInfo">${user.userAge}</span>
								</p>
								<p>
									Số điện thoại: <span class="userInfo">${user.userPhoneNumber}</span>
								</p>
								<p>
									Email: <span class="userInfo">${user.userEmail}</span>
								</p>
								<p>
									Địa chỉ: <span class="userInfo">${user.userAddress}</span>
								</p>
							</div>
							
							<div class="row">
								<button id="btn1" type="button" data-toggle="modal"
									data-target="#changeInfo" class="btn btn-primary">Cập
									nhật thông tin</button>

								<button id="btn2" type="button" data-toggle="modal"
									data-target="#changePassword" class="btn btn-primary">Đổi
									mật khẩu</button>
							</div>
							
							</div>




						</div>




						<div class="col-sm-6" style="text-align: center">
							<c:if test="${!empty user.userProfilePicture}">
								<img src="${user.userProfilePicture}"
									class="img-responsible col-xs-12" />
							</c:if>
							<c:if test="${empty user.userProfilePicture}">
								<img
									src="${pageContext.request.contextPath}/resources/images/core/defaultProfilePicture.jpg"
									class="img-responsible col-xs-12" />
								<p>Bạn đang sử dụng ảnh đại diện mặc định</p>
							</c:if>
						</div>
					</div>



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




	<div class="modal fade" id="changeInfo">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Cập nhật thông tin cá nhân</h4>
				</div>
				<div class="modal-body">

					<form action="${pageContext.request.contextPath}/user/updateInfo"
						method="POST" role="form" data-toggle="validator">

						<div class="form-group">
							<label for="">Họ và Tên</label> <input type="text"
								value="${user.userFullName}" class="form-control"
								name="userFullName" id="" placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="">Ảnh đại diện</label> <input type="text"
								value="${user.userProfilePicture}" class="form-control"
								name="userProfilePicture" id="" placeholder="Bạn hãy dán URL ảnh vào đây">
						</div>

						<div class="form-group">
							<label for="">Tuổi</label> <input type="text"
								value="${user.userAge}" class="form-control" name="userAge"
								id="" placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="">Email</label> <input type="text"
								value="${user.userEmail}" class="form-control" name="userEmail"
								id="" placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="">Số điện thoại</label> <input type="text"
								value="${user.userPhoneNumber}" class="form-control"
								name="userPhoneNumber" id="" placeholder="Input field">
						</div>

						<div class="form-group">
							<label for="">Địa chỉ</label> <input type="text"
								value="${user.userAddress}" class="form-control"
								name="userAddress" id="" placeholder="Input field">
						</div>



						<button type="submit" class="btn btn-primary">Submit</button>
					</form>



				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="changePassword">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Đổi mật khẩu</h4>
				</div>
				<div class="modal-body">

					<form
						action="${pageContext.request.contextPath}/user/updatePassword"
						method="POST" role="form" data-toggle="validator">

						<div class="form-group">
							<label for="">Mật khẩu cũ</label> <input type="password"
								class="form-control" name="password" id="" required
								placeholder="Password">
						</div>



						<div class="form-group">
							<label for="inputPassword">Mật khẩu mới</label> <input
								type="password" data-minlength="6" class="form-control"
								id="inputPassword" name="password2" placeholder="Password"
								required> <span class="help-block">Tối thiểu 6 ký tự</span>

						</div>
						<div class="form-group">
							<label for="inputPassword">Xác nhận Mật khẩu</label> <input
								type="password" class="form-control" id="inputPasswordConfirm"
								data-match="#inputPassword" name="password3"
								data-match-error="Mật khẩu mới không khớp"
								placeholder="Confirm" required>
							<div class="help-block with-errors"></div>

						</div>


						<button type="submit" class="btn btn-primary">Submit</button>
					</form>


				</div>
			</div>
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
