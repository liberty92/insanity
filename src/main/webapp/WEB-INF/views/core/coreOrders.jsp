<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Order manager - BK Securities core engine</title>
<!-- Meta data -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/images/core/favicon.ico" rel="shortcut icon">
<link href="${pageContext.request.contextPath}/resources/css/select2.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
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
	<div class="container-fluid" style="width:95%" >
		<div class="row">
			<div class="row">
				<h1>
					<span style="color: #FF0000;">LIBERATION core engine</span> <span
						style="float: right;">Order manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>  
			</div>
			<div class="row">
				<c:if test="${!empty listOrders}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List Orders</h2>
							<div class="table-responsive">
							<table class="table table-hover table-striped table-bordered" id="dataTable">
								<thead>
									<tr>
										<th width="50">Index</th>
										<th width="50">ID</th>
										<th width="150">Balance ID & Owner info</th>
										<th width="100">Stock ID</th>
										<th width="100">Action</th>
										<th width="100">Order type</th>
										<th width="100">Price</th>
										<th width="100">Quantity</th>
										<th width="100">Value</th>
										<th width="100">Created time</th>
										<th width="100">State</th>
										<th width="50">Edit</th>
										<th width="50">Delete</th>
									</tr>
								</thead>
								<c:forEach items="${listOrders}" var="u"  varStatus="loop">
									<tr>
										<td style="text-align:center; font-weight:bold">${loop.index +1}</td>
										<td>${u.orderId}</td>
										<td>${u.balanceId}

											<c:forEach items="${listBalances}" var="balance">
												<c:if test="${balance.balanceId == u.balanceId}">
													<c:forEach items="${listUsers}" var="user">
														<c:if test="${balance.userId == user.userId}"><br/> ${user.userFullName} </c:if> 
													</c:forEach>
													<br/>${balance.balanceName}
	                                           	</c:if> 
											</c:forEach>

										</td>
										<td>${u.stockId}<br/>

											<c:forEach items="${listStocks}" var="stock">
												<c:if test="${stock.stockId == u.stockId}"> 
													${stock.stockName} 
												</c:if>
											</c:forEach> 
											
										</td>
										<td>${u.action}
										<c:if test="${u.action.length()>3} ">
											<c:if test="${u.margin > 0}">
											<br/><span style="color:RED">Margin: ${u.margin}%</span>
											</c:if>
										</c:if>
										</td>
										<td>${u.orderType}</td>
										<td class="formatNummber" style="text-align:right;color: blue">
											<%-- <span style="clear:both">${u.price}</span><br/> --%> 
												<fmt:parseNumber var="i" type="number" value="${u.price}" pattern="#,###"/>
												<c:out value="${i}"/>
										</td>
										<td class="formatNummber" style="text-align:right;color: blue">
												<fmt:parseNumber var="i2" type="number" value="${(u.quantity)}" pattern="#,###"/>
												<c:out value="${i2}"/>
										
										</td>
										<td class="formatNummber" style="text-align:right;color: blue">
												<fmt:parseNumber var="i3" type="number" value="${(u.quantity * u.price *1000)}" pattern="#,###"/>
												<c:out value="${i3}"/> đ
										
										</td> 
										<td>${u.createdTime}</td>
										<td>${u.orderState}</td> 
										<td><a
											href="<c:url value='/core/editOrder/${u.orderId}' />">Edit</a></td>
										<td><a
											href="<c:url value='/core/removeOrder/${u.orderId}' />">Delete</a></td>
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
						<h2>Add order</h2>

						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addOrder"
								method="POST" role="form">
								<legend>Add new order item</legend>

								<div class="form-group">
									<label for="">Balance Id</label> <input type="hidden"
										class="form-control" name="orderId" value="${order.orderId}"
										id="" placeholder="Demo content"> 
										<%-- 
										<input type="number"
										class="form-control" name="balanceId" value="${order.balanceId}"
										id="" placeholder="Demo content"> --%>
										
										<select name="balanceId" id="input" class="form-control dropdownSelect" required="required">
										<c:forEach items="${listBalances}" var="balance">
											<option value="${balance.balanceId}" <c:if test="${balance.balanceId == order.balanceId}"> selected="selected" </c:if>  >
												<c:forEach items="${listUsers}" var="u">
													<c:if test="${balance.userId == u.userId}"> ${u.userFullName} </c:if> 
												</c:forEach>
												- ${balance.balanceId}
											</option>
										</c:forEach> 
										</select>
								</div>

								<div class="form-group">
									<label for="">Stock ID</label> 
									<select name="stockId" id="input" class="form-control dropdownSelect" required="required">
										<c:forEach items="${listStocks}" var="stock">
											<option style="font-family: Consolas,  monospace;" value="${stock.stockId}" <c:if test="${stock.stockId == order.stockId}"> selected="selected" </c:if>  >
												${stock.stockName} <c:if test="${stock.stockMarginRate > 0}">Margin:${stock.stockMarginRate}%</c:if>   
											</option>
										</c:forEach> 
										</select>
									
									
									<%-- <input type="number"
										class="form-control" name="stockId" value="${order.stockId}"
										id="" placeholder="Demo content"> --%>
										
								</div>

								<div class="form-group">
									<label for="">Action</label>  
										<select class="form-control" name="action">
											<option value="BUY">Buy</option>
											<option value="SELL">Sell</option>
										</select>
										
								</div>
								
								

								<div class="form-group">
									<label for="">Using margin</label>  
										<select class="form-control" name="marginState">
											<option value="NO">No</option>
											<option value="YES">Yes</option>
										</select>
										
								</div>

								<div class="form-group">
									<label for="">Order type</label> 
									<select class="form-control" name="orderType">
											<option value="LO">LO</option>
											<option value="MP">MP</option>
											<option value="ATO">ATO</option>
											<option value="ATC">ATC</option>
										</select>
								</div>

								<div class="form-group">
									<label for="">Price</label> <input type="number" step="0.1"
										class="form-control" name="price"
										value="${order.price}" id=""
										placeholder="Demo content">
								</div>

								<div class="form-group">
									<label for="">Quantity</label> <input type="number" step="10"
										class="form-control" name="quantity"
										value="${order.quantity}" id=""
										placeholder="Demo content">
								</div> 

								<label for="">Created time</label>
								<div class='input-group date'>
									<input type='text' id='datetimepicker2'
										name="createdTime"
										value="${order.createdTime}" class="form-control" />
									<span class="input-group-addon"> <span
										id="datetimepickericon" class="glyphicon glyphicon-calendar"></span>
									</span>
								</div> 

								<div class="form-group">
									<label for="">Order state</label> 
									<select class="form-control" name="orderState">
											<option value="WAITING">WAITING</option>
											<option value="SUCCEEDED">SUCCEEDED</option>
											<option value="CANCELLED">CANCELLED</option>
											<option value="UNSUCCEEDED">UNSUCCEEDED</option>
										</select>
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
		<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>

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

		$('#datetimepicker2').datetimepicker({
			format : 'DD-MM-YYYY HH:mm:ss'
		});
		
		$.fn.digits = function(){ 
		    return this.each(function(){ 
		        $(this).text( $(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") ); 
		    })
		}
		
		$.fn.breakLine = function(){  
		    return this.each(function(){ 
		        $(this).html( $(this).html().replace(/&nbsp;/g,"<br/>")); 
		        $(this).html( $(this).html().replace(".0","")); 
		    })
		}
		
		 

		$(document)
				.ready(
						function() { 
							$('#dataTable').DataTable();
							$(".dropdownSelect").select2();
							$(".formatNummber").digits();
							
							$("a").click(function(){
								$(".formatNummber").digits();
							});
							/* $(".formatNummber").breakLine(); */

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

							if ("${order.createdTime}" != null
									&& ("${order.createdTime}").length > 0) {
								$('#datetimepicker')
										.val(
												formatDate("${order.createdTime}"));
							}

						});
	</script>

</body>
</html>
