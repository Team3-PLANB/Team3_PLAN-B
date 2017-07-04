<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="../myPageMain.jsp"></jsp:include> --%>
<head>
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

  	<!-- jQuery -->
<%-- 	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.min.js"></script> --%>
<%--  	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.easing.1.3.js"></script> --%>
 	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/bootstrap.min.js"></script>
 	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.stellar.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/mypage/history/magnific-popup-options.js"></script>
<%-- 	<!-- Easy PieChart -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/jquery.easypiechart.min.js"></script>
 --%><%-- 	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/js/mypage/history/google_map.js"></script>
 --%>
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/js/mypage/history/main.js"></script>

<script>
	$(document).ready(function(){
		var routeOrder = 0;
		var dayOrder = 0;
		var OddEven =0;
		var $li;
		var $div;
		var $h3;
		var scheduleday;
		var $site_name; /* 여행지-site */
		var $mycomment; /* 후기-comment */
		var $timeline;
		var $ltimeline_heading;
		var $dtimeline_heading;
		var $timeline_unverted;
		var $timeline_badge;
		var $timeline_badgech;
		var $timeline_panel;
		var $timeline_title;
		var $timeline_company;
		var $timeline_body;
		var $accordion;
		var $item;
		var $heading;
		var $content;
		var $plana;
		var $reason;
		var $planb;
		var numCheckUpdated = -1;
		var index=0;
		$timeline = $("<ul class='timeline' id='timeline' ><ul>");
		<c:forEach var="myroute" items="${myroutehistory}" varStatus="num">
			//각 Site마다 ++ 
			OddEven++;
			if(dayOrder != '${myroute.route_date}') {

				dayOrder = '${myroute.route_date}';
				$ltimeline_heading = $("<li class='timeline-heading text-center animate-box fadeInUp animated-fast' ></li>");
				$h3 = $("<div><h3>" + dayOrder + " Day</h3></div>");
				
				/* #start > timeline + heading */
				$h3.appendTo($ltimeline_heading);
				$timeline.append($ltimeline_heading);
				$('#start').append($timeline);
				
			}
			var dayOrderId = "#" + dayOrder;
			index = ${num.index};

			if (OddEven % 2 == 0) { // 짝수:inverted
				$timeline_unverted = $("<li class='animate-box fadeInUp animated-fast timeline-inverted'></li>");
			} else {				// 홀수:unverted
				$timeline_unverted = $("<li class='animate-box fadeInUp animated-fast timeline-unverted'></li>");
			}

			$timeline_panel = $("<div class='timeline-panel'></div>");
			$dtimeline_heading = $("<div class='timeline-heading'></div>");
			$timeline_title = $("<h3 class='timeline-title'>${myroute.site}</h3>");
			$timeline_company = $("<span class='company'>${myroute.route_date}</span>");
			if('${myroute.comment}' !== '0') {
				$timeline_body = $("<div class='timeline-body'><p>${myroute.comment}</p></div>");
			} else {	// 후기없으면 <div></div>
				$timeline_body = $("<div class='timeline-body'></div>");
			}
			
			$accordion = $("<div class = 'accordion' id = 'accordion'></div>");
			$item = $("<div class='item "+index+"' id = 'item'></div>");
			$heading = $("<div class='heading' align='center' id = 'heading' onclick = 'showUpdated(this)'>수정 내역 보기</div><br>");

			if(index == numCheckUpdated) {
				// index값이 numCheckUpdated랑 같으면 수정이력이 있는 원본 여행지
				// accordion div에 append
				$content = $("<div class = 'content' style='width: 500px; height: 350px;'></div>");
				$plana = $("<div style = 'width: 150px'><h2 align = 'center'>PLAN-A</h2><img src='${pageContext.request.contextPath}/images/MyPage/history.jpg' align='center' style='width:150px; height:150px' /><br> <br><p align='center'>${myroute.site}</p></div>");
				if('${myroute.update_reason}' !== '0') {
					$reason = $("<div style='width: 70px; position: relative; left: 180px; bottom: 200px;'><img src='${pageContext.request.contextPath}/images/MyPage/arrow.png' align='center' width='80px' height='80px' /><br> <br> <p>&nbsp;&nbsp;&nbsp;&nbsp;${myroutehistory[num.index-1].update_reason}</p> </div>");
				} else {
					$reason = $("<div style='width: 70px; position: relative; left: 180px; bottom: 200px;'><img src='${pageContext.request.contextPath}/images/MyPage/arrow.png' align='center' width='80px' height='80px' /><br> <br> <p>&nbsp;&nbsp;&nbsp;&nbsp;</p> </div>");					
				}
				$planb = $("<div style='width: 150px; position: relative; left: 300px; bottom: 446px;'> <h2 align='center'>PLAN-B</h2> <img src='${pageContext.request.contextPath}/images/MyPage/history.jpg' align='center' style='width:150px; height:150px'/><br> <br> <p align='center'>${myroutehistory[num.index-1].site}</p> </div><br>");
				var idx = '.' + (index-1);
				$content.append($plana).append($reason).append($planb);
				$(idx).append($content);
				OddEven++;
			} else if(index != numCheckUpdated) {
				// index값이 numCheckUpdate와 다르면 그냥 일반 여행지 형식으로 append>');
				console.log("else if문")
				// update_rownum이 0이 아니면 accordion div append!
				if('${myroute.update_rownum}' != 0) {
					// 수정된 여행지
					$timeline_badge = $("<div class='timeline-badge-ch'><i class='icon-map-pin'></i></div>");
					$item.append($heading);
					$accordion.append($item);
					$dtimeline_heading.append($timeline_title).append($timeline_company).append($accordion);
					$timeline_panel.append($dtimeline_heading).append($timeline_body);
					$timeline_unverted.append($timeline_badge).append($timeline_panel);
					$($timeline).append($timeline_unverted);
					numCheckUpdated = index+1;
					// updaterownum이 0이 아니면 numCheckUpdated값을 현재  ${num.index}+1 >);
				} else {
					$timeline_badge = $("<div class='timeline-badge'><i class='icon-map-pin'></i></div>");
					// 수정된 이력없는 여행지
					$dtimeline_heading.append($timeline_title).append($timeline_company);
					$timeline_panel.append($dtimeline_heading).append($timeline_body);
					$timeline_unverted.append($timeline_badge).append($timeline_panel);
					$('#timeline').append($timeline_unverted);
				}
			}
		</c:forEach>

	});

	function showUpdated(content) {
		var a = $(content).closest('.item');
		var b = $(a).hasClass('open');
		var c = $(a).closest('#accordion').find('.open');

		if (b != true) {
			$(c).find('.content').slideUp(200);
			$(c).removeClass('open');
		}
		$(a).toggleClass('open');
		$(a).find('.content').slideToggle(200);
	}

</script>
</head>
<body>
<c:set var="routename" value="${routename }" />
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
				<div class="row">
					<div class="col-md-12 col-md-offset-0" id = "start"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>
</body>