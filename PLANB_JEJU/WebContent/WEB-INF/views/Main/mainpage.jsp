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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/LoginJoin/join.css">

<script
	src="${pageContext.request.contextPath}/js/loginjoin/joinCheck.js"></script>
<script src="${pageContext.request.contextPath}/js/email.js"></script>
<script
	src="${pageContext.request.contextPath}/js/loginjoin/facebook.js"></script>
<script src="${pageContext.request.contextPath}/js/loginjoin/login.js"></script>


<script src="js/modernizr-2.6.2.min.js"></script>

<!-- slider를 위한 css  -->
	
</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
		
		
		
		
		
		
		<aside id="fh5co-hero" class="js-fullheight">
			<div class="flexslider js-fullheight">
				<ul class="slides">
			   	<li style="background-image: url(images/slide_1.jpg);">
			   		<div class="overlay-gradient"></div>
			   		<div class="container">
			   			<div class="col-md-10 col-md-offset-1 text-center js-fullheight slider-text">
			   				<div class="slider-text-inner">
			   					<h2>Create A Motivational Template</h2>
			   					<p><a href="#" class="btn btn-primary btn-lg">Get started</a></p>
			   				</div>
			   			</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(images/slide_2.jpg);">
			   		<div class="overlay-gradient"></div>
			   		<div class="container">
			   			<div class="col-md-10 col-md-offset-1 text-center js-fullheight slider-text">
			   				<div class="slider-text-inner">
			   					<h2>Start Practicing Your Course</h2>
			   					<p><a href="#" class="btn btn-primary btn-lg">Get started</a></p>
			   				</div>
			   			</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(images/slide_3.jpg);">
			   		<div class="overlay-gradient"></div>
			   		<div class="container">
			   			<div class="col-md-10 col-md-offset-1 text-center js-fullheight slider-text">
			   				<div class="slider-text-inner">
			   					<h2>Start Your Startup With This Template</h2>
			   					<p><a href="#" class="btn btn-primary btn-lg">Get started</a></p>
			   				</div>
			   			</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(images/slide_4.jpg);">
			   		<div class="overlay-gradient"></div>
			   		<div class="container">
			   			<div class="col-md-10 col-md-offset-1 text-center js-fullheight slider-text">
			   				<div class="slider-text-inner">
			   					<h2>Surf With Free &amp; Unlimited Template</h2>
			   					<p><a href="#" class="btn btn-primary btn-lg">Get started</a></p>
			   				</div>
			   			</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
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
															</a> <img
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
									<p>가족들과 화목한 제주도 일정을 보내고 싶다면?</p>
									<p>
										<a href="${pageContext.request.contextPath}/PLANA.make.do">일정
											만들러 가기</a>
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
									<p>내가 원하는 취향에 맞게 여행 계획을 짜고 싶다면?</p>
									<p>
										<a href="${pageContext.request.contextPath}/PLANA.make.do">일정
											만들러 가기</a>
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
									<p>달콤한 신혼 여행을 보내고 싶다면?</p>
									<p>
										<a href="${pageContext.request.contextPath}/PLANA.make.do">일정
											만들러 가기</a>
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
									<p>편안히 일 할 수 있는 여행을 계획하고 싶다면?</p>
									<p>
										<a href="${pageContext.request.contextPath}/PLANA.make.do">일정
											만들러 가기</a>
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
									<p>야무지게 홀로 여행하고 싶다면?</p>
									<p>
										<a href="${pageContext.request.contextPath}/PLANA.make.do">일정
											만들러 가기</a>
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
									<p>남들은 가보지 않은 곳을 여행하고 싶다면?</p>
									<p>
										<a href="${pageContext.request.contextPath}/PLANA.make.do">일정
											만들러 가기</a>
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
									style="background-image: url(../images/main/ANNA.PNG);"><a
									href="https://www.instagram.com/annagang1105/">
										<div class="case-studies-summary">
											<h2>Nayeong Kang</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(../images/place-9.jpg);">
								<li class="one-forth text-center"
									style="background-image: url(../images/place-9.jpg);">
								<li class="one-forth text-center"
									style="background-image: url(../images/main/jy.jpg);"><a
									href="https://www.instagram.com/lim_c_1118/">
										<div class="case-studies-summary">
											<h2>Jeongyeon Lim</h2>
										</div>
								</a></li>

								<li class="one-forth text-center"
									style="background-image: url(../images/place-9.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Yebin Lee</h2>
										</div>
								</a></li>
								<li class="one-half text-center">
									<div class="title-bg">
										<div class="case-studies-summary">
											<h2>WE ARE DEVELOPER</h2>
											<span><a href="#">DAY CODING NIGHT CODING</a></span>
										</div>
									</div>
								</li>
								<li class="one-forth text-center"
									style="background-image: url(../images/main/HYE.PNG);"><a
									href="https://www.instagram.com/hye_0216/">
										<div class="case-studies-summary">
											<h2>Dahye Jeong</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(../images/place-9.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>Junseong Lee</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(../images/place-9.jpg);">
								<li class="one-forth text-center"
									style="background-image: url(../images/place-9.jpg);">
								<li class="one-forth text-center"
									style="background-image: url(../images/main/DANBI.png);"><a
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
							<h2>For Happy Travelers</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="box-testimony animate-box">
								<blockquote>
									<span class="quote"><span><i
											class="icon-quotes-right"></i></span></span>
									<p>&ldquo;판교에 본사를 둔 'PLAN'B JEJU'는 인터넷과 모바일 기술을 활용하여 여행분야의
										새로운 가치를 만들어가는 회사입니다. 'PLAN'B JEJU'는 빠르고 쉽게 제주도 여행을 계획하는 공간이며,
										여행 취향에 맞는 최적의 여행 경로를 찾도록 도와주는 효율적인 도구입니다. 제주도 여행을 계획하는 것이 어렵거나
										많은 시간을 허비하고 계신가요? 'PLAN'B JEJU'에서 쉽고 빠르게 당신만의 여행을
										그려보세요.&rdquo;</p>
								</blockquote>
								<p class="author">
									낮코밤코 <span class="subtext">DAY CODING NIGHT CODING</span>
								</p>
							</div>

						</div>
						<div class="col-md-4">
							<div class="box-testimony animate-box">
								<blockquote>
									<span class="quote"><span><i
											class="icon-quotes-right"></i></span></span>
									<p>&ldquo;PLAN'B JEJU.com은(이하 '회사' 또는 '당사') 귀하가 개인정보를 중요하게
										생각하고 있다는 것을 알고 있으며, 저희도 동일하게 생각합니다. 본 개인정보취급방침은 귀하가 당사의 서비스를
										사용하는 경우 당사가 귀하에 대한 정보를 수집, 사용 및 공유하는 방식과 그 시기를 규정합니다. 귀하는 본
										서비스를 사용함으로써 본 방침에 기재된 귀하에 대한 정보를 수집, 이전, 조작, 보관, 공개 및 기타 사용하는데
										동의합니다. 귀하가 거주하거나 정보를 제공하는 국가가 어디인지를 불문하고 귀하는 당사의 사업을 운영하는
										대한민국이나 기타 국가에서 당사가 귀하의 정보를 사용할 수 있도록 승인합니다.&rdquo;</p>
								</blockquote>
								<p class="author">
									낮코밤코 <span class="subtext">DAY CODING NIGHT CODING</span>
								</p>
							</div>


						</div>
						<div class="col-md-4">
							<div class="box-testimony animate-box">
								<blockquote>
									<span class="quote"><span><i
											class="icon-quotes-right"></i></span></span>
									<p>&ldquo;낮코밤코 팀은 전 세계 5억 명 이상의 사람들이 간직한 아름다운 제주도의 순간을 위한
										여행 경로 추천을 지원합니다. 작은 규모이지만 열정으로 가득한 낮코밤코 팀과 함께하고 싶다면 지금
										도전하세요.&rdquo;</p>
								</blockquote>
								<p class="author">
									낮코밤코 <span class="subtext">DAY CODING NIGHT CODING</span>
								</p>
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
	
	
	
	
	<script src="../../js/main/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../../js/main/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../../js/main/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../../js/main/jquery.waypoints.min.js"></script>
	<!-- Superfish -->
	<script src="../../js/main/hoverIntent.js"></script>
	<script src="../../js/main/superfish.js"></script>
	<!-- Flexslider -->
	<script src="../../js/main/jquery.flexslider-min.js"></script>
	<!-- Stellar -->
	<script src="../../js/main/jquery.stellar.min.js"></script>
	<!-- Counters -->
	<script src="../../js/main/jquery.countTo.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="../../js/main/main.js"></script>

</body>
</html>

