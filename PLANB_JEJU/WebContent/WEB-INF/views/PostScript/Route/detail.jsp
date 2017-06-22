<%--
@Project : PLANB_JEJU
@File name : detail.jsp 
@Author : 임정연 & 정다혜
@Data : 2017.06.16 & 2017.06.21
@Last Edit Data : 2017.06.21
@Desc : 루트 후기 게시판의 상세보기
--%>





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B JEJU - 후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<link rel="shortcut icon" href="favicon.ico">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="css/cs-select.css">
<link rel="stylesheet" href="css/cs-skin-border.css">

<link rel="stylesheet" href="css/style.css">

<script src="js/modernizr-2.6.2.min.js"></script>

<script src="${pageContext.request.contextPath}/js/postscript/postscript.js"></script>
</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>루트 후기 게시판</h3>
							<p>루트 후기 게시판입니다.</p>
						</div>
					</div>
					<div class="row row-bottom-padded-md">
						<%------------------------------제목 부분 ----------------------------------------%>
						<div class="col-md-12 animate-box">
							<h2 class="heading-title">${routePostscript.getRoutename()}</h2>
						</div>

						<%------------------------------이미지와 태그 부분 ----------------------------------------%>
						<div class="col-md-6 animate-box" align="center">
							<img class="img-responsive"
								src="../../images/PostScript/detail_Root.jpg" alt="travel">
							<a href="#" class="flight-book">
								<div class="plane-name">
									<span class="p-flight">태그</span>
								</div>
								<div class="desc">
									<div class="left">
										<span class="price" > <!-- <i class="icon-arrow-down22"></i> -->
											<span id="tag">
												${routePostscript.getComment()}
											</span>
										</span>
									</div>
								</div>
							</a>
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

							<%------------------------------찜콩, 히스토리, 목록으로 버튼 ----------------------------------------%>
							<br> <br> <br> <br>
							<div class="col-md-12 animate-box" align="center">

								<div class="blog-text">
									<div class="prod-title">
										<span class="comment" id="like" style="float:right;">
											<span id="likeChange_route">찜콩
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
									</div>
								</div>
								<br> 
								<input type="submit" value="히스토리" class="btn btn-primary">
							</div>

						</div>
						<br>
						<div align="right">
							<a href="PostScript_Board_Site.jsp">목록으로
								<i class="icon-arrow-right22"></i>
							</a>
						</div>

					</div>
				</div>
			</div>


		</div>


	</div>




	<!-- jQuery -->


	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/sticky.js"></script>

	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script src="js/classie.js"></script>
	<script src="js/selectFx.js"></script>

	<!-- Main JS -->
	<script src="js/main.js"></script>

</body>
</html>

