<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/MegaNavbar.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/navbar-inverse.css"/>

<div class="container-fluid maxHeight50"
	style="padding: 0px !important;">
	<nav class="navbar navbar-inverse no-border-radius maxHeight50"
		style=" ; border-bottom-width: 0px; margin-bottom: 0px; border-top-width: 0px;"
		id="main_navbar" role="navigation">
		<div class="container-fluid maxHeight50" style="padding-left:0px">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header maxHeight50" style=" ">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<%-- <a class="navbar-brand" href="${pageContext.request.contextPath}" 
				 style="  padding-top: 0px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px; "> --%>
				<a class="navbar-brand" href="http://www.nth7.com"  
				style="  padding-top: 0px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px; ">
					<!-- <i class="fa fa-home"></i>
					<span style="font-size: 12">HOME</span> -->
					<img src="${pageContext.request.contextPath}/resources/images/core/logo.png" height="48px"  />
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse maxHeight50" style=" " id="navbar-collapse-1">
				<%-- 
				<!-- regular link -->
				<a href="#" class="navbar-link navbar-left">
					<i class="fa fa-link"></i>&nbsp;
					<span class="hidden-sm hidden-md">Link</span>
				</a> 
				--%>
				<%-- LEFT MENU --%>
				<ul class="nav navbar-nav navbar-left maxHeight50" style="padding-bottom: 0px; padding-top: 0px;">
					<!-- divider -->
					<li class="divider"></li>
					<!-- 1. TRADING -->
					<li class="dropdown-short">
						<a data-toggle="dropdown" href="{pageContext.request.contextPath}/trading" class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-connectdevelop"></i>&nbsp;
							<span class="hidden-sm">Giao dịch trực tuyến</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:300px">
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/user/trading">
									Giao dịch chứng khoán
									<span class="desc">
									Đặt lệnh giao dịch trực tuyến
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/user/balance">
									Quản lý tài khoản
									<span class="desc">
									Quản lý hiệu quả đầu tư danh mục
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/user/tradingHistory">
									Lịch sử đặt lệnh
									<span class="desc">
									Lịch sử chi tiết các lệnh giao dịch
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/user/marginStats">
									Thống kê margin
									<span class="desc">
									Thống kê sử dụng dịch vụ cho vay ký quỹ
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/user/tradingAndTaxFee">
									Thống kê thuế & phí giao dịch
									<span class="desc">
									Thống kê phí giao dịch, thuế bán và các dịch vụ khác
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
						</ul>
					</li>
					<!-- divider -->
					<li class="divider"></li>
					
					
					<!-- 2. NEWS -->
					<li class="dropdown-short">
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/listArticle/news" 
						ondblclick="location.href ='${pageContext.request.contextPath}/listArticle/news';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-newspaper-o"></i>&nbsp;
							<span class="hidden-sm">Tin tức</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:350px"> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/news">
									Tất cả tin tức
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/news_enterprise">
									Tin doanh nghiệp
									<span class="desc">
									Tin tức liên quan đến các doanh nghiệp đang niêm yết
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/news_finance_banking">
									Tài chính ngân hàng
									<span class="desc">
									Tin tức tài chính ngân hàng
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/news_real_estate">
									Bất động sản
									<span class="desc">
									Tin tức bất động sản
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/news_goods_materials">
									Hàng hóa - nguyên liệu
									<span class="desc">
									Tin tức hàng hóa nguyên liệu
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/news_macroeconomics">
									Kinh tế vĩ mô
									<span class="desc">
									Tin tức kinh tế vĩ mô
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/news_international">
									Tin quốc tế
									<span class="desc">
									Tin tức kinh tế thế giới
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
						</ul>
					</li>
					<!-- divider -->
					<li class="divider"></li>
					
					<!-- 3. ANNOUCEMENT -->
					<li class="dropdown-short">
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/listArticle/market" 
						ondblclick="location.href ='${pageContext.request.contextPath}/listArticle/market';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-binoculars"></i>&nbsp;
							<span class="hidden-sm">Thông tin thị trường</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:300px">
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/market">
									Thông tin thị trường
									</a>
								</p>
							</li>
							<li class="divider"></li>
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/market_general">
									Tổng quan thị trường
									<span class="desc">
									Báo cáo tổng quan thị trường
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/market_trading_results">
									Kết quả giao dịch
									<span class="desc">
									Báo cáo kết quả giao dịch
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/market_foreign_results">
									Giao dịch khối ngoại 
									<span class="desc">
									Báo cáo kết quả giao dịch khối ngoại
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
						</ul>
					</li>
					<!-- divider -->
					<li class="divider"></li>
					
					<!-- 3. ANALYSIS CENTER -->
					<li class="dropdown-short">
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/listArticle/analyze" 
						ondblclick="location.href ='${pageContext.request.contextPath}/listArticle/analyze';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-bar-chart"></i>&nbsp;
							<span class="hidden-sm">Phân tích</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:300px">
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/analyze">
									Phân tích kỹ thuật
									</a>
								</p>
							</li>
							<li class="divider"></li>
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/analyze_technical_chart">
									Biểu đồ kỹ thuật
									<span class="desc">
									Biểu đồ kỹ thuật
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/analyze_portfolio">
									Danh mục đầu tư
									<span class="desc">
									Các danh mục đầu tư được khuyến nghị
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/analyze_recommended_stock">
									Cổ phiếu khuyến nghị
									<span class="desc">
									Các mã cổ phiếu được khuyến nghị
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
						</ul>
					</li>
					<!-- divider -->
					<li class="divider"></li>
					
					<!-- 4. ANNOUCEMENT -->
					<li class="dropdown-short">
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/listArticle/announcement" 
						ondblclick="location.href ='${pageContext.request.contextPath}/listArticle/announcement';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-flag"></i>&nbsp;
							<span class="hidden-sm">Thông báo</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:300px">
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/announcement">
									Tất cả  thông báo 
									</a>
								</p>
							</li>
							<li class="divider"></li>
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/announcement_common">
									Thông báo chung
									<span class="desc">
									Thông báo chung
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="http://www.nth7.com/viewArticle/80">
									Giới thiệu về INSANITY
									<span class="desc">
									Giới thiệu về INSANITY
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
						<%-- 	
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/announcement_contest">
									Các cuộc thi đang diễn ra
									<span class="desc">
									Currently running contests
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> --%>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/listArticle/announcement_recruitment">
									Tuyển dụng
									<span class="desc">
									Thông báo tuyển dụng
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
						</ul>
					</li>
					<!-- divider -->
					<li class="divider"></li>
 
				</ul>
				<%-- RIGHT MENU --%>
				<ul class="nav navbar-nav navbar-right" style="padding-bottom: 0px; padding-top: 0px;">
					<!-- search form -->
					<form method="POST" action="${pageContext.request.contextPath}/searchArticle" class="navbar-form-expanded navbar-form navbar-left visible-lg-block visible-md-block visible-xs-block" style="padding-right:0px" role="search">
						<div class="input-group">
							<input type="text" class="form-control" data-width="80px" data-width-expanded="170px" placeholder="Search..." name="articleTitle">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="fa fa-search"></i>&nbsp;
								</button>
							</span>
						</div>
					</form>
					
					<!-- 5. ACCOUNT -->
                        <li class="dropdown-grid">
                            <a data-toggle="dropdown" href="javascript:;" class="dropdown-toggle">
                            <i class="fa fa-lock"></i>&nbsp;
                            <c:if test="${empty sessionScope.userFullName}">
                            Đăng nhập
                            </c:if>
                            <span class="hidden-sm"><c:out value="${sessionScope.userFullName}"/></span>
                            <span class="caret"></span>
                            </a>
                            <div class="dropdown-grid-wrapper" role="menu">
                                <ul class="dropdown-menu col-xs-12 col-sm-10 col-md-8 col-lg-7">
                                    <li>
                                    
                                    <c:if test="${empty sessionScope.userFullName}">
                                        <div id="carousel-example-account" class="carousel slide">
                                            <div class="row">
                                                <div class="col-lg-8 col-md-8 col-sm-8">
                                                    <div class="carousel-inner">
                                                        <div class="item active">
                                                            <h3 class="text-right" style="padding-top:0px; border-bottom: 1px solid #555;"><i class="fa fa-lock"></i> Đăng nhập </h3>
                                                            <br>
                                                            <form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/authentication">
                                                                <div class="form-group">
                                                                    <label for="inputEmail3" class="col-sm-4 control-label">Tên đăng nhập</label>
                                                                    <div class="col-sm-8"><input type="text" name="username" class="input-sm form-control" id="inputEmail3" placeholder="Email" autocomplete="off"></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-4 control-label">Mật khẩu</label>
                                                                    <div class="col-sm-8"><input type="password" name="password" class="input-sm form-control" id="inputPassword3" placeholder="Password" autocomplete="off"></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-sm-offset-3 col-sm-9">
                                                                        <button class="btn btn-default pull-right" type="submit"><i class="fa fa-unlock-alt"></i> Đăng nhập </button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4" style="border-left: 1px solid #555;">
                                                    <ol class="carousel-indicators navbar-carousel-indicators" style="">
                                                       <%--  
                                                       <li data-target="#carousel-example-account" data-slide-to="0" class="active"><a href="${pageContext.request.contextPath}/login" class="">Đăng nhập<span class="desc">Already have an account? Log in</span></a></li>
                                                        --%>
                                                        <li data-target="#carousel-example-account" data-slide-to="1" class="">
                                                        	<a href="${pageContext.request.contextPath}/register" class="" onclick="location.href ='${pageContext.request.contextPath}/register';">Đăng ký<span class="desc">Tạo tài khoản mới</span></a>
                                                       	</li>
                                                        <li data-target="#carousel-example-account" data-slide-to="2" class=""><a href="${pageContext.request.contextPath}/register" class="" onclick="location.href ='${pageContext.request.contextPath}/register';">Quên mật khẩu<span class="desc">Khôi phục mật khẩu</span></a></li>
                                                        <li data-target="#carousel-example-account" data-slide-to="3" class=""><a href="${pageContext.request.contextPath}/register" class="" onclick="location.href ='${pageContext.request.contextPath}/register';">Feedback<span class="desc">Gửi feedback cho chúng tôi</span></a></li>
                                                        <li data-target="" data-slide-to="3" class="">
                                                        	<a href="${pageContext.request.contextPath}/changeTheme" class="" onclick="location.href ='${pageContext.request.contextPath}/changeTheme';">Đổi giao diện<span class="desc">Thay đổi chủ đề website</span></a>
                                                       	</li>
                                                    </ol>
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
                                        <c:if test="${!empty sessionScope.userFullName}">
                                        
                                              <div id="carousel-example-account" class="carousel slide">
                                            <div class="row">
                                                <div class="col-lg-8 col-md-8 col-sm-8">
                                                    <div class="carousel-inner">
                                                        <div class="item active">
                                                            <h3 class="text-right" style="padding-top:0px; border-bottom: 1px solid #555;"><i class="fa fa-user"></i> ${sessionScope.userFullName}</h3>
                                                            <br>
                                                            <c:if test="${!empty sessionScope.userProfilePicture}">
                                                            <img src="${sessionScope.userProfilePicture}" class="img-responsible" style="max-height:300px; float:right"/>
                                                            </c:if>
                                                            <c:if test="${empty sessionScope.userProfilePicture}">
                                                            <img src="${pageContext.request.contextPath}/resources/images/core/defaultProfilePicture.jpg" class="img-responsible" />
                                                            </c:if>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4" style="float:right">
	                                                <ol class="carousel-indicators navbar-carousel-indicators" style="">
	                                                    <li data-target="#carousel-example-account" data-slide-to="0" class="active"><a href="${pageContext.request.contextPath}/logout" class="" onclick="location.href ='${pageContext.request.contextPath}/logout';">Đăng xuất<span class="desc">Log out</span></a></li>
	                                                    
	                                                    <li data-target="#carousel-example-account" data-slide-to="1" class="">
	                                                    
	                                                    	<a href="${pageContext.request.contextPath}/user/Info" class="" onclick="location.href ='${pageContext.request.contextPath}/user/Info';">
	                                                    
	                                                    	Thông tin cá nhân<span class="desc">Cập nhật thông tin cá nhân</span>
	                                                    	</a>
                                                    	</li>
	                                                    
	                                                    
	                                                    <li data-target="#carousel-example-account" data-slide-to="2" class=""><a href="${pageContext.request.contextPath}/user/Info" class="">Đổi mật khẩu<span class="desc">Thay đổi mật khẩu</span></a></li>
	                                                    <li data-target="#carousel-example-account" data-slide-to="3" class=""><a href="${pageContext.request.contextPath}/user/Info" class="">Feedback<span class="desc">Gửi feedback cho chúng tôi</span></a></li>
	                                                    <li data-target="" data-slide-to="3" class="">
                                                        	<a href="${pageContext.request.contextPath}/changeTheme" class="" onclick="location.href ='${pageContext.request.contextPath}/changeTheme';">Đổi giao diện<span class="desc">Change UI theme</span></a>
                                                       	</li>
	                                                </ol>
                                            </div>
                                            </div>
                                        </div>
                                        
                                        </c:if>
                                        
                                    </li>
                                </ul>
                            </div>
                        </li>
                        
                        
                        
                        
                        
				</ul>
			</div>
		</div>
	</nav>
