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
<title>Lịch sử giao dịch | Liberty Invest</title>
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


<link href="${pageContext.request.contextPath}/resources/css/select2.min.css" rel="stylesheet">
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
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
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
						style="border-bottom: 1px solid #00aeef; padding-top: 0px; padding-bottom: 10px; margin-top: 0px; margin-bottom: 5px;">
						<span
							style="text-transform: uppercase; font-size: 23px; font-weight: bold; color: #00aeef; float: left">
							Lịch sử đặt lệnh</span> &nbsp; <span
							style="float: right; margin-top: 10px">Balance ID:
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
								<table id="dataTable" style="color: blue"
									class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th width="20">STT</th>
											<th width="30">TK</th>
											<th width="30">ID</th>
											<th width="50">Mã CK</th>
											<th width="80" style="max-width: 80px !important; padding-right:2px;">Hành động</th>
											<th width="80">Loại lệnh</th>
											<th width="80">Giá</th>
											<th width="80">Khối lượng</th>
											<th width="80" style="max-width: 100px !important; padding-right:8px;">Tổng GT</th>
											<th width="90" >Thời gian</th>
											<th width="80">Trạng thái</th>
										</tr>
									</thead>

									<c:forEach items="${listOrders}" var="u" varStatus="loop">
										<tr>
											<td style="text-align: center; font-weight: bold">${loop.index +1}</td>
											<td>${u.balanceId}</td>
											<td>${u.orderId}</td>
											<td style="color: blue; font-weight: bold"><c:forEach
													items="${listStocks}" var="stock">
													<c:if test="${stock.stockId == u.stockId}"> 
														${stock.stockName} 
													</c:if>
												</c:forEach></td>
											<td style="text-align: right; max-width: 80px !important;">${u.action}</td>
											<td style="text-align: right">${u.orderType}</td>
											<td style="text-align: right">${u.price}</td>
											<td class="formatQuantity" style="text-align: right">${u.quantity}</td>
											<td class="formatNummber"  style="text-align: right;max-width: 100px !important;">${u.price * u.quantity*1000}</td>
											<td class="formatTime" >${u.createdTime}</td>
											<td style="text-align: center; color:red;<c:if test="${u.orderState == 'WAITING'}">color: orange;</c:if> <c:if test="${u.orderState == 'SUCCEEDED'}">color: green;</c:if>">
											
												<c:if test="${u.orderState == 'SUCCEEDED'}">Đã khớp</c:if>
												<c:if test="${u.orderState == 'UNSUCCESSED'}">Không khớp</c:if>
												<c:if test="${u.orderState == 'WAITING'}">Chờ khớp</c:if>
												<c:if test="${u.orderState == 'CANCELLED'}">Đã hủy</c:if>
											
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>







 




					</div>



				</div>

	<%-- 			<div class="col-md-3" style="padding-right: 0px">
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







</body>
</html>
<script
	src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js"></script>
	
	
		<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
	var priceBoard  = [0.0,0.0,0.0];
	var cash = 0;
	
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
	
	$('#orderQuantity').on('blur', function (e) {
		var p = $("#orderPrice").val();
	    var q = $("#orderQuantity").val();
	    var value1 = p*q*1000;
	    
	    var a = parseFloat(value1);
		 
	    $('#tradeValue').text(accounting.formatMoney(a));
	   	 
	}); 
	
	$('#inputBalanceId').on('change', function (e) {
	    var balanceId = this.value;
	    
	    $.ajax({
            url : '${pageContext.request.contextPath}/user/ajaxGetBalanceInfo',
            data : {
            	balanceId : balanceId
            },
            success : function(responseText) {
            	cash = parseFloat(responseText);
            	$('#balanceInfo').text("Sức mua: " + accounting.formatMoney(responseText));
                 
            }
        });
	   	 
	}); 

	
	$('#inputStockId').on('change', function (e) {
	    var stockId = this.value;
	    
	    $.ajax({
            url : '${pageContext.request.contextPath}/user/ajaxGetStockInfo',
            data : {
            	stockId : stockId
            },
            success : function(responseText) {
            	var tempArray = responseText.split("|");
            	priceBoard[0] = parseFloat(tempArray[0]);
            	priceBoard[1] = parseFloat(tempArray[1]);
            	priceBoard[2] = parseFloat(tempArray[2]);
            	
            	$('#p1').text("TC: "+tempArray[0]);
            	$('#p2').text("Trần: "+tempArray[1]);
            	$('#p3').text("Sàn: "+tempArray[2]);
            	$('#p4').text("Max: "+(cash/priceBoard[1]/1000).toFixed(0));
            }
        });
	   	 
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
			 
			
			var a = parseInt($(this).text());
			var str = accounting.formatMoney(a);
			$(this).text(str.substring(0, str.length - 2));
		})
	};

	$.fn.formatTime = function() {
		return this.each(function() {
			var a = ($(this).text());
			$(this).text(a.substring(10, 19) + " "+ a.substring(8, 10) + "/"+a.substring(5, 7)+"/"+a.substring(0, 4) );
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
