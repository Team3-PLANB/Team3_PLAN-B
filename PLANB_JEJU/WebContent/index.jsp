<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLANB_JEJU</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" />
	<meta name="keywords"  />
	<meta name="author"/>

	<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">

	<!-- Animate.css -->
	<link rel="stylesheet" href="css/mainpage/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/mainpage/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/mainpage/bootstrap.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/mainpage/magnific-popup.css">
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/mainpage/owl.carousel.min.css">
	<link rel="stylesheet" href="css/mainpage/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/mainpage/style.css">
	<!-- Modernizr JS -->
	<script src="js//mainpage/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<div id="fh5co-logo">
							<a href="Index/main.do"><strong>Main</strong></a>
						</div>
					</div>
					<div class="col-xs-10 text-right menu-1"></div>
				</div>
			</div>
		</nav>

		<header id="fh5co-header" class="fh5co-cover" role="banner"
			style="background-image: url(images/MAIN.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1>PLAN'B JEJU</h1>
								<h2>낮코밤코</h2>
								<p>
									<a href="${pageContext.request.contextPath}/PLANA.make.do" class="btn btn-default btn-sm">일정 만들기</a>
									<a href="${pageContext.request.contextPath}/PostScript/Route/List.do" class="btn btn-default btn-sm">후기 게시판</a>
									<security:authorize access="!isAuthenticated()">
									<a href="${pageContext.request.contextPath}/LoginJoin/Join/NJoin.do" class="btn btn-default btn-sm">로그인/회원가입</a>
									</security:authorize>
									<security:authorize access="isAuthenticated()">
									<a href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do" class="btn btn-default btn-sm">마이 페이지</a>
			            			</security:authorize>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

	</div>

	<!-- jQuery -->
	<script src="js/mainpage/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/mainpage/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/mainpage/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/mainpage/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/mainpage/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/mainpage/jquery.countTo.js"></script>

	<!-- Stellar -->
	<script src="js/mainpage/jquery.stellar.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/mainpage/jquery.magnific-popup.min.js"></script>
	<script src="js/mainpage/magnific-popup-options.js"></script>

	<!-- // <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.js"></script> -->
	<script src="js/mainpage/simplyCountdown.js"></script>
	<!-- Main -->
	<script src="js/mainpage/main.js"></script>
</body>
</html>

