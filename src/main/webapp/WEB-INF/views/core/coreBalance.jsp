<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Balance manager - BK Securities core engine</title>
<!-- Meta data -->
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

<link
	href="${pageContext.request.contextPath}/resources/css/select2.min.css"
	rel="stylesheet">
	
	<script
	src="${pageContext.request.contextPath}/resources/js/accounting.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminstyle.css">
<script
	src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>

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
						style="float: right;">Balance manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listBalances}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Balances</h2>
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="50">Index</th>
											<th width="50">ID</th>
											<th width="100">User ID</th>
											<th width="100">Balance Name</th>
											<th width="100">Created Date</th>
											<th width="100">Initial NAV</th>
											<th width="100">Cash</th>
											<th width="100">Total assets</th>
											<th width="50">NAV</th>
											<th width="50">Margin</th>
											<th width="50">State</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listBalances}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center; font-weight: bold">${loop.index +1}</td>
											<td>${u.balanceId}</td>
											<td>${u.userId}<c:forEach items="${listUsers}"
													var="user">
													<c:if test="${user.userId == u.userId}">
														<br />${user.userFullName}
                                            	</c:if>
												</c:forEach>
											</td>
											<td>${u.balanceName}</td>
											<td>${u.balanceCreatedDate}</td>
											<td class="formatNummber" style="text-align: right; color: blue">
											 	${u.balanceInitialNAV}
											 </td>
											<td class="formatNummber" style="text-align: right; color: blue">
												${u.balanceCash}
											</td>
											<td class="formatNummber" style="text-align: right; color: blue">
												${u.balanceTotalAssets}
											</td>
											<td class="formatNummber" style="text-align: right; color: blue">
												${u.balanceNAV}
											</td>
											<td>${u.balanceMarginRate}</td>
											<td>${u.balanceState}</td>
											<td><a
												href="<c:url value='/core/editBalance/${u.balanceId}' />">Edit</a></td>
											<td><a
												href="<c:url value='/core/removeBalance/${u.balanceId}' />">Delete</a></td>
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
						<h2>Add balance</h2>

						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addBalance"
								method="POST" role="form">
								<legend>Add new balance</legend>

								<div class="form-group">
									<label for="">User Id</label> <input type="hidden"
										class="form-control" name="balanceId"
										value="${balance.balanceId}" id="" placeholder="Demo content">

									<select name="userId" id="input" class="form-control dropdownSelect" id="dropdownSelect">
										<c:forEach items="${listUsers}" var="user">
											<option value="${user.userId}">${user.userId} - ${user.userFullName}</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label for="">Balance name</label> <input type="text"
										class="form-control" name="balanceName"
										value="${balance.balanceName}" id=""
										placeholder="Demo content">
								</div>

								<label for="">Created date</label>
								<div class='input-group date'>
									<input type='text' id='datetimepicker'
										name="balanceCreatedDate"
										value="${balance.balanceCreatedDate}" class="form-control" />
									<span class="input-group-addon"> <span
										id="datetimepickericon" class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>

								<div class="form-group">
									<label for="">Initial NAV</label> <input type="text"
										class="form-control" name="balanceInitialNAV"
										value="${balance.balanceInitialNAV}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Cash</label> <input type="text"
										class="form-control" name="balanceCash"
										value="${balance.balanceCash}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Total assets</label> <input type="text"
										class="form-control" name="balanceTotalAssets"
										value="${balance.balanceTotalAssets}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">NAV</label> <input type="text"
										class="form-control" name="balanceNAV"
										value="${balance.balanceNAV}" id="" placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Margin rate</label> <input type="text"
										class="form-control" name="balanceMarginRate"
										value="${balance.balanceMarginRate}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">State</label> <input type="text"
										class="form-control" name="balanceState"
										value="${balance.balanceState}" id=""
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

		$.fn.digits = function() {
			return this.each(function() {
				$(this).text(
						$(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g,
								"$1,"));
			})
		}
		
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

		$(document)
				.ready(
						function() {
							$('#dataTable').DataTable();
							$(".formatNummber").digits2();
							$(".dropdownSelect").select2();

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

							if ("${balance.balanceCreatedDate}" != null
									&& ("${balance.balanceCreatedDate}").length > 0) {
								$('#datetimepicker')
										.val(
												formatDate("${balance.balanceCreatedDate}"));
							}

						});
	</script>

</body>
</html>
