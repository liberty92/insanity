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
<title>PriceBoard manager - BK Securities core engine</title>
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
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminstyle.css">
<link
	href="${pageContext.request.contextPath}/resources/css/select2.min.css"
	rel="stylesheet">
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
th {
	text-align: center;
}

td {
	text-align: right;
}
body{
}
h2{
	border-bottom: 1px solid rgba(0,0,0,0.3);
}
</style>
</head>
<body>

	<div class="container-fluid" style="width: 95%">
		<div class="row">
			<div class="row">
				<h1>
					<span style="color: #FF0000;">LIBERATION core engine</span> <span
						style="float: right;">PriceBoard manager</span>
				</h1>
			</div>
			<div class="row">
				<%@ include file="../template/frontend/menu/menuAdmin.jsp"%>
			</div>
			<div class="row">
				<c:if test="${!empty listPriceBoard}">
					<div class="panel panel-default">
						<div class="panel-body">
							<h2>List PriceBoard</h2>
							<div class="table-responsive">
								<table id="dataTable"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="30">Index</th>
											<th width="50">ID</th>
											<th width="50">Name</th>
											<th width="50">Price</th>
											<th width="50">Ceil</th>
											<th width="50">Floor</th>
											<th width="50">TQ</th>
											<th width="50">Buy 3</th>
											<th width="50">BQ 3</th>
											<th width="50">Buy 2</th>
											<th width="50">BQ 2</th>
											<th width="50">Buy 1</th>
											<th width="50">BQ 1</th>
											<th width="50">Match</th>
											<th width="50">MQ</th>
											<th width="50">+/-</th>
											<th width="50">Sell 1</th>
											<th width="50">SQ 1</th>
											<th width="50">Sell 2</th>
											<th width="50">SQ 2</th>
											<th width="50">Sell 3</th>
											<th width="50">SQ 3</th>
											<th width="50">Lowest</th>
											<th width="50">Highest</th>
											<th width="50">Overbuy</th>
											<th width="50">Oversold</th>
											<th width="50">Edit</th>
											<th width="50">Delete</th>
										</tr>
									</thead>
									<c:forEach items="${listPriceBoard}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center">${loop.index +1}</td>
											<td>${u.priceBoardId}</td>
											<td>${u.stockId}</td>
											<td>${u.price}</td>
											<td>${u.ceil}</td>
											<td>${u.floor}</td>
											<td>${u.tradedQuantity}</td>
											<td>${u.buy3}</td>
											<td>${u.buy3Quantity}</td>
											<td>${u.buy2}</td>
											<td>${u.buy2Quantity}</td>
											<td>${u.buy1}</td>
											<td>${u.buy1Quantity}</td>
											<td>${u.matchPrice}</td>
											<td>${u.matchQuantity}</td>
											<td>${u.matchPrice - u.price}</td>
											<td>${u.sell1}</td>
											<td>${u.sell1Quantity}</td>
											<td>${u.sell2}</td>
											<td>${u.sell2Quantity}</td>
											<td>${u.sell3}</td>
											<td>${u.sell3Quantity}</td>
											<td>${u.lowest}</td>
											<td>${u.highest}</td>
											<td>${u.overbuy}</td>
											<td>${u.oversold}</td>
 											<td><a
												href="<c:url value='/core/editPriceBoard/${u.priceBoardId}' />">Edit</a></td>
											<td><a
												href="<c:url value='/core/removePriceBoard/${u.priceBoardId}' />">Delete</a></td>
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
						<h2>Add stock price</h2>


						<div>
							<form
								action="${pageContext.servletContext.contextPath}/core/addPriceBoard"
								method="POST" role="form">
								<legend>Add new stock price trading status</legend>

								<input type="hidden" name="priceBoardId" value="${priceBoard.priceBoardId}" />		 
						
								<div class="form-group">
									<label for="">Stock Name & ID</label> <select
										name="stockId" id="input" class="form-control dropdownSelect"
										required="required">
											<c:forEach items="${listStock}" var="stock">
												<option value="${stock.stockId}" <c:if test="${priceBoard.stockId == stock.stockId}"> selected="selected" </c:if> >
													${stock.stockName} - ${stock.stockId}
												</option>
											</c:forEach>
									</select>
								</div> 
								
								

								<div class="form-group">
									<label for="">Price</label> <input type="number" step="0.1"
										class="form-control" name="price" value="${priceBoard.price}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Ceil</label> <input type="number" step="0.1"
										class="form-control" name="ceil" value="${priceBoard.ceil}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Floor</label> <input type="number" step="0.1"
										class="form-control" name="floor" value="${priceBoard.floor}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Traded quantity</label> <input type="number" step="10"
										class="form-control" name="tradedQuantity" value="${priceBoard.tradedQuantity}"
										id="" placeholder="Demo content">
								</div> 
								<div class="form-group">
									<label for="">Buy 3</label> <input type="number" step="0.1"
										class="form-control" name="buy3" value="${priceBoard.buy3}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Buy 3 Quantity</label> <input type="number" step="10"
										class="form-control" name="buy3Quantity" value="${priceBoard.buy3Quantity}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Buy 2</label> <input type="number" step="0.1"
										class="form-control" name="buy2" value="${priceBoard.buy2}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Buy 2 Quantity</label> <input type="number" step="10"
										class="form-control" name="buy2Quantity" value="${priceBoard.buy2Quantity}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Buy 1</label> <input type="number" step="0.1"
										class="form-control" name="buy1" value="${priceBoard.buy1}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Buy 1 Quantity</label> <input type="number" step="10"
										class="form-control" name="buy1Quantity" value="${priceBoard.buy1Quantity}"
										id="" placeholder="Demo content">
								</div> 
				 				<div class="form-group">
									<label for="">Match price</label> <input type="number" step="0.1"
										class="form-control" name="matchPrice" value="${priceBoard.matchPrice}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Match Quantity</label> <input type="number" step="10"
										class="form-control" name="matchQuantity" value="${priceBoard.matchQuantity}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Sell 1</label> <input type="number" step="0.1"
										class="form-control" name="sell1" value="${priceBoard.sell1}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Sell 1 Quantity</label> <input type="number" step="10"
										class="form-control" name="sell1Quantity" value="${priceBoard.sell1Quantity}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Sell 2</label> <input type="number" step="0.1"
										class="form-control" name="sell2" value="${priceBoard.sell2}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Sell 2 Quantity</label> <input type="number" step="10"
										class="form-control" name="sell2Quantity" value="${priceBoard.sell2Quantity}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Sell 3</label> <input type="number" step="0.1"
										class="form-control" name="sell3" value="${priceBoard.sell3}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Sell 3 Quantity</label> <input type="number" step="10"
										class="form-control" name="sell3Quantity" value="${priceBoard.sell3Quantity}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Lowest</label> <input type="number" step="0.1"
										class="form-control" name="lowest" value="${priceBoard.lowest}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Highest</label> <input type="number" step="0.1"
										class="form-control" name="highest" value="${priceBoard.highest}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Overbuy</label> <input type="number" step="10"
										class="form-control" name="overbuy" value="${priceBoard.overbuy}"
										id="" placeholder="Demo content">
								</div>
								<div class="form-group">
									<label for="">Oversold</label> <input type="number" step="10"
										class="form-control" name="oversold" value="${priceBoard.oversold}"
										id="" placeholder="Demo content">
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
		$(document).ready(function() {
			$('#dataTable').DataTable();
			$(".dropdownSelect").select2();
		});
	</script>

</body>
</html>
