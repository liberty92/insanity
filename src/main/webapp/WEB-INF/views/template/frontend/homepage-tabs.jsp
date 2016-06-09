<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="row" style="width: 100%; margin: auto">
	<div class="panel with-nav-tabs panel-default"
		style="border-radius: 0px; background: rgba(0, 0, 0, 0.3); border: none; margin-bottom: 17px">
		<div class="panel-heading"
			style="background: rgba(202, 202, 202, 0.67)">
			<ul class="nav nav-tabs" style="padding-bottom: 0px">
				<li class="active"><a href="#tab1default" data-toggle="tab"><span style="font-weight:bold;color:#0A4256">Tin tức</span>
						</a></li>
				<li><a href="#tab2default" data-toggle="tab"><span style="font-weight:bold;color:#0A4256">Thị trường</span></a></li>
				<li><a href="#tab3default" data-toggle="tab"><span style="font-weight:bold;color:#0A4256">Thông báo</span></a></li>
			</ul>
		</div>
		<div class="panel-body">
			<div class="tab-content">
				<div class="tab-pane fade in active" id="tab1default"
					style="max-height: 520">
					<!-- TAB PANEL STARTS -->
					<div class="row">
						<div class="row" style="margin: auto">
							<div class="col-sm-4 homepageTabImage" >
							
							
							
							
	<div class="col-xs-12" style="background:#F6F6F6; height:470px; overflow:hidden; padding:0px">
								
		<h4 class="Header" style="padding:0px 10px;">
			<a>Biểu đồ thị trường</a>
		</h4>
	<div class="col-xs-12" style="position:relative;overflow:hidden; background:#fff">
	
	<div style="position:absolute; top:0px;right:0px; width:100px; height:50px; z-index:99999; background: rgba(0,0,0,0.0)">&nbsp;</div>
		<iframe width="700px" style="margin:auto;position:relative; left:-30px; height:230px; padding:3px 0px" class="" scrolling="no" frameborder="3px"  src="http://tcsc.vn:8080/TCSCIframe/chart/hcmchart#hnxindex" frameborder="0" allowfullscreen="1"></iframe>
		
		<iframe height="220px" class="img-responsive" scrolling="no" frameborder="0" id="iframeGiaVang" 
		src="http://giavang.doji.vn/sites/default/files/bieudo/tabs.html?t=0.396166338986611"></iframe>
		
		<!-- <iframe width="700px" style="margin:auto;position:relative; left:-408px; 
		height:230px; padding:3px 0px" class="" scrolling="no" frameborder="3px"  
		src="http://tcsc.vn:8080/TCSCIframe/chart/hcmchart#hnxindex"
		 frameborder="0" allowfullscreen="1"></iframe> -->
	</div>
	</div>
	
							
							<%-- 
							
								<img src="${pageContext.request.contextPath}/resources/images/core/tab4.png" alt="Image">
									 --%>
									
									
									
									
							</div>
							
							
							
							
							<div class="col-sm-8 homepageTabArticle">

								<!-- ARTICLE STARTS -->

								<ul class="Post-list Justify-list"
									style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px">
									<c:if test="${!empty listArticles}">
										<c:forEach items="${listArticles}" var="a" varStatus="loop">
											<c:if test="${a.articleTypeId.startsWith('news')}">
												<div class="Article-item clearfix">
													<a
														href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
														method="get" class="Thumb nailthumb-container"
														style="overflow: hidden; padding: 0px; width: 180px; height: 130px;">
														<img class="Thumb2" src="${a.articleImage}"
														style="width: 100%; height: 100%;">
													</a>
													<div class="Info">
														<a
															href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
															method="get"><span
															style="color: #00AEEF; font-size: 16px; font-weight: bold">${a.articleTitle}</span>
														</a> <br /><span style="color: grey">${a.articlePublicationTime}</span>
														<p style="text-align: justify; color: white">
															${a.articleSummary}</p>
													</div>
												</div>
												<br />
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
								<!-- ARTICLE ENDS -->


							</div>
						</div>
					</div>
					<!-- TAB PANEL ENDS -->
				</div>
				<!-- TAB 2 -->
				<div class="tab-pane fade" id="tab2default"
					style="min-height: 489px; max-height: 520">

					<!-- TAB PANEL STARTS -->
					<div class="row">
						<div class="row" style="margin: auto">
						
						
							<div class="col-sm-4 homepageTabImage">
							<iframe frameborder="0" scrolling="no" height="132" width="333" allowtransparency="true" marginwidth="0" marginheight="0" src="http://fxrates.investing.com/index_single_crosses.php?currency=87&header-text-color=%23FFFFFF&curr-name-color=%230059b0&inner-text-color=%23000000&green-text-color=%232A8215&green-background=%23B7F4C2&red-text-color=%23DC0001&red-background=%23FFE2E2&inner-border-color=%23CBCBCB&border-color=%23cbcbcb&bg1=%23F6F6F6&bg2=%23ffffff&bid=hide;&ask=hide;&last=hide&open=show&high=show&low=show&change=hide&change_in_percents=show&last_update=hide"></iframe>
							
  <iframe frameborder="0" scrolling="no" height="350" width="333" allowtransparency="true" marginwidth="0" marginheight="0" src="http://fxrates.investing.com/index.php?force_lang=1&pairs_ids=1565;1715;1803;142;1896;1910;2214;1;3;2;7;9;5;8;6;11;15;55;42;155;43;54;&header-text-color=%23FFFFFF&curr-name-color=%230059b0&inner-text-color=%23000000&green-text-color=%232A8215&green-background=%23B7F4C2&red-text-color=%23DC0001&red-background=%23FFE2E2&inner-border-color=%23CBCBCB&border-color=%23cbcbcb&bg1=%23F6F6F6&bg2=%23ffffff&bid=hide&ask=hide&last=hide&change=hide&last_update=hide"></iframe> 
							
							
							
							<%-- 	<img
									src="${pageContext.request.contextPath}/resources/images/core/tab4.png"
									alt="Image">
									 --%>
									
									
							</div>
							
							
							
							<div class="col-sm-8 homepageTabArticle">

								<!-- ARTICLE STARTS -->

								<ul class="Post-list Justify-list"
									style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px">
									<c:if test="${!empty listArticles}">
										<c:forEach items="${listArticles}" var="a" varStatus="loop">
										<c:if test="${a.articleTypeId.startsWith('market')}">
												<div class="Article-item clearfix">
													<a
														href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
														method="get" class="Thumb nailthumb-container"
														style="overflow: hidden; padding: 0px; width: 180px; height: 130px;">
														<img class="Thumb2" src="${a.articleImage}"
														style="width: 100%; height: 100%;">
													</a>
													<div class="Info">
														<a
															href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
															method="get"><span
															style="color: #00AEEF; font-size: 16px; font-weight: bold">${a.articleTitle}</span><br />${a.articlePublicationTime}
														</a>
														<p style="text-align: justify; color: white">
															${a.articleSummary}</p>
													</div>
												</div>
												<br />
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
								<!-- ARTICLE ENDS -->


							</div>
						</div>
					</div>
					<!-- TAB PANEL ENDS -->

				</div>
				<!-- TAB 3 -->
				<div class="tab-pane fade" id="tab3default"
					style="min-height: 489px; max-height: 520">
					
					
					
						<!-- TAB PANEL STARTS -->
					<div class="row">
						<div class="row" style="margin: auto">
							<div class="col-sm-4 homepageTabImage">
								<%-- <img
									src="${pageContext.request.contextPath}/resources/images/core/tab3.png"
									alt="Image"> --%>
									
									
									  <iframe frameborder="0" scrolling="no" height="380" width="300" allowtransparency="true" marginwidth="0" marginheight="0" src="http://tools.investing.com/market_quotes.php?tabs=3,2,4,1&tab_1=1,2,3,6,7,9,11,1893,2111&tab_2=27,166,167,170,172,174,177,179,40830&tab_3=8830,8831,8833,8836,8848,8849,8861,8862,8910&tab_4=8880,8907,8900,8899,8886,8895,8905,8906,8986&select_color=000000&default_color=0059b0"></iframe>
						
						<img style="width:300px; height:100px"
									src="${pageContext.request.contextPath}/resources/images/core/banner8.jpg"
									alt="Image"> 
						
							</div>
							<div class="col-sm-8 homepageTabArticle">

								<!-- ARTICLE STARTS -->

								<ul class="Post-list Justify-list"
									style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px">
									<c:if test="${!empty listArticles}">
										<c:forEach items="${listArticles}" var="a" varStatus="loop">
										<c:if test="${a.articleTypeId.startsWith('announcement')}">
												<div class="Article-item clearfix">
													<a
														href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
														method="get" class="Thumb nailthumb-container"
														style="overflow: hidden; padding: 0px; width: 180px; height: 130px;">
														<img class="Thumb2" src="${a.articleImage}"
														style="width: 100%; height: 100%;">
													</a>
													<div class="Info">
														<a
															href="${pageContext.request.contextPath}/viewArticle/${a.articleId}"
															method="get"><span
															style="color: #00AEEF; font-size: 16px; font-weight: bold">${a.articleTitle}</span><br />${a.articlePublicationTime}
														</a>
														<p style="text-align: justify; color: white">
															${a.articleSummary}</p>
													</div>
												</div>
												<br />
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
								<!-- ARTICLE ENDS -->


							</div>
						</div>
					</div>
					<!-- TAB PANEL ENDS -->
					
					
					
					
					</div>
			</div>
		</div>
	</div>
</div>