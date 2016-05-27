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
<!-- 
LOCAL -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JS -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
</head>
<script
	src="${pageContext.request.contextPath}/resources/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bk.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/accounting.min.js"></script>

<style>
table {
	color: black;
}
</style>

<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="../template/frontend/header.jsp"></jsp:include>
			<!-- ====================== BODY STARTS =================================== -->
			<%@ include file="../template/frontend/menu/menu.jsp"%>
			<!--2. Main body-->

			<div class="row " style="margin: 0px 10px">
				<!-- <div class="col-md-9 listArticle" -->
				<div class="col-md-12 listArticle"
					style="padding-left: 10px; padding-right: 10px;">
					<div
						style="border-bottom: 1px solid #00aeef; padding-top: 0px; padding-bottom: 6px; margin-top: 0px; margin-bottom: 5px;">
						
						
						
						
						<span
							style="text-transform: uppercase; font-size: 23px; font-weight: bold; color: #00aeef; float: left">
							Quản lý tài khoản </span> &nbsp; 
							
							
							
							<span
							style="float: right; margin-top: 5px">User ID:
							${user.userId} - ${user.userFullName}</span>
					</div>



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

						<div class="row">
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="30" style="max-width:30px !important;padding-right:0px; margin-right:0px;">STT</th>
											<!-- <th width="30">ID</th> -->
											<th width="150"  style="min-width:150px !important">Tên TK</th>
											<th width="110" style="min-width:110px !important">Ngày tạo</th>
											<th width="100" style="min-width:100px !important">NAV gốc</th>
											<th width="100" style="min-width:100px !important">Tiền mặt</th>
											<th width="100" style="min-width:100px !important">Khả dụng</th>
											<th width="100" style="min-width:100px !important">Tổng TS</th>
											<th width="100" style="min-width:100px !important">NAV</th>
											<th width="80" style="min-width:80px !important">+/-</th>
											<th width="30"  style="max-width:30px !important; padding-left:2px; padding-right:20px ">%</th>
											<!-- <th width="30">Margin</th> -->
											<th width="40" style="max-width:40px !important;padding-right:3px; padding-left:3px;margin-right:0px; text-align:center">Xóa</th>
										</tr>
									</thead>
									<c:forEach items="${listBalances}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center; font-weight: bold; max-width:30px">${loop.index +1}</td>
											<%-- <td>${u.balanceId}</td> --%>
											<td><a style="color: blue !important"
												href="${pageContext.request.contextPath}/user/portfolio/${u.balanceId}"><i class="fa fa-sign-in" style="color:green"></i> ${u.balanceId} - ${u.balanceName}</a>
											</td>
											<td class="formatTime">${u.balanceCreatedDate}</td>
											<td id="n1" class="formatNummber"
												style="text-align: right; color: blue">
												${u.balanceInitialNAV}</td>
											<td class="formatNummber"
												style="text-align: right; color: blue">
												${u.balanceCash}</td>
											<td class="formatNummber"
												style="text-align: right; color: blue">
												${u.balanceAvailableCash}</td>
											<td class="formatNummber"
												style="text-align: right; color: blue">
												${u.balanceTotalAssets}</td>
											<td class="formatNummber"
												style="text-align: right; color: blue">${u.balanceNAV}</td>
											<td class="formatNummber" style="text-align: right; color: blue">
												${u.balanceNAV-u.balanceInitialNAV}</td>
											<td class="formatPercent" style="color:red; font-weight: bold; text-align:right;  
												<c:if test="${(u.balanceNAV-u.balanceInitialNAV) >=0}">color:green; text-align:center</c:if>"> 
											${(u.balanceNAV-u.balanceInitialNAV)/u.balanceInitialNAV*100}%</td>
											<%-- <td>${u.balanceMarginRate}</td> --%>
											<td
												style="padding-left: 0px; padding-right: 0px; text-align: center; max-width:30px !important">
												<a onclick="return confirm('Xác nhận xóa tài khoản?')"
												style="color: red !important; font-weight: bold"
												href="<c:url value='/user/removeBalance/${u.balanceId}' />"><i class="fa fa-trash "></i></a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>










						<div class="row" >


								<button id="btn1" type="button" data-toggle="modal" 
									data-target="#changeInfo" class="btn btn-primary"><i class="fa fa-plus-square"> 
									<span  style="font-family:arial">Tạo tài khoản</span></i></button>


						</div>




					</div>



				</div>
<%-- 
				<div class="col-md-3" style="padding-right: 0px">
					<div class="col-xs-12 sideBarWrapper">
						<div class="Side-bar">
							<%@ include file="../template/frontend/rightside.jsp"%>
						</div>
					</div>
				</div> --%>
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
					<h4 class="modal-title">Tạo tài khoản</h4>
				</div>
				<div class="modal-body">

					<form action="${pageContext.request.contextPath}/user/addBalance"
						method="POST" role="form" data-toggle="validator">

						<input type="hidden" value="${user.userId}" name="userId">

						<div class="form-group">
							<label for="">Tên tài khoản</label> <input type="text"
								data-minlength="3" required value="" class="form-control"
								name="balanceName" id="" placeholder="demo 1">
						</div>

						<div class="form-group">
							<div>
								<label for=""><span style="float: left">NAV ban
										đầu</span> </label><span id="cashDisplay"
									style="color: blue; float: right; font-weight: bold">0</span>
							</div>
							<input type="number" pattern="[0-9]*" min="100000" max="10e10"
								required value="" class="form-control" name="balanceInitialNAV"
								id="cashInput" placeholder="10,000,000">
						</div>


						<button type="submit" class="btn btn-primary">Submit</button>
					</form>



				</div>
			</div>
		</div>
	</div>



</body>
</html>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	
<script type="text/javascript">



	$.fn.digits = function() {
		return this.each(function() {
			$(this).text(
					$(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		})
	};

	$.fn.digits2 = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			$(this).text(accounting.formatMoney(a));
		})
	};
	
	$.fn.formatTime = function() {
		return this.each(function() {
			var a = ($(this).text());
			$(this).text(a.substring(10, 19) + " "+ a.substring(8, 10) + "/"+a.substring(5, 7)+"/"+a.substring(0, 4) );
		})
	};
	
	$.fn.formatPercent = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			var b = Math.round(a * 100) / 100;
			$(this).text(b +"%");
		})
	};


	function confirmDelete() {
		var x = 2;
		bootbox.prompt("Hãy nhập OK để xác nhận xóa tài khoản", function(result) {                
			  if (result == "OK") {
				  x = 4;
				  alert(x>3);
			  }
		});
		
		return x>3;
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
	/* var xx = ${user.userId};
	var x2 = accounting.formatMoney(xx);
	$('#n1').html(x2); */

	$(document).ready(
			function() {
				
				 $('#dataTable').DataTable({
				        "aLengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
				        "iDisplayLength": -1
				    });
				
				$(".formatPercent").formatPercent();
				$(".formatTime").formatTime();

				$('#cashInput').keyup(function() {
					var raw_num = $(this).val();
					var form_num = accounting.formatMoney(raw_num);
					$('#cashDisplay').html(form_num);
				});
				/* $("body").keyup(function(){ 
						$(".formatNummber").html(accounting.formatMoney(123456789));
					}); */
				//$(".formatNummber").html(accounting.formatMoney($(this).val()));
				// $(".formatNummber").digits();
				$(".formatNummber").digits2();
				var glow = $('.insanity');
				setInterval(function() {
					glow.hasClass('glow') ? glow.removeClass('glow') : glow
							.addClass('glow');
				}, 4000);
			});
</script>
