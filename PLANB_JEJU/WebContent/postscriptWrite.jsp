<%--
@Project : PLANB_JEJU
@File name : postscriptWrite.jsp 
@Author : 임정연
 @Data : 2017.06.17
@Desc : 후기 작성 페이지
--%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B &mdash; JEJU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>
	
	
<!-- 
 추후 수정 (준성)
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="css/cs-select.css">
<link rel="stylesheet" href="css/cs-skin-border.css">
<link rel="stylesheet" href="css/style.css">
 -->
 
 
<!-- 여행후기작성  -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
 
 
 
 
<!-- 갤러리 등록을 위한 css  -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="dist/styles.imageuploader.css" rel="stylesheet" type="text/css">






<!-- 
계속 죽일지는 차후 확인
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/sticky.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>
<script src="js/bootstrap-datepicker.min.js"></script>
<script src="js/classie.js"></script>
<script src="js/selectFx.js"></script>
 -->








<link rel="stylesheet" href="css/PostScript/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<!-- <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script> -->

<!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script> -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <link rel="shortcut icon" href="favicon.ico"> -->

 <link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>



<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/icomoon.css">
	
	
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
	
	
<!-- Superfish -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/superfish.css">
	
	
<!-- histroy css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/history.css">
	
<!-- 체크박스 css -->	
<link rel="stylesheet" href="css/PlanA/checkbox-bootstrap.css">


<!-- html2canvas 연습 -->
<link>

<header>
	<nav class="navbar navbar-default" style="margin: 0px;">
		<div class="container">
			<div class="nav-header">
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"> <i></i>
				</a>
				<h1 id="fh5co-logo">
					<a href="${pageContext.request.contextPath}/Index/main.do"> <i
						class="icon-airplane"></i>PLAN'B JEJU
					</a>
				</h1>
				<!-- START #fh5co-menu-wrap -->
				<nav id="fh5co-menu-wrap" role="navigation">
					<ul class="sf-menu sf-js-enabled sf-arrows" id="fh5co-primary-menu"
						style="touch-action: pan-y;">
						<li class="active"><a
							href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
						<!-- ROLE_USER만 : 클릭 시 로그인 페이지로 이동 > 수정할거야 -->
						<%-- <security:authorize access ="isAnonymous()">							
								<li>
									<a href="${pageContext.request.contextPath}/LoginJoin/Join/NJoin.do">일정만들기</a>
								</li>
							</security:authorize> --%>
						<%-- <security:authorize access="isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/PLANA.do">일정만들기</a></li>
							</security:authorize> --%>

						<li><a
							href="${pageContext.request.contextPath}/PLANA.make.do">일정만들기</a></li>

						<li><a
							href="${pageContext.request.contextPath}/PostScript/Route/List.do">후기게시판</a></li>
						<!-- ROLE_USER만 : 로그인 시 보이는 탭-->
						<security:authorize access="hasRole('ROLE_USER')">
							<li class=""><a
								href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do"
								class="fh5co-sub-ddown sf-with-ul">My Page</a>
								<ul class="fh5co-sub-menu" style="display: none;">
									<li><a
										href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do">일정
											관리</a></li>
									<li><a
										href="${pageContext.request.contextPath}/MyPage/PostScript/postScriptMain.do">나의
											후기</a></li>
									<li><a
										href="${pageContext.request.contextPath}/MyPage/Like/like.do">찜한
											후기</a></li>
									<li><a
										href="${pageContext.request.contextPath}/MyPage/Message/msgMain.do">쪽지함</a></li>
									<li><a
										href="${pageContext.request.contextPath}/MyPage/Info/info.do">회원정보수정</a></li>
									<li><a
										href="${pageContext.request.contextPath}/MyPage/History/history.do">히스토리</a></li>
								</ul></li>
						</security:authorize>
						<security:authorize access="isAnonymous()">
							<li><a
								href="${pageContext.request.contextPath}/LoginJoin/Login/NLogin.do">LOGIN</a>
							</li>
						</security:authorize>
						<!-- 로그아웃 -->
						<security:authorize access="isAuthenticated()">
							<form action="${logoutUrl}" method="post"
								class="navbar-form navbar-right">
								<button type="submit" class="btn btn-default">로그아웃</button>
							</form>
						</security:authorize>
					</ul>
				</nav>
			</div>
		</div>
	</nav>
</header>



<!-- 상세보기 일정 -->

<style>
.sortable {
	font-size: 10px;
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 60%;
	height: auto;
}

