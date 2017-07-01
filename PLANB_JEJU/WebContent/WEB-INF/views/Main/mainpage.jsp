<%--
@Project : PLANB_JEJU
@File name : mainpage.jsp 
@Author : 임정연
 @Data : 2017.06.18
@Desc : 메인 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B &mdash; JEJU</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" /> -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/message/img/favicon.png">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/superfish.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-skin-border.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/message/css/sweetalert.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/mainCss.css"> --%>
<!-- slider를 위한 css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/mainMain.css">

<%-- <script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/message/js/sweetalert.min.js" ></script>
</head>
<body>
	<header class="cont-slider">
		<section class="slider">
			<article class="slide one">
				<span>One
					<h3 style="color: white">
						<strong>&nbsp; : 눈부신 바다</strong>
					</h3>
				</span>
			</article>
			<article class="slide two">
				<span> Two
					<h3 style="color: white">
						<strong>&nbsp;: 아름다운 자연</strong>
					</h3>
				</span>
			</article>

			<article class="slide three">
				<span> Three
					<h3 style="color: white">
						<strong>&nbsp;: 편안한 숙박 시설</strong>
					</h3>
				</span>
			</article>
			<article class="slide four">
				<span>Four
					<h3 style="color: white">
						<strong>&nbsp;: 볼 것 많은 관광지</strong>
					</h3>
				</span>
			</article>
			<article class="slide five">
				<span>five
					<h3 style="color: white">
						<strong>&nbsp;: '함께'라는 행복</strong>
					</h3>
				</span>
			</article>
		</section>
	</header>

	<div id="fh5co-wrapper">
		<div id="fh5co-page">
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
											<h2>NaYeong Kang</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(../images/main/wa1.png);">
								<li class="one-forth text-center"
									style="background-image: url(../images/main/wa2.jpg);">
								<li class="one-forth text-center"
									style="background-image: url(../images/main/jy.jpg);"><a
									href="https://www.instagram.com/lim_c_1118/">
										<div class="case-studies-summary">
											<h2>JeongYeon Lim</h2>
										</div>
								</a></li>

								<li class="one-forth text-center"
									style="background-image: url(../images/main/yb.png);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>YeBin Lee</h2>
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
											<h2>DaHye Jeong</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(../images/main/js.jpg);"><a
									href="#">
										<div class="case-studies-summary">
											<h2>JunSeong Lee</h2>
										</div>
								</a></li>
								<li class="one-forth text-center"
									style="background-image: url(../images/main/wa3.jpg);">
								<li class="one-forth text-center"
									style="background-image: url(../images/main/wa4.jpg);">
								<li class="one-forth text-center"
									style="background-image: url(../images/main/DANBI.png);"><a
									href="https://www.instagram.com/_ddaa_n/">
										<div class="case-studies-summary">
											<h2>DanBi Hong</h2>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<!-- fh5co-blog-section -->
			<div id="fh5co-testimonial">
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
	</div>


<%-- 	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/sticky.js"></script>

	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
	<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/magnific-popup-options.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/selectFx.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script> --%>

</body>
</html>

