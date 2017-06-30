<%--
@Project : PLANB_JEJU
@File name :listBoard.jsp 
@Author : 임정연 & 정다혜
@Data : 2017.06.16 & 2017.06.20
@Last Edit Data : 2017.06.21
@Desc : 루트 후기 게시판의 리스트 (메인)
--%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B JEJU - 후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" /> -->
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


<script src="${pageContext.request.contextPath}/js/postscript/postscript.js"></script>

</head>

<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container" id="here">
				<%------------------------------후기 게시판의 header ----------------------------------------%>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>후기 게시판</h3>
							<p>루트 후기 게시판입니다.</p>
							<ul class="portfolio-filter" style='align:center'>
							<!--  -->
								<li>
									<a class="btn btn-default default active" href="${pageContext.request.contextPath}/PostScript/Route/List.do" data-filter=".a">루트 후기</a>
								</li>
								<li>
									<a class="btn btn-default" href="${pageContext.request.contextPath}/PostScript/Site/List.do" data-filter=".b">여행지 후기</a>
								</li>
							</ul>
						</div>
					</div>
					
					
					
					<%-----------------------------검색 부분 ----------------------------------------%>
					<form action="${pageContext.request.contextPath}/PostScript/Route/List.do">
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
							<c:forEach var="routePostscript" items="${routePostscriptList}">
								<div class="col-lg-4 col-md-4 col-sm-6" >
									<div class="fh5co-blog animate-box">
										<a href="${pageContext.request.contextPath}/PostScript/Route/Detail.do?route_postscript_rownum=${routePostscript.getRoute_postscript_rownum()}">
											<img class="img-responsive" src="${pageContext.request.contextPath}/images/PostScript/listBoard_Route.jpg" alt="">
										</a>
										<div class="blog-text" style="height:400px;">
											<div class="prod-title">
												<h3>
													<a href="${pageContext.request.contextPath}/PostScript/Route/Detail.do?route_postscript_rownum=${routePostscript.getRoute_postscript_rownum()}">${routePostscript.getRoutename()}</a>
												</h3>
												<span class="comment" id="like" style="float:right;">
													<span id="routeLikeChange">찜콩
														<c:choose>
															<c:when test="${routePostscript.getRoute_like()=='true'}">
																<img id="heart" src="${pageContext.request.contextPath}/images/PostScript/full_like.png" style="width:30px;height:30px;">
															</c:when>
															<c:otherwise>
																<img id="heart" src="${pageContext.request.contextPath}/images/PostScript/empty_like.png" style="width:30px;height:30px;">
															</c:otherwise>
														</c:choose>
													</span>
													<input type="hidden" id="route_postscript_rownum" value="${routePostscript.getRoute_postscript_rownum()}">
													<input type="hidden" id="route_like" value="${routePostscript.getRoute_like()}">
												</span>
												<span class="posted_by">${routePostscript.getUsername()}</span> 
												<span class="posted_by" style="float:right;">${routePostscript.getWritetime()}</span> 
												<span>
													<c:forEach var="postTag" items="${routePostscript.getRoutePostscriptTag()}">
														<a href="${pageContext.request.contextPath}/PostScript/Route/List.do?searchWord=${postTag.tag}">#${postTag.tag}</a>&nbsp;
													</c:forEach>
												</span>
												<p><a href="#">쪽지 쓰기</a></p>
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
	
	
	<button id="moveTopBtn">
		<img src="${pageContext.request.contextPath}/images/PostScript/btn_backtotop.png" style="width:80px;height:80px;" title="위로 가기">
	</button>
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

