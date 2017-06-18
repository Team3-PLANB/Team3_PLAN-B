<%--
@Project : PLANB_JEJU
@File name : mainpage.jsp 
@Author : 임정연
 @Data : 2017.06.18
@Desc : 메인 페이지
--%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B &mdash; JEJU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LoginJoin/join.css">

	<script src="${pageContext.request.contextPath}/js/loginjoin/joinCheck.js"></script>
	<script src="${pageContext.request.contextPath}/js/email.js"></script>
	<script src="${pageContext.request.contextPath}/js/loginjoin/facebook.js" ></script>
	<script src="${pageContext.request.contextPath}/js/loginjoin/login.js" ></script>
	

<script src="js/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">



			<header id="fh5co-header-section" class="sticky-banner">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
						<h1 id="fh5co-logo">
							<a href="index.html"><i class="icon-airplane"></i>PLAN'B JEJU</a>
						</h1>
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
			<div class="fh5co-hero">
				<div class="fh5co-overlay"></div>
				<div class="fh5co-cover" data-stellar-background-ratio="0.5"
					style="background-image: url(images/cover_bg_1.jpg);">
					<div class="desc">
						<div class="container">
							<div class="row">
								<div class="col-sm-5 col-md-5">
									<div class="tabulation animate-box fadeInUp animated">

										<!-- 네비게이션 Tab : join/login -->
										<ul class="nav nav-tabs" role="tablist">
											<li role="presentation" id="join_tab"><a
												href="#joinform" aria-controls="join" role="tab"
												data-toggle="tab">JOIN</a></li>
											<li role="presentation" class="active" id="login_tab"><a
												href="#loginform" aria-controls="login" role="tab"
												data-toggle="tab">LOGIN</a></li>
										</ul>

										<!-- Tab JOIN -->
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane" id="joinform">
												<form action="joinok.do" class="row" id="joinfrm"
													method="POST">
													<div class="col-xxs-12 col-xs-6 mt"
														style="margin-left: 10%; width: 100%;">
														<div class="input-field">
															<label for="email">이메일</label>
															<div>
																<input type="text" class="form-control"
																	style="width: 250px; float: left;" name="username"
																	id="username" placeholder="이메일을 입력해주세요"
																	keypress="revText()">
																<!-- onblur="emailCheck()" -->
																<input type="button" onclick="emailCheck()"
																	id="overlabCheck" class="btn btn-primary btn-block"
																	style="float: left; width: 80px; height: 40px; float: left; font-size: 10px; padding: 3px; margin-left: 15px;"
																	value="메일중복확인"> <input type="button"
																	onclick="authCheck()" id="authNumSend"
																	class="btn btn-primary btn-block"
																	style="float: left; width: 80px; height: 40px; float: left; font-size: 10px; padding: 3px; margin-left: 15px;"
																	value="인증번호받기"> <input type="hidden"
																	id="saveAuthNum">
															</div>

															<div class="email-msg" id="email-msg"
																style="clear: both;"></div>
														</div>
													</div>
													<div class="col-xxs-12 col-xs-6 mt"
														style="clear: both; margin-left: 10%;">
														<div class="input-field">
															<label for="password">비밀번호</label> <input type="password"
																class="form-control" name="password" id="password"
																placeholder="비밀번호를 입력해주세요">
														</div>
													</div>
													<div class="col-xxs-12 col-xs-6 mt"
														style="clear: both; margin-left: 10%;">
														<div class="input-field">
															<label for="passwordck">비밀번호 확인</label> <input
																type="password" class="form-control" id="passwordck"
																placeholder="비밀번호를 입력해주세요" onkeyup="passwordCheck()">
															<div class="pwdck" id="pwdck"></div>
														</div>
													</div>
													<div class="col-xxs-12 col-xs-6 mt"
														style="clear: both; margin-left: 10%;">
														<div class="input-field">
															<label for="nickname">닉네임</label> <input type="text"
																class="form-control" name="nickname" id="nickname"
																placeholder="닉네임을 입력해주세요" onclick="nickCheck()">
															<div class="nick-msg" id="nick-msg"></div>
														</div>
													</div>
												</form>
											</div>
											<!-- Tab LOGIN -->
											<div role="tabpanel" class="tab-pane active" id="loginform">
												<form action="" class="row" method="POST">
													<div class="col-xxs-12 col-xs-6 mt"
														style="margin-left: 10%">
														<div class="input-field">
															<label for="email">이메일</label> <input type="text"
																class="form-control" id="username" name="username"
																placeholder="이메일을 입력해주세요">
															<div class="emailCheck"></div>
														</div>
													</div>
													<div class="col-xxs-12 col-xs-6 mt"
														style="clear: both; margin-left: 10%">
														<div class="input-field">
															<label for="password">비밀번호</label> <input type="password"
																class="form-control" id="password"
																placeholder="비밀번호를 입력해주세요">
															<div class="pwdCheck"></div>
														</div>
													</div>
													<div class="col-xs-12">
														<input type="submit" class="btn btn-primary btn-block"
															value="Login" onclick="loginCheck()">
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>

								<!-- 이메일 인증 -->
								<div class="col-sm-5 col-md-5" style="margin-left: 180px;"
									id="social_join">
									<div class="tabulation animate-box fadeInUp animated">
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="social_jo">
												<div class="row">
													<div class="col-xxs-12 col-xs-6 mt">
														<div class="input-field">
															<input type="text" class="form-control" id="authnum"
																name="authnum" placeholder="인증 번호 7자리를 입력해주세요"
																style="margin-left: 30%;"> <input type="submit"
																onclick="authNumCheck()"
																class="btn btn-primary btn-block"
																style="margin-top: 20px; width: 220%; height: 60px;"
																id="authNumCheck" value="이메일 인증하기">

														</div>
													</div>
													<div class="col-xxs-12 col-xs-6 mt"
														style="clear: both; margin-top: 20px; margin-left: 28%;">
														<div class="input-field">
															<label for="password">소셜 계정으로 회원가입</label> <a
																onclick="login()"> <img
																src="<%=request.getContextPath()%>/images/logo/001-facebook-2.png">
															</a> <a href=""> <img
																src="<%=request.getContextPath()%>/images/logo/005-google-plus.png">
															</a> <a href=""> <img
																src="<%=request.getContextPath()%>/images/logo/naver.png">
															</a>
														</div>
													</div>
													<div class="col-xs-12">
														<input type="button" class="btn btn-primary btn-block"
															value="Join" onclick="frm_submit()">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 소셜계정 로그인 -->
								<div class="col-sm-5 col-md-5" style="margin-left: 180px;"
									id="social_login">
									<div class="tabulation animate-box fadeInUp animated">
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="social_log">
												<div class="row">

													<div class="col-xxs-12 col-xs-6 mt"
														style="clear: both; margin-top: 20px; margin-left: 28%;">
														<div class="input-field">
															<label for="password">소셜 계정으로 로그인</label> <a
																onclick="login()"> <img
																src="<%=request.getContextPath()%>/images/logo/001-facebook-2.png">
															</a> <a href=""> <img
																src="<%=request.getContextPath()%>/images/logo/005-google-plus.png">
															</a>  <img
																src="<%=request.getContextPath()%>/images/logo/naver.png">
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>

			
			<div id="fh5co-features">
				<div class="container">
					<div class="row">
						<div class="col-md-4 animate-box">

							<div class="feature-left">
								<span class="icon"> <i class="icon-hotairballoon"></i>
								</span>
								<div class="feature-copy">
									<h3>Family Travel</h3>
									<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
										mollitia reprehenderit.</p>
									<p>
										<a href="#">Learn More</a>
									</p>
								</div>
							</div>

						</div>

						<div class="col-md-4 animate-box">
							<div class="feature-left">
								<span class="icon"> <i class="icon-search"></i>
								</span>
								<div class="feature-copy">
									<h3>Travel Plans</h3>
									<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
										mollitia reprehenderit.</p>
									<p>
										<a href="#">Learn More</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 animate-box">
							<div class="feature-left">
								<span class="icon"> <i class="icon-wallet"></i>
								</span>
								<div class="feature-copy">
									<h3>Honeymoon</h3>
									<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
										mollitia reprehenderit.</p>
									<p>
										<a href="#">Learn More</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 animate-box">

							<div class="feature-left">
								<span class="icon"> <i class="icon-wine"></i>
								</span>
								<div class="feature-copy">
									<h3>Business Travel</h3>
									<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
										mollitia reprehenderit.</p>
									<p>
										<a href="#">Learn More</a>
									</p>
								</div>
							</div>

						</div>

						<div class="col-md-4 animate-box">
							<div class="feature-left">
								<span class="icon"> <i class="icon-genius"></i>
								</span>
								<div class="feature-copy">
									<h3>Solo Travel</h3>
									<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
										mollitia reprehenderit.</p>
									<p>
										<a href="#">Learn More</a>
									</p>
								</div>
							</div>

						</div>
						<div class="col-md-4 animate-box">
							<div class="feature-left">
								<span class="icon"> <i class="icon-chat"></i>
								</span>
								<div class="feature-copy">
									<h3>Explorer</h3>
									<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
										mollitia reprehenderit.</p>
									<p>
										<a href="#">Learn More</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div id="fh5co-destination">
				<div class="tour-fluid">
					<div class="row">
						<div class="col-md-12">
							<ul id="fh5co-destination-list" class="animate-box">
								<li class="one-forth text-center"
									style="background-image: url(images/place-1.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Nayeong Kang</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(images/place-2.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Hongkong</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(images/place-3.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Italy</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(images/main/jy.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Jeongyeon Lim</h2>
										</div>
								</a></li>

								<li class="one-forth text-center"
									style="background-image: url(images/place-5.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Yebin Lee</h2>
										</div>
								</a></li>
								<li class="one-half text-center">
									<div class="title-bg">
										<div class="case-studies-summary">
											<h2>Most Popular Destinations</h2>
											<span><a href="#">View All Destinations</a></span>
										</div>
									</div>
								</li>
								<li class="one-forth text-center"
									style="background-image: url(images/main/dh.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Dahye Jeong</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(images/place-7.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Junseong Lee</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(images/place-8.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Madagascar</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(images/place-9.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Egypt</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(images/place-10.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Danbi Hong</h2>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			
			<!-- fh5co-blog-section -->
			<div id="fh5co-testimonial"
				style="background-image: url(images/img_bg_1.jpg);">
				<div class="container">
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2>Happy Clients</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="box-testimony animate-box">
								<blockquote>
									<span class="quote"><span><i
											class="icon-quotes-right"></i></span></span>
									<p>&ldquo;Far far away, behind the word mountains, far from
										the countries Vokalia and Consonantia, there live the blind
										texts. Separated they live in Bookmarksgrove right at the
										coast of the Semantics, a large language ocean.&rdquo;</p>
								</blockquote>
								<p class="author">
									John Doe, CEO <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a>
									<span class="subtext">Creative Director</span>
								</p>
							</div>

						</div>
						<div class="col-md-4">
							<div class="box-testimony animate-box">
								<blockquote>
									<span class="quote"><span><i
											class="icon-quotes-right"></i></span></span>
									<p>&ldquo;Far far away, behind the word mountains, far from
										the countries Vokalia and Consonantia, there live the blind
										texts.&rdquo;</p>
								</blockquote>
								<p class="author">
									John Doe, CEO <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a>
									<span class="subtext">Creative Director</span>
								</p>
							</div>


						</div>
						<div class="col-md-4">
							<div class="box-testimony animate-box">
								<blockquote>
									<span class="quote"><span><i
											class="icon-quotes-right"></i></span></span>
									<p>&ldquo;Far far away, behind the word mountains, far from
										the countries Vokalia and Consonantia, there live the blind
										texts. Separated they live in Bookmarksgrove right at the
										coast of the Semantics, a large language ocean.&rdquo;</p>
								</blockquote>
								<p class="author">
									John Doe, Founder <a href="#">FREEHTML5.co</a> <span
										class="subtext">Creative Director</span>
								</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<footer>
				<div id="footer">
					<div class="container">
						<div class="row row-bottom-padded-md">
							<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
								<h3>About Travel</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
								<h3>Top Flights Routes</h3>
								<ul>
									<li><a href="#">Manila flights</a></li>
									<li><a href="#">Dubai flights</a></li>
									<li><a href="#">Bangkok flights</a></li>
									<li><a href="#">Tokyo Flight</a></li>
									<li><a href="#">New York Flights</a></li>
								</ul>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
								<h3>Top Hotels</h3>
								<ul>
									<li><a href="#">Boracay Hotel</a></li>
									<li><a href="#">Dubai Hotel</a></li>
									<li><a href="#">Singapore Hotel</a></li>
									<li><a href="#">Manila Hotel</a></li>
								</ul>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
								<h3>Interest</h3>
								<ul>
									<li><a href="#">Beaches</a></li>
									<li><a href="#">Family Travel</a></li>
									<li><a href="#">Budget Travel</a></li>
									<li><a href="#">Food &amp; Drink</a></li>
									<li><a href="#">Honeymoon and Romance</a></li>
								</ul>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
								<h3>Best Places</h3>
								<ul>
									<li><a href="#">Boracay Beach</a></li>
									<li><a href="#">Dubai</a></li>
									<li><a href="#">Singapore</a></li>
									<li><a href="#">Hongkong</a></li>
								</ul>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
								<h3>Affordable</h3>
								<ul>
									<li><a href="#">Food &amp; Drink</a></li>
									<li><a href="#">Fare Flights</a></li>
								</ul>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-md-offset-3 text-center">
								<p class="fh5co-social-icons">
									<a href="#"><i class="icon-twitter2"></i></a> <a href="#"><i
										class="icon-facebook2"></i></a> <a href="#"><i
										class="icon-instagram"></i></a> <a href="#"><i
										class="icon-dribbble2"></i></a> <a href="#"><i
										class="icon-youtube"></i></a>
								</p>
								<p>
									Copyright 2016 Free Html5 <a href="#">Module</a>. All Rights
									Reserved. <br>Made with <i class="icon-heart3"></i> by <a
										href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> /
									Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</footer>



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

