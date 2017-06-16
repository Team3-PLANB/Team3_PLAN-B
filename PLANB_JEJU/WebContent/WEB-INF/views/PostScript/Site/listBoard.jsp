<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B JEJU - 후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="css/superfish.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
<!-- CS Select -->
<link rel="stylesheet" href="css/cs-select.css">
<link rel="stylesheet" href="css/cs-skin-border.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/postscript.css">


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">

			<!-- START : a href 걸기-->

			타일 확인 링크 <a
				href="${pageContext.request.contextPath}/LoginJoin/Join/NJoin.do">LoginJoin/Join/NJoin.do</a>

			<!-- END : a href 걸기 -->


			<header id="fh5co-header-section" class="sticky-banner">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
						<h1 id="fh5co-logo">
							<a href="index.html"><i class="icon-airplane"></i>Travel</a>
						</h1>
						<!-- START #fh5co-menu-wrap -->
						<nav id="fh5co-menu-wrap" role="navigation">
							<ul class="sf-menu" id="fh5co-primary-menu">
								<li class="active"><a href="index.html">Home</a></li>
								<li><a href="vacation.html" class="fh5co-sub-ddown">Vacations</a>
									<ul class="fh5co-sub-menu">
										<li><a href="#">Family</a></li>
										<li><a href="#">CSS3 &amp; HTML5</a></li>
										<li><a href="#">Angular JS</a></li>
										<li><a href="#">Node JS</a></li>
										<li><a href="#">Django &amp; Python</a></li>
									</ul></li>
								<li><a href="flight.html">Flights</a></li>
								<li><a href="hotel.html">Hotel</a></li>
								<li><a href="car.html">Car</a></li>
								<li><a href="blog.html">Blog</a></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</header>

			<!-- end:header-top -->



			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>후기 게시판</h3>
							<p>여행지 후기 게시판입니다.</p>
							<ul class="portfolio-filter" align="center">
								<li><a class="btn btn-default default" href="PostScript_Board_Root.jsp"
									data-filter=".a">루트 후기</a></li>
								<li><a class="btn btn-default" href="PostScript_Board_Site.jsp" data-filter=".b">여행지
										후기</a></li>
							</ul>
						</div>
					</div>

					<form action="">
						<div class="row animate-box" align="left">
							<div class="col-md-4"></div>
							<div class="col-md-4" align="right">
								<input type="submit" value="검색하기" class="btn btn-primary">
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control"
									placeholder="검색어를 입력해주세요.">
							</div>
						</div>
					</form>
					<br> <br>


					<div class="container">
						<div class="row row-bottom-padded-md">
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="PostScript_Detail_Site.jsp"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="PostScript_Detail_Site.jsp">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/place-1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="#">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment"><a href="">찜콩<i
													class="icon-bubble2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>


						</div>

					</div>
				</div>
			</div>

























		</div>
		<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

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

