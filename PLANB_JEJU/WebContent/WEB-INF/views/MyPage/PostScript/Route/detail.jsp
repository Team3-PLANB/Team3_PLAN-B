<%--
@Project : PLANB_JEJU
@File name : MyPage > PostScript > Route > detail.jsp 
@Author : 임정연 & 정다혜
@Date : 2017.06.16 & 2017.06.21
@Last Edit Date : 2017.07.02
@Desc : 마이페이지 > 나의 후기 > 나의 루트 후기 상세보기
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
<script src="${pageContext.request.contextPath}/js/postscript/postscript.js"></script>

<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>나의 루트 후기 게시판</h3>
						</div>
					</div>
					<div class="row row-bottom-padded-md">
						<%------------------------------제목 부분 ----------------------------------------%>
						<div class="col-md-12 animate-box">
							<h2 class="heading-title">${routePostscript.routename}</h2>
						</div>

						<%------------------------------이미지와 태그 부분 ----------------------------------------%>
						<div class="col-md-6 animate-box" align="center">
							<img class="img-responsive"	src="${pageContext.request.contextPath}/images/PostScript/detail_Root.jpg" alt="travel">
							<div class="flight-book">
								<div class="plane-name">
									<span class="p-flight">태그</span>
								</div>
								<div class="desc">
									<div class="left">
										<span class="price" > 
											<c:forEach var="postTag" items="${routePostscript.routePostscriptTag}">
												<a style="color:white;" href="${pageContext.request.contextPath}/MyPage/Like/Route/List.do?searchWord=${postTag.tag}">#${postTag.tag}</a>&nbsp;
											</c:forEach>
										</span>
									</div>
								</div>
							</div>
						</div>
						
						<%------------------------------후기글 부분 ----------------------------------------%>
						<div class="col-md-6 animate-box">
							<br>
							<div class="box-testimony animate-box">
								<blockquote>
									<span class="quote">
										<span>
											<i class="icon-quotes-left"></i>
										</span>
									</span>
									<span id="contentElement">
										${routePostscript.getComment()}
									</span>
									<span class="quote">
										<span>
											<i class="icon-quotes-right"></i>
										</span>
									</span>
								</blockquote>
							</div>

							<%------------------------------히스토리, 목록으로 버튼 ----------------------------------------%>
							<br> <br>
							<div class="col-md-12 animate-box" align="center">
								<div align="center">
									<a href="${pageContext.request.contextPath}/MyPage/PostScript/History/history.do?route_code=${routePostscript.route_code}" class="btn btn-primary">히스토리</a>
									<a href="List.do" class="btn btn-primary">목록으로<i class="icon-arrow-right22"></i></a>
								</div>
							</div>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>

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