</div>

<script>
	//Start Fix MegaNavbar on scroll page
	var navHeight = $('#main_navbar').offset().top;
	FixMegaNavbar(navHeight);
	$(window).bind('scroll', function() {
		FixMegaNavbar(navHeight);
	});

	function FixMegaNavbar(navHeight) {
		if (!$('#main_navbar').hasClass('navbar-fixed-bottom')) {
			if ($(window).scrollTop() > navHeight) {
				$('#main_navbar').addClass('navbar-fixed-top')
				$('body').css({
					'margin-top' : $('#main_navbar').height() + 'px'
				});
				if ($('#main_navbar').parent('div').hasClass('container'))
					$('#main_navbar').children('div').addClass('container')
							.removeClass('container-fluid');
				else if ($('#main_navbar').parent('div').hasClass(
						'container-fluid'))
					$('#main_navbar').children('div').addClass(
							'container-fluid').removeClass('container');
			} else {
				$('#main_navbar').removeClass('navbar-fixed-top');
				$('#main_navbar').children('div').addClass('container-fluid')
						.removeClass('container');
				$('body').css({
					'margin-top' : ''
				});
			}
		}
	}
	//Start Fix MegaNavbar on scroll page

	//Start Fix MegaNavbar on scroll page
	var tocHeight = $('#Table_of_Contents').offset().top;
	FixTOC(tocHeight);
	$(window).bind('scroll', function() {
		FixTOC(tocHeight);
	});

	function FixTOC(tocHeight) {

		if ($(window).scrollTop() > (tocHeight - 75)) {
			$('#Table_of_Contents').css({
				'position' : 'relative',
				'top' : (($(window).scrollTop() - tocHeight) + 90) + "px",
				'right' : 'auto'
			});
		} else {
			$('#Table_of_Contents').css({
				'position' : 'relative',
				'top' : '0px',
				'right' : 'auto'
			});
		}
	}
	//Start Fix MegaNavbar on scroll page

	//Next code used to prevent unexpected menu close when using some components (like accordion, tabs, forms, etc), please add the next JavaScript to your page
	$(window).load(function() {
		$(document).on('click', '.navbar .dropdown-menu', function(e) {
			e.stopPropagation();
		});
	});

	/*SCROLL PAGE TO TOP*/
	$(document).ready(function() {
		$(".toTop").css("display", "none");

		$(window).scroll(function() {
			if ($(window).scrollTop() > 0) {
				$(".toTop").fadeIn("slow");
			} else {
				$(".toTop").fadeOut("slow");
			}
		});

		$(".toTop").click(function() {
			event.preventDefault();
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
		});
	});
</script>
</body>
</html>