div.over {
	background:
		url("http://cfile1.uf.tistory.com/image/20558E424FEE324E2693F1");
	cursor: pointer; /* 마우스 손모양 */
}

.spinner {
	padding: 10px;
	width: 30px;
	height: 15px;
}

.group {
	width: 80%;
	margin: 15px;
}
</style>

<script>
	$(document).ready(function() {
		$('#schedulebox').animate({
			width : '+=380px'
		});
		$('#schedulebox2').animate({
			width : '+=30%'
		});
		$('.spinner').spinner({
			min : 0,
			max : 300,
			step : 15,
			start : 0
		});
		$(".sortable").sortable();
		/* $(".sortable").disableSelection(); */
		$(".sortable").selectable();

		
		$("#accordion").accordion({
			collapsible : true,
			header : ".day_info_box"
		}).sortable({
			axis : "y",
			handle : ".day_info_box",
			stop : function(event, ui) {
				// IE doesn't register the blur when sorting
				// so trigger focusout handlers to remove .ui-state-focus
				ui.item.children(".day_info_box").triggerHandler("focusout");
				// Refresh accordion to handle new order
				$(this).accordion("refresh");
			}
		});
		$("#accordion2").accordion({
			collapsible : true,
			header : "> div > h3",
			autoHeight : false,
			navigation : true,
			heightStyle : "content" 
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {
				// IE doesn't register the blur when sorting
				// so trigger focusout handlers to remove .ui-state-focus
				ui.item.children("div").triggerHandler("focusout");
				// Refresh accordion to handle new order
				$(this).accordion("refresh");
			}
		});

	});
</script>


