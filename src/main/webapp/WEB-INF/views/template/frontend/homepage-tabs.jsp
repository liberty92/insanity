<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="row" style="width: 100%; margin: auto">
	<div class="panel with-nav-tabs panel-default"
		style="border-radius: 0px; background: rgba(0, 0, 0, 0.3); border: none; margin-bottom: 19px">
		<div class="panel-heading"
			style="background: rgba(202, 202, 202, 0.67)">
			<ul class="nav nav-tabs" style="padding-bottom: 0px">
				<li class="active"><a href="#tab1default" data-toggle="tab"><span style="font-weight:bold;color:#0A4256">News</span>
						</a></li>
				<li><a href="#tab2default" data-toggle="tab"><span style="font-weight:bold;color:#0A4256">Market</span></a></li>
				<li><a href="#tab3default" data-toggle="tab"><span style="font-weight:bold;color:#0A4256">Announcement</span></a></li>
			</ul>
		</div>
		<div class="panel-body">
			<div class="tab-content">
				<div class="tab-pane fade in active" id="tab1default"
					style="max-height: 520">
					<!-- TAB PANEL STARTS -->
					<div class="row">
						<div class="row" style="margin: auto">
							<div class="col-sm-4 homepageTabImage">
								<img
									src="${pageContext.request.contextPath}/resources/images/core/tab4.png"
									alt="Image">
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
					style="min-height: 520px; max-height: 520">

					<!-- TAB PANEL STARTS -->
					<div class="row">
						<div class="row" style="margin: auto">
							<div class="col-sm-4 homepageTabImage">
								<img
									src="${pageContext.request.contextPath}/resources/images/core/tab3.png"
									alt="Image">
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
					style="min-height: 520px; max-height: 520">
					
					
					
						<!-- TAB PANEL STARTS -->
					<div class="row">
						<div class="row" style="margin: auto">
							<div class="col-sm-4 homepageTabImage">
								<img
									src="${pageContext.request.contextPath}/resources/images/core/tab2.png"
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