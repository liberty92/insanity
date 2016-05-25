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
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/admin" class="dropdown-toggle"
						ondblclick="location.href ='${pageContext.request.contextPath}/admin';"
						 aria-expanded="true">
							<i class="fa fa-connectdevelop"></i>&nbsp;
							<span class="hidden-sm">Dashboard</span> 
							<span class="caret"></span>
						</a>
						
						
							<ul class="dropdown-menu" style="min-width:350px"> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin">
									Dashboard controller
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/user">
									User
									<span class="desc">
									<span style="color:red">Core engine</span> - Core engine
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/userRole">
									User role
									<span class="desc">
									<span style="color:red">Core engine</span> - User role
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/balance">
									Balance
									<span class="desc">
									<span style="color:red">Core engine</span> - Balance
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/portfolio">
									Portfolio
									<span class="desc">
									<span style="color:red">Core engine</span> - Portfolio
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/company">
									Company
									<span class="desc">
									<span style="color:red">Core engine</span> - Company
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/companyCategory">
									Company category
									<span class="desc">
									<span style="color:red">Core engine</span> - Company category
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/stock">
									Stock
									<span class="desc">
									<span style="color:red">Core engine</span> - Stock
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/priceBoard">
									Price board
									<span class="desc">
									<span style="color:red">Core engine</span> - Price board
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/core/orders">
									Orders
									<span class="desc">
									<span style="color:red">Core engine</span> - Orders
									</span>
									</a>
								</p>
							</li>
							
						 
							
							
						</ul>

					
					</li>
					<!-- divider -->
					<li class="divider"></li>
					
					
					<!-- 2. NEWS -->
					<li class="dropdown-short">
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/admin/listArticle/news" 
						ondblclick="location.href ='${pageContext.request.contextPath}/admin/listArticle/news';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-newspaper-o"></i>&nbsp;
							<span class="hidden-sm">Tin tức</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:350px"> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/news">
									Tất cả tin tức
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/news_enterprise">
									Tin doanh nghiệp
									<span class="desc">
									News from companies being listed on the stock exchange
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/news_finance_banking">
									Tài chính ngân hàng
									<span class="desc">
									Finance and banking latest news
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/news_real_estate">
									Bất động sản
									<span class="desc">
									Real estate latest news
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/news_goods_materials">
									Hàng hóa - nguyên liệu
									<span class="desc">
									Goods and marterials latest new
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/news_macroeconomics">
									Kinh tế vĩ mô
									<span class="desc">
									Macroeconomics latest new
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/news_international">
									Tin quốc tế
									<span class="desc">
									International latest new
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
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/admin/listArticle/market" 
						ondblclick="location.href ='${pageContext.request.contextPath}/admin/listArticle/market';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-binoculars"></i>&nbsp;
							<c:if test="${empty sessionScope.userFullName}">
								<span class="hidden-sm">Thông tin thị trường</span>
							</c:if>
							<c:if test="${!empty sessionScope.userFullName}">
								<span class="hidden-sm">Thị trường</span>
							</c:if>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:300px">
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/market">
									Thông tin thị trường
									</a>
								</p>
							</li>
							<li class="divider"></li>
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/market_general">
									Tổng quan thị trường
									<span class="desc">
									General market report
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/market_trading_results">
									Kết quả giao dịch
									<span class="desc">
									Trading results statistic
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li> 
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/market_foreign_results">
									Giao dịch khối ngoại 
									<span class="desc">
									Foreign group trading results
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
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/admin/listArticle/analyze" 
						ondblclick="location.href ='${pageContext.request.contextPath}/admin/listArticle/analyze';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-bar-chart"></i>&nbsp;
							<span class="hidden-sm">Phân tích</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:300px">
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/analyze">
									Phân tích kỹ thuật
									</a>
								</p>
							</li>
							<li class="divider"></li>
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/analyze_technical_chart">
									Biểu đồ kỹ thuật
									<span class="desc">
									Technical chart
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/analyze_portfolio">
									Danh mục đầu tư
									<span class="desc">
									Investment portfolios
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/analyze_recommended_stock">
									Cổ phiếu khuyến nghị
									<span class="desc">
									Recommended stocks
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
						<a data-toggle="dropdown" href="${pageContext.request.contextPath}/admin/listArticle/announcement" 
						ondblclick="location.href ='${pageContext.request.contextPath}/admin/listArticle/announcement';"
						class="dropdown-toggle" aria-expanded="true">
							<i class="fa fa-flag"></i>&nbsp;
							<span class="hidden-sm">Thông báo</span>
							<span class="caret"></span>
						</a>

						<ul class="dropdown-menu" style="min-width:300px">
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/announcement">
									Tất cả  thông báo 
									</a>
								</p>
							</li>
							<li class="divider"></li>
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/announcement_common">
									Thông báo chung
									<span class="desc">
									Common announcement
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/announcement_insanity">
									Giới thiệu về INSANITY
									<span class="desc">
									About INSANITY
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/announcement_contest">
									Các cuộc thi đang diễn ra
									<span class="desc">
									Currently running contests
									</span>
									</a>
								</p>
							</li>
							<li class="divider"></li>
							
							<li>
								<p>
									<a href="${pageContext.request.contextPath}/admin/listArticle/announcement_recruitment">
									Tuyển dụng
									<span class="desc">
									Recruitment
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
					<form method="POST" action="${pageContext.request.contextPath}/admin/searchArticle" class="navbar-form-expanded navbar-form navbar-left visible-lg-block visible-md-block visible-xs-block" style="padding-right:0px" role="search">
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
                                                                    <label for="inputEmail3" class="col-sm-3 control-label">Username</label>
                                                                    <div class="col-sm-9"><input type="text" name="username" class="input-sm form-control" id="inputEmail3" placeholder="Email" autocomplete="off"></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
                                                                    <div class="col-sm-9"><input type="password" name="password" class="input-sm form-control" id="inputPassword3" placeholder="Password" autocomplete="off"></div>
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
                                                        <li data-target="#carousel-example-account" data-slide-to="0" class="active"><a href="#" class="">Đăng nhập<span class="desc">Already have an account? Log in</span></a></li>
                                                        <li data-target="#carousel-example-account" data-slide-to="1" class=""><a href="#" class="">Đăng ký<span class="desc">Create new account</span></a></li>
                                                        <li data-target="#carousel-example-account" data-slide-to="2" class=""><a href="#" class="">Quên ID?<span class="desc">No problem, we can remind you by email</span></a></li>
                                                        <li data-target="#carousel-example-account" data-slide-to="3" class=""><a href="#" class="">Quên password?<span class="desc">Don't worry, it happens!</span></a></li>
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
                                                            <img src="${sessionScope.userProfilePicture}" class="img-responsible" />
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
	                                                    <li data-target="#carousel-example-account" data-slide-to="1" class=""><a href="#" class="">Thông tin cá nhân<span class="desc">Cập nhật thông tin cá nhân</span></a></li>
	                                                    <li data-target="#carousel-example-account" data-slide-to="2" class=""><a href="#" class="">Đổi mật khẩu<span class="desc">Thay đổi mật khẩu</span></a></li>
	                                                    <li data-target="#carousel-example-account" data-slide-to="3" class=""><a href="#" class="">Feedback<span class="desc">Gửi feedback cho chúng tôi</span></a></li>
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