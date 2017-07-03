<%--
@Project : PLANB_JEJU
@File name : MyPage > Like > Site > listBoard.jsp 
@Author : 임정연 & 정다혜
@Date : 2017.06.16 & 2017.07.01
@Last Edit Date : 2017.07.01
@Desc : 마이페이지 > 찜한 후기 > 찜한 여행지 후기 리스트
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="no-js">

<link rel="shortcut icon" href="favicon.ico">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-skin-border.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/postscript.css">

<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mypage/like/like.js"></script>

<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<%------------------------------후기 게시판의 header ----------------------------------------%>
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>찜한 여행지 후기 게시판</h3>
							<ul class="portfolio-filter" align="center">
								<li>
									<a class="btn btn-default default" href="${pageContext.request.contextPath}/MyPage/Like/Route/List.do" data-filter=".a">
										찜한 루트 후기
									</a>
								</li>
								<li>
									<a class="btn btn-default active" href="${pageContext.request.contextPath}/MyPage/Like/Site/List.do" data-filter=".b">
										찜한 여행지 후기
									</a>
								</li>
							</ul>
						</div>
					</div>

					<%-----------------------------검색 부분 ----------------------------------------%>
					<form action="${pageContext.request.contextPath}/MyPage/Like/Site/List.do">
						<div class="row animate-box" align="right">
							<img src="${pageContext.request.contextPath}/images/PostScript/hash.png" style="margin-right:10px;">
							<input type="submit" style="margin-left:10px;float:right;" value="검색하기" class="btn btn-primary">
							<input type="text" style="width:200px;float:right;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" placeholder="검색할 태그">
						</div>
					</form>
					<br>

					<%------------------------------리스트 부분 ----------------------------------------%>
					<div class="container">
						<div class="row row-bottom-padded-md">
							<c:forEach var="sitePostscript" items="${sitePostscriptList}">
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="fh5co-blog animate-box">
										<a href="${pageContext.request.contextPath}/MyPage/Like/Site/Detail.do?site_postscript_rownum=${sitePostscript.getSite_postscript_rownum()}">
											<img class="img-responsive" src="${pageContext.request.contextPath}/images/PostScript/listBoard_Site.jpg" alt="">
										</a>
										<div class="blog-text" style="height:400px;">
											<div class="prod-title">
												<h3>
													<a href="${pageContext.request.contextPath}/MyPage/Like/Site/Detail.do?site_postscript_rownum=${sitePostscript.getSite_postscript_rownum()}">${sitePostscript.getSite()}</a>
												</h3>
												<span class="comment" id="like" style="float:right;">
													<span>찜콩
														<img id="heart" onclick="siteLikeChange(this)" src="${pageContext.request.contextPath}/images/PostScript/full_like.png" style="width:30px;height:30px;">
														<input type="hidden" id="site_postscript_rownum" value="${sitePostscript.site_postscript_rownum}">
														<input type="hidden" id="site_like" value="${sitePostscript.site_like}">
													</span>
												</span>
												<span class="posted_by">${sitePostscript.getUsername()}</span> 
												<span class="posted_by" style="float:right;">${sitePostscript.writetime}</span> 
												<span style="width:100%">
													<c:forEach var="postTag" items="${sitePostscript.sitePostscriptTag}">
														<a href="${pageContext.request.contextPath}/MyPage/Like/Site/List.do?searchWord=${postTag.tag}">#${postTag.tag}</a>&nbsp;
													</c:forEach>
												</span>
												<span id="contentElement">
												</span>
												
											</div>
										</div>
									</div>
								</div>
							</c:forEach>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END fh5co-page -->
	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/sticky.js"></script>
	<!-- Stellar -->
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
	<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script src="${pageContext.request.contextPath}/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/selectFx.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>

