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

<script src="${pageContext.request.contextPath}/js/postscript/write.js"></script>



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

 <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'	rel='stylesheet' type='text/css'>



<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
	
	
<!-- Bootstrap  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	
	
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
		$(document).ready(function(){
			var routeOrder = 0;
			var dayOrder = 0;
			var $group;
			var $h3;
			var $div;
			var $sortablediv;
			var contentId;
			var $sch_content;
			var $content_img;
			var $spot_content_box;
			var $spot_name;
			var $spot_info;
			var $tag;
			var $sinfo_line;
			var $sinfo_txt;
			var $sinfo_txt_img;
			var scheduleday;
			
			<c:forEach var="routeDetail" items="${routeDetailList}">
				if(routeOrder != ${routeDetail.route_order}){
					dayOrder++;
					$group = $("<div class='group' style='width:400px;'></div>");
		     		$h3 = $("<h3 class='ui-accordion-header ui-corner-top ui-state-default ui-accordion-header-active ui-state-active ui-accordion-icons'>Day " + dayOrder + " : ${routeDetail.getRoute_date()}</h3>");
		     		$div = $("<div class='ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active'></div>");
		     		$sortablediv = $("<div class='sortable' id='ScheduleDay"+dayOrder+"'></div>");
		     		
		     		$sortablediv.appendTo($div);
		     		$group.append($h3).append($div);
		     		$('#accordion2').append($group);
		     		routeOrder=1;
		     		
		     		console.log(routeOrder);
				}
				
				// 각 Day 안에 Site 순서대로 append
				console.log("으악");
				$sch_content = $("<div class='sch_content' style='width: 280px;'></div>" );
				$content_img = $("<img src='http://img.earthtory.com/img/place_img/312/7505_0_et.jpg' class='spot_img' style='cursor: pointer;'>");
				$spot_content_box = $("<div class='spot_content_box' style='width: 150px;'></div>");
				$spot_name = $("<div class='spot_name' style='cursor: pointer;'> ${routeDetail.site} </div>");
				$spot_info = $("<div class='spot_info'></div>");
				$tag = $("<div class='tag'> ${routeDetail.category} </div>");
				$sinfo_line = $("<div class='sinfo_line'></div>");
				$sinfo_txt = $("<div class='sinfo_txt' style='padding: 0px'></div>");
				$sinfo_txt_img = $("<img src='${pageContext.request.contextPath}/css/history/like.png' style='height: 20px'> 6 / 10 <span>좋아요</span>");
				
				$sinfo_txt_img.appendTo($sinfo_txt);
				$tag.appendTo($spot_info);
				$sinfo_line.appendTo($spot_info);
				$sinfo_txt.appendTo($spot_info);
				$spot_name.appendTo($spot_content_box);
				$spot_info.appendTo($spot_content_box);
				$content_img.appendTo($sch_content);
				$spot_content_box.appendTo($sch_content);
				
				scheduleday = "#ScheduleDay" + dayOrder;
				console.log(scheduleday);
				$(scheduleday).append($sch_content);
				
				routeOrder ++;
				console.log(routeOrder);
			</c:forEach>
		
		});
				
	</script>

</head>




<%----------------------------------일정 짜기 부분 ----------------------------------------%>

<div style="background-color: white; width: 450px;" id="schedulebox2">
	<div id="accordion2" style="overflow: auto; width: 450px; height: 650px;">
		
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

</body>

</html>

