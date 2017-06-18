<%--
@Project : PLANB_JEJU
@File name : listBoard.jsp 
@Author : 임정연
 @Data : 2017.06.16
@Desc : 여행지 후기 게시판의 리스트
--%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="css/cs-select.css">
<link rel="stylesheet" href="css/cs-skin-border.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="../../css/PostScript/postscript.css">

<script src="js/modernizr-2.6.2.min.js"></script>


</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<%------------------------------후기 게시판의 header ----------------------------------------%>
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>후기 게시판</h3>
							<p>여행지 후기 게시판입니다.</p>
							<ul class="portfolio-filter" align="center">
								<li>
									<a class="btn btn-default default" href="${pageContext.request.contextPath}/PostScript/Root/List.do"
										data-filter=".a">루트 후기</a>
								</li>
								<li>
									<a class="btn btn-default active" href="${pageContext.request.contextPath}/PostScript/Site/List.do"
										data-filter=".b">여행지 후기</a>
								</li>
							</ul>
						</div>
					</div>

					<%-----------------------------검색 부분 ----------------------------------------%>
					<form action="">
						<div class="row animate-box" align="right">
							<input type="submit" style="margin-left:10px;float:right;" value="검색하기" class="btn btn-primary">
							<input type="text" style="width:300px;float:right;" class="form-control" placeholder="검색어를 입력해주세요.">
						</div>
					</form>
					<br>

					<%------------------------------리스트 부분 ----------------------------------------%>
					<div class="container">
						<div class="row row-bottom-padded-md">
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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
									<a
										href="${pageContext.request.contextPath}/PostScript/Site/Detail.do"><img
										class="img-responsive"
										src="../../images/PostScript/listBoard_Site.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a
													href="${pageContext.request.contextPath}/PostScript/Site/Detail.do">낮코밤코의
													첫 제주도</a>
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

