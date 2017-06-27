<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="../myPageMain.jsp"></jsp:include> --%>

<!-- Animate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/history/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/history/bootstrap.css">
<!-- Theme style  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/history/style.css">
<!-- Plan A 수정내역 보여주기 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/history/revision.css">
<!-- <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> -->

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/mypage/history/modernizr-2.6.2.min.js"></script>

<!-- </head> -->
<c:set var="routename" value="${routename }" />
<body>
	<div class="fh5co-loader"></div>
	<div id="page">
		<div id="fh5co-resume" class="fh5co-bg-color">
			<div class="container">
				<div class="row animate-box">
			
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>My History</h2>
						<h3>${routename.routename }</h3>
					</div>
				</div>
 				<c:forEach var="myroute" items="${myroutehistory}">	
					<div class="row">
						<div class="col-md-12 col-md-offset-0">
							<ul class="timeline">
								<li class="timeline-heading text-center animate-box">
									<div>
										<h3>1 DAY</h3>
									</div>
								</li>
									<li class="animate-box timeline-unverted">
										<div class="timeline-badge">
											<i class="icon-map-pin"></i>
										</div>
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h3 class="timeline-title">한라산</h3>
												<span class="company">2017.06.22</span>
											</div>
		
											<div class="timeline-body">
												<p>제주도 한라산 일원의 천연보호구역. 천연기념물 제182호. 제주도의 중앙에 있는 산. 높이
													1,950m.</p>
											</div>
										</div>
									</li>
								<li class="timeline-inverted animate-box">
	
									<div class="timeline-badge-ch">
										<i class="icon-map-pin"></i>
									</div>
	
									<div class="timeline-panel">
	
										<div class="timeline-heading">
											<%----------------------------------플랜비 받은 부분 ----------------------------------------%>
											<h3 class="timeline-title">테디베어 뮤지엄</h3>
											<span class="company">2017.06.22</span>
											<div class="accordion">
												<div class="item">
													<div class="heading" align="center">수정 내역 보기</div>
													<div class="content" style="width: 650px; height: 350px;">
														<div style="width: 200px">
															<h2 align="center">PLAN'A</h2>
															<img
																src="${pageContext.request.contextPath}/images/MyPage/history.jpg"
																align="center" /><br> <br>
															<p align="center">협재해변</p>
														</div>
														<div
															style="width: 150px; position: relative; left: 250px; bottom: 230px;">
															<img
																src="${pageContext.request.contextPath}/images/MyPage/arrow.png"
																align="center" width="100px" height="100px" /><br>
															<br>
															<p>&nbsp;&nbsp;&nbsp;&nbsp;건강 악화</p>
														</div>
														<div
															style="width: 200px; position: relative; left: 400px; bottom: 515px;">
															<h2 align="center">PLAN'B</h2>
															<img src="${pageContext.request.contextPath}/images/MyPage/history.jpg" align="center" /><br> <br>
															<p align="center">테디베어 뮤지엄</p>
														</div>
													</div>
												</div>
											</div>
	
											<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
											<script src="${pageContext.request.contextPath}/js/mypage/history/revision.js"></script>
										</div>
										<br>
										<!-- 수정이후 다시 붙는거 -->
										<div class="timeline-body">
											<p>100년이 넘는 Teddy Bear의 역사는 물론 서울의 역사, 근현대 100년 인류사, 서울의
												역사와 현재의 모습, 예술, 세계여행 등의 여러가지 테마를 Tedyy Bear와 접목시켜 재미있는 볼거리와
												알거리를 제공하는 대한민국 최대의 테마 뮤지엄 브랜드이다. 또한 20년이 넘는 세월 동안 테디베어 디자인,
												제조의 노하우를 가지고 세계로 뻗어나가는 자랑스러운 대한민국의 기업이기도 하다.</p>
										</div>
									</div>
								</li>
								<li class="animate-box timeline-unverted">
									<div class="timeline-badge">
										<i class="icon-map-pin"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h3 class="timeline-title">라마다프라자호텔</h3>
											<span class="company">2017.06.22</span>
										</div>
										<div class="timeline-body">
											<p>라마다 프라자 제주호텔은 국내 최초의 해변 호텔이다. 제주 국제공항과 제주항에서 차량으로 5분
												거리에 위치하고 있으며, 바다위에 떠 있는 호텔은 마치 선상에 있는 듯한 이색적인 경험을 할 수 있다.</p>
										</div>
									</div>
								</li>
	
								<br>
								<li class="timeline-heading text-center animate-box">
									<div>
										<h3>2 DAY</h3>
									</div>
								</li>
								<li class="timeline-inverted animate-box">
									<div class="timeline-badge">
										<i class="icon-map-pin"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h3 class="timeline-title">천제연폭포</h3>
											<span class="company">2017.06.23</span>
										</div>
										<div class="timeline-body">
											<p>제주 서귀포시 중문동(中文洞)에 있는 폭포.</p>
										</div>
									</div>
								</li>
								<li class="animate-box timeline-unverted">
									<div class="timeline-badge">
										<i class="icon-map-pin"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h3 class="timeline-title">마라도</h3>
											<span class="company">2017.06.23</span>
										</div>
										<div class="timeline-body">
											<p>제주특별자치도 서귀포시 대정읍 마라리에 속하는 섬.</p>
										</div>
									</div>
								</li>
								<li class="timeline-inverted animate-box">
									<div class="timeline-badge">
										<i class="icon-map-pin"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h3 class="timeline-title">제주 러브랜드</h3>
											<span class="company">2017.06.23</span>
										</div>
										<div class="timeline-body">
											<p>제주러브랜드는 천국의 섬으로 불리는 제주도에 성을 주제로 한 현대적 감각의 테마조각공원을 조성하여
												국제자유도시 제주도의 위상을 높이는 새로운 테마 관광지이다.</p>
										</div>
									</div>
								</li>
								<li class="animate-box timeline-unverted">
									<div class="timeline-badge">
										<i class="icon-map-pin"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h3 class="timeline-title">신라호텔</h3>
											<span class="company">2017.06.23</span>
										</div>
										<div class="timeline-body">
											<p>해변가가 내려다보이는 쉬리의 언덕이 유명한 제주 신라 호텔은 중문관광단지 내 자리하고 있어
												여미지식물원, 천제연폭포, 별내린 전망대 등이 아주 가까운 거리에 있습니다. 또한, 제주국제공항은 차로 1시간
												5분 거리에 있으며 1일 3회 호텔-공항 간 무료 셔틀을 운영하고 있습니다.</p>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.stellar.min.js"></script>
	<!-- Easy PieChart -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.easypiechart.min.js"></script>
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/js/mypage/history/google_map.js"></script>

	<!-- Main -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/main.js"></script>
</body>
</html>

