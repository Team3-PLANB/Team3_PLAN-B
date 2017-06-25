<%--
@Project : PLANB_JEJU
@File name : postscriptWrite.jsp 
@Author : 임정연 & 정다혜
@Data : 2017.06.17 & 2017.06.22
@ Last Edit : 2017.06.25
@Desc : 후기 작성 페이지
--%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B &mdash; JEJU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	
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
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 
 
 
 
<!-- 갤러리 등록을 위한 css  -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/dist/styles.imageuploader.css" rel="stylesheet" type="text/css">



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


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/demos/style.css">


<!-- <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script> -->

<!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script> -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <link rel="shortcut icon" href="favicon.ico"> -->

 <link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>



<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/icomoon.css">
	
	
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
	
	
<!-- Superfish -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/superfish.css">
	
	
<!-- histroy css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/history.css">
	
<!-- 체크박스 css -->	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PlanA/checkbox-bootstrap.css">

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
		
		
		
		
		
		
		
		// 일정 Drag 박스 empty 적용
    	$('#accordion2').empty();
    	
    	
    	// Map위에 해당 경로 출력
    	<c:forEach var="item" items="${requestScope.routeMap}" varStatus="num"> 
	    		//JsonArray로 경로의 각 Site 내용 정리
				//이전 routeDetailList 내용 비우기
				routeDetailList = [];
				<c:forEach var="i" items="${item.value}" varStatus="num">
					
					routeDetailList.push({
												"route_code" : '${i.route_code}',
												"username" : '${i.username}',
												"route_order" : '${i.route_order}',
												"route_date" : '${i.route_date}',
												"site" : '${i.site}',
												"lon" : '${i.lon}',
												"lat" : '${i.lat}',
												"category" : '${i.category}',
												"stime" : '${i.stime}',
												"etime" : '${i.etime}'
					});	         	
			    </c:forEach>
				 
				
				
				
				
				
				
				/* Start : 여행지 일정표 정리 */
	         	
		         var dayOrder=0;
		         
		         var routedate;
		         
				 
		         <c:forEach var="i" items="${item.value}" varStatus="num">
					
		         	// 날짜 별 Drag 박스 생성
		         	if(routedate!='${i.route_date}'){
		         		routedate = '${i.route_date}';
		         		++dayOrder;
		         		
		         		var $group = $("<div class='group' style='width: 280px;'></div>");
		         		var $h3 = $("<h3 class='ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons'>Day"+dayOrder+"</h3>");
		         		var $div = $("<div class='ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active'></div>");
		         		var $sortablediv = $("<div class='sortable' id='ScheduleDay"+dayOrder+"'></div>");
		         		
		         		$sortablediv.appendTo($div);
		         		$group.append($h3).append($div);
		         		$('#accordion2').append($group);
		         	
		         	}
					
					// 각 Day 안에 Site 순서대로 append
					var contentId= routedate+'${i.route_order}';
					
					
					
					var $sch_content = $( "<div class='sch_content' id='"+contentId+"' style='width: 250px;'></div>" );
					var $content_img = $("<img src='http://img.earthtory.com/img/place_img/312/7505_0_et.jpg' class='spot_img' style='cursor: pointer;'>");
					var $spot_content_box = $("<div class='spot_content_box' style='width: 150px;'></div>");
					var $spot_name = $("<div class='spot_name' style='cursor: pointer;'>"+${i.route_order}+"</div>");
					var $spot_info = $("<div class='spot_info'></div>");
					var $tag = $("<div class='tag'>"+'${i.site}'+"</div>");
					var $sinfo_line = $("<div class='sinfo_line'></div>");
					var $sinfo_txt = $("<div class='sinfo_txt' style='padding: 0px'></div>");
					var $sinfo_txt_img = $("<img src='<%=request.getContextPath()%>/css/history/like.png' style='height: 20px'> 6 / 10 <span>좋아요</span>");
					var $delete_tag = $("<div class='tag route_site_delete_tag'>X</div>");
					
					// 각 Day div id 변수로 선언
					var scheduleday = '#'+'ScheduleDay'+dayOrder;
					
					// div에 data값 삽입
					$sch_content.data('sitedata', routeDetailList[${num.index}]);
					
					//li.data('d', locations[i])
					
					 $sinfo_txt_img.appendTo($sinfo_txt);
					 
					 
					 $tag.appendTo($spot_info);
					 $sinfo_line.appendTo($spot_info);
					 $sinfo_txt.appendTo($spot_info);
					 $delete_tag.appendTo($spot_info);
					 
					 $spot_name.appendTo($spot_content_box);
					 $spot_info.appendTo($spot_content_box);
					 
					 $content_img.appendTo($sch_content);
					 $spot_content_box.appendTo($sch_content);
					 /* $sch_content.appendTo($li); */
					 
					 //
					 
					 $(scheduleday).append($sch_content);
					
					
				
			    //정보 저장을 위해 form 태그 안에 값으로 추가       routeDetailList[num] : RouteDetail에 멤버필드 ArrayList
				$('#route_list_form_innerdiv').empty();
				var $route_order = $("<input type='hidden' name='routeDetailList[${num.index}].route_order' value=${i.route_order}>");
				var $username = $("<input type='hidden' name='routeDetailList[${num.index}].username' value='${i.username}'>");
				var $route_code = $("<input type='hidden' name='routeDetailList[${num.index}].route_code' value=${i.route_code}>");
				var $route_date = $("<input type='hidden' name='routeDetailList[${num.index}].route_date' value='${i.route_date}'>");
				var $site = $("<input type='hidden' name='routeDetailList[${num.index}].site' value='${i.site}'>");
				var $lon = $("<input type='hidden' name='routeDetailList[${num.index}].lon' value='${i.lon}'>");
				var $lat = $("<input type='hidden' name='routeDetailList[${num.index}].lat' value='${i.lat}'>");
				var $category = $("<input type='hidden' name='routeDetailList[${num.index}].category' value='${i.category}'>");
				var $stime = $("<input type='hidden' name='routeDetailList[${num.index}].stime' value=${i.stime}>");
				var $etime = $("<input type='hidden' name='routeDetailList[${num.index}].etime' value=${i.etime}>");
				
				
				$('#route_list_form_innerdiv').append($route_order).append($username).append($route_code).append($route_date).append($site).append($lon).append($lat).append($category).append($stime).append($etime);
					
					 
				 </c:forEach>
			       
				
		         
		         
				 /* End : 여행지 일정표 정리 */
				
			};	
			
		</c:forEach>

	});

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
							onerror="this.src='${pageContext.request.contextPath}/res/img/common/no_img/sight55.png';"
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
									<img src="${pageContext.request.contextPath}/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
					</div>

					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='${pageContext.request.contextPath}/res/img/common/no_img/sight55.png';"
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
									<img src="${pageContext.request.contextPath}/css/history/like.png"
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
							onerror="this.src='${pageContext.request.contextPath}/res/img/common/no_img/sight55.png';"
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
									<img src="${pageContext.request.contextPath}/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="${pageContext.request.contextPath}/css/history/map_ico.png"
								alt="" class="spot_btn map_view"
								onclick="set_center(33.51010100,126.48125500)">
						</div>
					</div>
					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='${pageContext.request.contextPath}/res/img/common/no_img/sight55.png';"
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
									<img src="${pageContext.request.contextPath}/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
						<div class="spot_btn_box">
							<img src="${pageContext.request.contextPath}/css/history/map_ico.png"
								alt="" class="spot_btn map_view"
								onclick="set_center(33.51010100,126.48125500)">
						</div>
					</div>
					<div class="sch_content" style="width: 280px;">
						<img
							src="http://img.earthtory.com/img/place_img/312/7505_0_et.jpg"
							alt="" class="spot_img"
							onerror="this.src='${pageContext.request.contextPath}/res/img/common/no_img/sight55.png';"
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
									<img src="${pageContext.request.contextPath}/css/history/like.png"
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
							<img src="${pageContext.request.contextPath}/css/history/map_ico.png"
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
	style="float: left; position: relative; bottom: 522px; left: 450px;width:67%">
	<div class="row">
		<div class="col-sm-5 col-md-12">
			<div class="tabulation animate-box fadeInUp animated">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#routePost" aria-controls="route" role="tab" data-toggle="tab">루트 후기 작성</a>
					</li>
					<li role="presentation">
						<a href="#sitePost" aria-controls="site" role="tab" data-toggle="tab">여행지 후기 작성</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="routePost">
						<div class="table-responsive">
							<form action="${pageContext.request.contextPath}/PostScript/Route/WriteOk.do?route_code=${route.getRoute_code()}" method="POST">
								<div role="tabpanel" class="tab-pane active" id="route">
									<input type="text" class="form-control" value="${route.getRoutename()}" name="routename" readonly><br>
									<textarea class="form-control" id="comment" name="comment" cols="30" rows="7" placeholder="후기를 작성해주세요.( #해쉬태그 사용가능 )"></textarea>
									<br>
									<div align="center">
										<input type="submit" value="작성 완료" class="btn btn-primary">
									</div>
								</div>
							</form>
						</div>
					</div>


					<div role="tabpanel" class="tab-pane" id="sitePost">
						<div class="table-responsive">
							<section role="main" class="l-main">
								<div class="uploader__box js-uploader__box l-center-box">
									<form action="your/nonjs/fallback/" method="POST">
										<div class="uploader__contents">
											<label class="button button--secondary" for="fileinput">ImageFiles</label> 
											<input id="fileinput" class="uploader__file-input" type="file" multiple value="Select Files">
										</div>
										<input class="button button--big-bottom" type="submit" value="Upload Selected Files">
							  	  </form>
							    </div>
							</section>
		
		
		
							<!--
							 이새끼 충돌
							 <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
							 -->
							 
							<script src="${pageContext.request.contextPath}/dist/jquery.imageuploader.js"></script>
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
									var s = document.getElementsByTagName('script')[0];
									s.parentNode.insertBefore(ga, s);
								})();
							</script>


							<br> 
							<input type="text" class="form-control" value=""><br>
							<textarea name="" class="form-control" id="" cols="30" rows="7" placeholder="후기를 작성해주세요.( #해쉬태그 사용가능 )"></textarea>
							<br>
							<div align="center">
								<div class="checkbox">
									<img alt="" src="${pageContext.request.contextPath}/images/PostScript/003-sun.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="aaa" type="checkbox" value="1" onclick="doOpenCheck(this);"> 
										<span class="checkbox-placeholder"></span> 맑음
									</label>&nbsp;&nbsp;&nbsp; 
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="aaa" type="checkbox" value="2" onclick="doOpenCheck(this);"> 
										<span class="checkbox-placeholder"></span> 흐림
									</label>&nbsp;&nbsp;&nbsp;
								</div>
								<br>
								<div class="checkbox">
									<img alt="" src="${pageContext.request.contextPath}/images/PostScript/002-money.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="bbb" type="checkbox" value="1" onclick="doOpenCheck2(this);"> 
											<span class="checkbox-placeholder"></span> 부족
									</label>&nbsp;&nbsp;&nbsp; 
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="bbb" type="checkbox" value="2" onclick="doOpenCheck2(this);"> 
										<span class="checkbox-placeholder"></span> 적당
									</label>&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg">
										<input name="bbb" type="checkbox" value="3" onclick="doOpenCheck2(this);"> 
										<span class="checkbox-placeholder"></span> 풍족
									</label>
								</div>
								<br>
								<div class="checkbox">
									<img alt="" src="${pageContext.request.contextPath}/images/PostScript/001-hospital.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg"> 
									<input name="ccc" type="checkbox" value="1" onclick="doOpenCheck3(this);"> 
										<span class="checkbox-placeholder"></span> 양호
									</label>&nbsp;&nbsp;&nbsp; 
									<label class="checkbox-bootstrap checkbox-lg"> 
										<input name="ccc" type="checkbox" value="2" onclick="doOpenCheck3(this);"> 
										<span class="checkbox-placeholder"></span> 쏘쏘
									</label>&nbsp;&nbsp;&nbsp;
									<label class="checkbox-bootstrap checkbox-lg">
										<input name="ccc" type="checkbox" value="3" onclick="doOpenCheck3(this);"> 
										<span class="checkbox-placeholder"></span> 악화
									</label>
								</div>
							</div>
							<br>
							<div align="center">
								<input type="submit" value="작성 완료" class="btn btn-primary btn-block">
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>







<div style="background-color: white; width: 450px;" id="schedulebox2">
	<!-- 이놈은 아님 -->
	<div id="accordion1" style="overflow: auto; width: 450px;" />
	<div id="accordion2"
		style="overflow: auto; width: 450px; height: 650px;">
		
		<div class="group" style="width: 280px;">
			<h3>DAY 1</h3>
			<!--min-height   -->
			<div>
				<div class="sortable">
					<div class="sch_content" style="width: 250px;">
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
									<img src="${pageContext.request.contextPath}/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="sch_content" style="width: 250px;">
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
									<img src="${pageContext.request.contextPath}/css/history/like.png"
										style="height: 20px"> 6 / 10 <span>1개의 평가</span>
								</div>
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

