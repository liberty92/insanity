<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Giao dịch trực tuyến | Liberty Invest</title>
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


<link
	href="${pageContext.request.contextPath}/resources/css/select2.min.css"
	rel="stylesheet">
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
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
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

.libertyForm, .select2-container--default .select2-selection--single {
	border-radius: 0px !important;
	height: 28px;
	border: 1px solid rgba(46, 157, 236, 0.47) !important;
	/* background-color: rgba(249, 247, 247, 0) !important;
	color:blue !important; */
}
input, select{
	border-radius: 0px !important;
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
				<div class="col-md-9 listArticle"
					style="padding-left: 10px; padding-right: 10px;">
					<div
						style="border-bottom: 1px solid #00aeef; padding-top: 0px; padding-bottom: 10px; margin-top: 0px; margin-bottom: 5px;">
						
						<span
							style="text-transform: uppercase; font-size: 23px; font-weight: bold; color: #00aeef; float: left">
							Giao dịch trực tuyến</span> &nbsp; 
							
							
							<a id="btn1" style="float:right; margin-left: 6px; padding:3px 12px;"
									href="${pageContext.request.contextPath}/user/balance"
									 class="btn btn-primary">
									 <i class="fa fa-list-alt" > &nbsp;
									 Quản lý tài khoản
									 </i>
									 </a>
							
							
							<span
							style="float: right; margin-top: 10px"> &nbsp; User ID:
							${user.userId} - ${user.userFullName}</span> &nbsp; 
							
							<span
							style="float: right; margin-top: 10px" id="balanceCash">&nbsp;</span>
							
							
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
							<div class="panel panel-default" style="color: #167AC6; padding-bottom:10px; margin-bottom:0px">
								<div class="panel-body">
									<div
										style="color: #00aeef; font-weight: bold; font-size: 1.2em">
										<span class="col-sm-2" style="float: left; color: red">Đặt
											lệnh</span><span id="balanceAvailableCash"
											class="col-sm-4 formatNummber">Sức mua:</span><span
											class="col-sm-1" id="stockInfo">Giá:</span> <span id="p1"
											class="col-sm-1" style="color: orange">&nbsp;</span> <span
											id="p2" class="col-sm-1" style="color: #FF00FF">&nbsp;</span>
										<span id="p3" class="col-sm-1" style="color: #01D5F4">&nbsp;</span>
										
										<span id="p4" class="col-sm-1" style="color: #00aeef;">&nbsp;</span>
									</div>

									<div>
										<form id="orderForm"
											action="${pageContext.servletContext.contextPath}/user/addOrder"
											method="POST" role="form">
											<legend style="color: red; padding: 2px 16px">
												<%
													if (request.getParameter("validationError") != null)
														out.println("Tài khoản của bạn không có đủ tiền mặt hoặc chứng khoán khả dụng để thực hiện thao tác này!");
												%></b>
											</legend>

											<div class="col-sm-6">


												<div class="form-group">
													<div>
														<label for="">Tài khoản</label>
													</div>

													<input type="hidden" class="form-control libertyForm"
														name="orderId" value="${order.orderId}" id=""
														placeholder="Demo content">
													<%-- 
										<input type="number"
										class="form-control libertyForm" name="balanceId" value="${order.balanceId}"
										id="" placeholder="Demo content"> --%>

													<select name="balanceId" id="inputBalanceId"
														class="form-control libertyForm dropdownSelect"
														required="required">
														<option value="0" selected="selected">Chọn tài
															khoản</option>
														<c:forEach items="${listBalances}" var="balance">
															<option value="${balance.balanceId}"
																onclick="alert(${balance.balanceCash})"
																<c:if test="${balance.balanceId == order.balanceId}"> selected="selected" </c:if>>
																<c:forEach items="${listUsers}" var="u">
																	<c:if test="${balance.userId == u.userId}"> ${u.userFullName} </c:if>
																</c:forEach> - ${balance.balanceId} - ${balance.balanceName}
																 - Tiền mặt: <fmt:formatNumber type="number"  pattern="###,### đ" value="${balance.balanceCash}" />  
															</option>
														</c:forEach>
													</select>
												</div>
												<div class="form-group">
												<div class="row">
													<label for="" class="col-xs-6">Mã chứng khoán</label> 
													<span id="p5" class="col-xs-6" style="float:right;color: #00aeef;white-space: nowrap !important;">&nbsp;</span>												
												</div>
													
													<select name="stockId"
														id="inputStockId"
														class="form-control libertyForm dropdownSelect"
														required="required">
														<option value="0" selected="selected">Chọn mã
															chứng khoán</option>
														<c:forEach items="${listStocks}" var="stock">
															<option style="font-family: Consolas, monospace;"
																value="${stock.stockId}">${stock.stockName}
																<%-- <c:if test="${stock.stockMarginRate > 0}">Margin:${stock.stockMarginRate}%</c:if> --%>
															</option>
														</c:forEach>
													</select>
												</div>
												
												<div class="row">
													<label id="q1" class="col-xs-6">&nbsp;</label>
													<label id="q2" class="col-xs-6">&nbsp;</label>
												</div>
											</div>

											<div class="col-sm-6">
												<div class="row">
													<div class="col-sm-4">
														<div class="form-group">
															<label for="">Hành động</label> <select id="orderAction"
																class="form-control libertyForm" name="action">
																<option value="BUY">Mua</option>
																<option value="SELL">Bán</option>
															</select>

														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-group">
															<label for="">Loại lệnh</label> <select id="orderType"
																class="form-control libertyForm" name="orderType">
																<option value="LO">LO</option>
																<option value="MP">MP</option>
																<option value="ATO">ATO</option>
																<option value="ATC">ATC</option>
															</select>
														</div>
													</div>
													<div class="col-sm-4">

														<div class="form-group">
															<label for="">Margin</label> <select id="marginState"
																class="form-control libertyForm" name="marginState">
																<option value="NO">Không</option>
																<option value="YES">Có</option>
															</select>

														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-4">
														<div class="form-group">
															<label for="">Giá</label> <input type="number" id="priceInput"
																step="0.1" class="form-control libertyForm" name="price"
																value="${order.price}" id="orderPrice"
																placeholder="Demo content">
														</div>
													</div>
													<div class="col-sm-8">
														<div class="form-group">
															<label for="">Khối lượng</label> <input type="number"  
																step="10" class="form-control libertyForm"
																name="quantity" value="${order.quantity}"
																id="orderQuantity" placeholder="Demo content">
														</div>
													</div>
												</div>
												<div class="form-group">
													<button type="submit" style="float: left"
														class="btn btn-primary">Xác nhận</button>
													<span id="tradeValue" class="formatNumber"
														style="float: right; font-weight: bold">Giá trị: 0đ</span>
												</div>
											</div>

											<br />

										</form>

										<br />

									</div>
								</div>
							</div>
						</div>

						<div class="row listArticle" style="min-height:520px !important;">
							<div class="table-responsive">
								<table id="dataTable" style="color: blue"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="20"
												style="max-width: 60px !important; padding-left: 2px; padding-right: 24px">STT</th>
											<th width="30" style="padding-left: 2px; padding-right: 24px">TK</th>
											<th width="30" style="padding-left: 2px; padding-right: 24px">ID</th>
											<th width="30"
												style="max-width: 30px !important; padding-left: 2px; padding-right: 24px">CK</th>
											<th width="50"
												style="max-width: 50px !important; padding-left: 2px; padding-right: 24px">Action</th>
											<th width="65"
												style="max-width: 65px !important; padding-left: 2px; padding-right: 24px">Loại
												lệnh</th>
											<th width="30"
												style="max-width: 30px !important; padding-left: 2px; padding-right: 24px">Giá</th>
											<th width="30" style="max-width: 60px !important;padding-left: 2px; padding-right: 24px">Khối
												lượng</th>
											<th style="padding-left: 2px;">Tổng GT</th>
											<th width="70"
												style="max-width: 40px !important; padding-left: 2px; padding-right: 24px">Thời
												gian</th>
											<th width="90"
												style="max-width: 20px !important; padding-left: 2px; padding-right: 4px">Trạng
												thái</th>
											<th width="30"
												style="max-width: 30px !important; padding-left: 2px; padding-right: 20px">Hủy</th>
										</tr>
									</thead>

									<c:forEach items="${listOrders}" var="u" varStatus="loop">
										<tr>
											<td
												style="text-align: left; max-width: 60px !important; font-weight: bold">${loop.index +1}</td>
											<td>${u.balanceId}</td>
											<td>${u.orderId}</td>
											<td style="color: blue; font-weight: bold"><c:forEach
													items="${listStocks}" var="stock">
													<c:if test="${stock.stockId == u.stockId}"> 
														${stock.stockName} 
													</c:if>
												</c:forEach></td>
											<td style="text-align: center; max-width: 60px !important;">
											<c:if test="${u.action == 'BUY'}">Mua</c:if>
											<c:if test="${u.action == 'SELL'}">Bán</c:if>
											</td>
											<td style="text-align: center">${u.orderType}</td>
											<td style="text-align: right; max-width: 60px !important;">${u.price}</td>
											<td class="formatQuantity" style="text-align: right; max-width: 30px !important;">${u.quantity}</td>
											<td class="formatNummber"
												style="text-align: right; max-width: 100px !important;">${u.price * u.quantity*1000}</td>
											<td class="formatTime" style="text-align: center; max-width:40px !important">${u.createdTime}</td>
											<td style="max-width:20px !important; text-align: center; color:red;<c:if test="${u.orderState == 'WAITING'}">color: orange;</c:if> <c:if test="${u.orderState == 'SUCCEEDED'}">color: green;</c:if>">
											
											<c:if test="${u.orderState == 'SUCCEEDED'}">Đã khớp</c:if>
											<c:if test="${u.orderState == 'UNSUCCESSED'}">Không khớp</c:if>
											<c:if test="${u.orderState == 'WAITING'}">Chờ khớp</c:if>
											<c:if test="${u.orderState == 'CANCELLED'}">Đã hủy</c:if>
											
											</td>
											<td
												style="padding-left: 0px; padding-right: 0px; text-align: center; max-width: 60px !important;">

												<c:if test="${u.orderState == 'WAITING'}">
													<a onclick="return confirm('Xác nhận hủy lệnh?')"
														style="color: red !important; font-weight: bold"
														href="<c:url value='/user/removeOrder/${u.orderId}' />"><i
														class="fa fa-trash "></i></a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
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







</body>
</html>
<script
	src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
	var priceBoard  = [0.0,0.0,0.0];
	var cash = 0;
	var ceil = 0;
	var floor = 0;
	var availableCash = 0;
	var balanceId = 0;
	var stockId = 0;
	var margin = 1;
	var max =0;
	var maxMargin =0;
	
	$('#orderForm').on('submit', function() {
	    // check validation
		   var p = $("#orderPrice").val();
		   var q = $("#orderQuantity").val();
		   var stockId = $('#inputStockId').val();
		   var balanceId = $('#inputBalanceId').val();
		 	
		   stockId = parseInt(stockId);
		   balanceId = parseInt(balanceId);

		   if( balanceId<=0){
			   bootbox.alert("Bạn chưa chọn tài khoản!", function() {
				});
			   return false
		   }

		   if(stockId<=0){
			   bootbox.alert("Bạn chưa chọn mã chứng khoán!", function() {
				});
			   return false
		   }
		   
		   if(p > priceBoard[1] ){
			   bootbox.alert("Bạn đã đặt giá mua lớn hơn giá trần!", function() {
				});
			   return false
		   }
		   if(p < priceBoard[2] ){
			   bootbox.alert("Bạn đã đặt giá mua nhỏ hơn giá sàn!", function() {
				});
			   return false
		   }
	        return true;
	});
	
	$('#cashInput').keyup(function() {
		var raw_num = $(this).val();
		var form_num = accounting.formatMoney(raw_num);
		$('#cashDisplay').html(form_num);
	});
	
	$('#orderQuantity').on('keyup', function (e) {
		var p = $("#orderPrice").val();
	    var q = $("#orderQuantity").val();
	    var value1 = p*q*1000;
	    
	    var a = parseFloat(value1);
		 
	    $('#tradeValue').text(accounting.formatMoney(a));
	   	 
	}); 
	
	$('#inputBalanceId').on('change', function (e) {
	    balanceId = this.value;
	    
	    $.ajax({
            url : '${pageContext.request.contextPath}/user/ajaxGetBalanceInfo',
            data : {
            	balanceId : balanceId
            },
            success : function(responseText) {
            	var tempArray = responseText.split("|");
            	cash = parseFloat(tempArray[0]);
            	availableCash = parseFloat(tempArray[1]);
            	$('#balanceCash').text("Tiền mặt: " + accounting.formatMoney(tempArray[0])+" -  ");
            	$('#balanceAvailableCash').text("Sức mua: " + accounting.formatMoney(tempArray[1]));
                 
            }
        });
	   	 
	}); 

	
	$('#inputStockId').on('change', function (e) {
	    stockId = this.value;
	    console.log(balanceId);
	    console.log(stockId);
	    
	    $.ajax({
            url : '${pageContext.request.contextPath}/user/ajaxGetStockInfo',
            data : {
            	stockId : stockId,
            	balanceId : balanceId
            },
            success : function(responseText) {
            	var tempArray = responseText.split("|");
            	priceBoard[0] = parseFloat(tempArray[0]);
            	priceBoard[1] = parseFloat(tempArray[1]);
            	priceBoard[2] = parseFloat(tempArray[2]);
            	
            	$('#p1').text("TC: "+tempArray[0]);
            	$('#p2').text("Trần: "+tempArray[1]);
            	ceil = tempArray[1];
            	$('#p3').text("Sàn: "+tempArray[2]);
            	floor = tempArray[2];
            	max = (availableCash/priceBoard[2]/1000).toFixed(0);
            	margin =  parseFloat(tempArray[5]);
            	maxMargin = (max/margin).toFixed(0);
            	$('#p5').text("Margin: "+(margin));
            	$('#p4').text((availableCash/priceBoard[2]/1000).toFixed(0));
            	$('#p4').formatQuantity();
            	$('#p4').text("Max: "+($('#p4').text() ));
            	
            	$('#q1').text(tempArray[3]);
            	$('#q2').text(tempArray[4]);
            	$('#q1').formatQuantity();
            	$('#q2').formatQuantity();
            	
            	
            	$('#q1').text("Hiện có: "+$('#q1').text());
            	$('#q2').text("Khả dụng: "+$('#q2').text());
            }
        });
	   	 
	}); 
	
	$('#marginState').on('change', function (e) {
		if($(this).val().localeCompare("YES") == 0){  
			$('#p4').text(maxMargin);
        	$('#p4').formatQuantity();
        	$('#p4').text("Max: "+($('#p4').text() ));
        	var temp = availableCash;
        	
        	$('#balanceAvailableCash').text("Sức mua: " + accounting.formatMoney(temp/margin));
		}
		else{
			$('#p4').text(max);
        	$('#p4').formatQuantity();
        	$('#p4').text("Max: "+($('#p4').text() ));
        	$('#balanceAvailableCash').text("Sức mua: " + accounting.formatMoney(availableCash));
		}
	});
	
	$('#orderType').on('change', function (e) {
		if($(this).val().localeCompare("LO") != 0){
			if($('#orderAction').val().localeCompare("BUY") == 0){
				$('#priceInput').val(ceil);
			}
			else{
				$('#priceInput').val(floor);
			}
		} 
	});
	
	
	$('#orderAction').on('change', function (e) {
		if($('#orderType').val().localeCompare("LO") != 0){
			if($('#orderAction').val().localeCompare("BUY") == 0){
				$('#priceInput').val(ceil);
			}
			else{
				$('#priceInput').val(floor);
			}
		} 
	});
		
	$('#cashInput').keyup(function() {
		var raw_num = $(this).val();
		var form_num = accounting.formatMoney(raw_num);
		$('#cashDisplay').html(form_num);
	});
	
	$.fn.digits = function() {
		return this.each(function() {
			$(this).text(
					$(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
		})
	};



	$.fn.formatPercent = function() {
		return this.each(function() {
			var a = parseFloat($(this).text());
			var b = Math.round(a * 100) / 100;
			$(this).text(b + "%");
		})
	};
	


	$.fn.formatQuantity = function() {
		return this.each(function() {
			 
			
			var a = parseFloat($(this).text());
			var str = accounting.formatMoney(a);
			$(this).text(str.substring(0, str.length - 2));
		})
	};

	$.fn.formatTime = function() {
		return this.each(function() {
			var a = ($(this).text());
			$(this).text(a.substring(10, 19));
		})
	};
	
	
	/* $("a[aria-controls]").click(function(){
		alert();
		$(".formatTime").formatTime();
	});
 */
	function confirmDelete() {
		var x = 2;
		bootbox.prompt("Hãy nhập OK để xác nhận xóa tài khoản",
				function(result) {
					if (result == "OK") {
						x = 4;
						alert(x > 3);
					}
				});

		return x > 3;
	};
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
	/* var xx = ${user.userId};
	var x2 = accounting.formatMoney(xx);
	$('#n1').html(x2); */
	$(document).ready(
			function() { 
				 

				 $('#dataTable').DataTable({
				        "aLengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
				        "iDisplayLength": -1
				    });
				 
/* 				 $('#myTable').on( 'draw.dt', function () {
					 $(".formatNummber").digits2();
						$(".formatPercent").formatPercent();
						$(".formatTime").formatTime();
					} );
				
				 $('#dataTable')
			        .on( 'order.dt',  function () { console.log('Order' ); } )
			        .on( 'search.dt', function () {console.log('Search' ); } )
			        .on( 'page.dt',   function () {
			        	$(".formatNummber").digits2();
						$(".formatPercent").formatPercent();
						$(".formatTime").formatTime();
			        	} )
			        .dataTable(); */
			        /* 
			        var table = $('#dataTable').dataTable();
			        table.fnSettings()._iDisplayLength = 5; //variable from your question
			        //table.fnDraw();
  */
				 
				$(".dropdownSelect").select2();

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
				$(".formatPercent").formatPercent();
				$(".formatTime").formatTime();
				$(".formatQuantity").formatQuantity();
				var glow = $('.insanity');
				setInterval(function() {
					glow.hasClass('glow') ? glow.removeClass('glow') : glow
							.addClass('glow');
				}, 4000);
			});
</script>