<script>
	/* 첫번째 체크박스 중복체크 X  */
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("aaa");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	/* 두번째 체크박스 중복체크 X  */
	function doOpenCheck2(chk) {
		var obj = document.getElementsByName("bbb");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	/* 세번째 체크박스 중복체크 X  */
	function doOpenCheck3(chk) {
		var obj = document.getElementsByName("ccc");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
</script>




</head>












<%----------------------------------일정 짜기 부분 ----------------------------------------%>

<div style="background-color: white; width: 450px;" id="schedulebox2">
	<!-- 이놈은 아님 -->
	<div id="accordion2"
		style="overflow: auto; width: 450px; height: 650px;">
		<div class="group" style="width: 400px;">
			<h3>DAY 1</h3>
			<!--min-height   -->
			<div>
				<div class="sortable">
					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width: 150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">1번</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding: 0px">
									<img src="<%=request.getContextPath()%>/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
					</div>

					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width: 130px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">2번</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding: 0px">
									<img src="<%=request.getContextPath()%>/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="group" style="width: 400px;">
			<h3>DAY 2</h3>
			<div>
				<div class="sortable">
					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width: 150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">1번</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding: 0px">
									<img src="<%=request.getContextPath()%>/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%=request.getContextPath()%>/css/history/map_ico.png"
								alt="" class="spot_btn map_view"
								onclick="set_center(33.51010100,126.48125500)">
						</div>
					</div>
					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width: 150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">22</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding: 0px">
									<img src="<%=request.getContextPath()%>/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%=request.getContextPath()%>/css/history/map_ico.png"
								alt="" class="spot_btn map_view"
								onclick="set_center(33.51010100,126.48125500)">
						</div>
					</div>
					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width: 150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">333</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding: 0px">
									<img src="<%=request.getContextPath()%>/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%=request.getContextPath()%>/css/history/map_ico.png"
								alt="" class="spot_btn map_view"
								onclick="set_center(33.51010100,126.48125500)">
						</div>
					</div>

					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='/res/img/common/no_img/sight55.png';"
							onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
							style="cursor: pointer;">
						<div class="spot_content_box" style="width: 150px;">
							<div class="spot_name"
								onclick="window.open('/ko/city/jeju_312/attraction/yongdam-ocean-road_7505');"
								style="cursor: pointer;">444</div>
							<div class="spot_info">
								<div class="tag">유명한거리/지역</div>
								<div class="sinfo_line"></div>
								<div class="sinfo_txt" style="padding: 0px">
									<img src="<%=request.getContextPath()%>/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="<%=request.getContextPath()%>/css/history/map_ico.png"
								alt="" class="spot_btn map_view"
								onclick="set_center(33.51010100,126.48125500)">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container"
	style="float: left; position: relative; bottom: 522px; left: 450px;">
	<div class="row">
		<div class="col-sm-5 col-md-12">
			<div class="tabulation animate-box fadeInUp animated">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#step1"
						aria-controls="flights" role="tab" data-toggle="tab">루트 후기 작성</a></li>
					<li role="presentation"><a href="#step2"
						aria-controls="hotels" role="tab" data-toggle="tab">여행지 후기 작성</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="step1">
						<div class="table-responsive">

							<div role="tabpanel" class="tab-pane active" id="root">
								<input type="text" class="form-control" placeholder="제목"><br>
								<textarea name="" class="form-control" id="" cols="30" rows="7"
									placeholder="후기"></textarea>
								<br>
								<div align="center">
									<input type="submit" value="작성 완료"
										class="btn btn-primary btn-block">
								</div>
							</div>
						</div>
					</div>


<div role="tabpanel" class="tab-pane" id="step2">
	<div class="table-responsive">
		<section role="main" class="l-main">
			<div class="uploader__box js-uploader__box l-center-box">
				<form action="your/nonjs/fallback/" method="POST">
					<div class="uploader__contents">
						<label class="button button--secondary" for="fileinput">ImageFiles</label> 
							<input id="fileinput" class="uploader__file-input" type="file" multiple value="Select Files">
					</div>
						<input class="button button--big-bottom" type="submit"
					    value="Upload Selected Files">
		  	  </form>
		    </div>
		</section>
		
		
		
		
							<!--
							 이새끼 충돌
							 <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
							 -->
							 
							<script src="dist/jquery.imageuploader.js"></script>
							<script>
								(function() {
									var options = {};
									$('.js-uploader__box').uploader(options);
								}());
							</script>
							<script>
								var _gaq = _gaq || [];
								_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
								_gaq.push([ '_setDomainName',
										'jqueryscript.net' ]);
								_gaq.push([ '_trackPageview' ]);

								(function() {
									var ga = document.createElement('script');
								
									ga.async = true;
									ga.src = ('https:' == document.location.protocol ? 'https://ssl'
											: 'http://www')
											+ '.google-analytics.com/ga.js';
									var s = document
											.getElementsByTagName('script')[0];
									s.parentNode.insertBefore(ga, s);
								})();
							</script>


							<br> <input type="text" class="form-control"
								placeholder="제목"><br>
							<textarea name="" class="form-control" id="" cols="30" rows="7"
								placeholder="후기"></textarea>
							<br>
							<div align="center">
								<div class="checkbox">
									<img alt="" src="images/PostScript/003-sun.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> <input
										name="aaa" type="checkbox" value="1"
										onclick="doOpenCheck(this);"> <span
										class="checkbox-placeholder"></span> 맑음
									</label>&nbsp;&nbsp;&nbsp; <label
										class="checkbox-bootstrap checkbox-lg"> <input
										name="aaa" type="checkbox" value="2"
										onclick="doOpenCheck(this);"> <span
										class="checkbox-placeholder"></span> 흐림
									</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
										<input name="aaa" type="checkbox" value="3"
										onclick="doOpenCheck(this);"> <span
										class="checkbox-placeholder"></span> 우중충
									</label>
								</div>
								<br>
								<div class="checkbox">
									<img alt="" src="images/PostScript/002-money.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> <input
										name="bbb" type="checkbox" value="1"
										onclick="doOpenCheck2(this);"> <span
										class="checkbox-placeholder"></span> 부족
									</label>&nbsp;&nbsp;&nbsp; <label
										class="checkbox-bootstrap checkbox-lg"> <input
										name="bbb" type="checkbox" value="2"
										onclick="doOpenCheck2(this);"> <span
										class="checkbox-placeholder"></span> 적당
									</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
										<input name="bbb" type="checkbox" value="3"
										onclick="doOpenCheck2(this);"> <span
										class="checkbox-placeholder"></span> 풍족
									</label>
								</div>
								<br>
								<div class="checkbox">
									<img alt="" src="images/PostScript/001-hospital.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> <input
										name="ccc" type="checkbox" value="1"
										onclick="doOpenCheck3(this);"> <span
										class="checkbox-placeholder"></span> 양호
									</label>&nbsp;&nbsp;&nbsp; <label
										class="checkbox-bootstrap checkbox-lg"> <input
										name="ccc" type="checkbox" value="2"
										onclick="doOpenCheck3(this);"> <span
										class="checkbox-placeholder"></span> 쏘쏘
									</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
										<input name="ccc" type="checkbox" value="3"
										onclick="doOpenCheck3(this);"> <span
										class="checkbox-placeholder"></span> 악화
									</label>
									
									
									
									
								</div>
							</div>
							<br>
							<div align="center">
								<input type="submit" value="작성 완료"
									class="btn btn-primary btn-block">
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>

</html>

