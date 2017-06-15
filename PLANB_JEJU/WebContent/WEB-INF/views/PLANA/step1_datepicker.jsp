<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
<title>PLAN'B &mdash; JEJU</title>
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


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
<script type="text/javascript">
	$(document).ready(function(){
		$('#stepOneNextBtn').click(function(){
			 $('#step1Nav').removeClass('active');
			 $('#step1').removeClass('active');
			 $('#step2Nav').addClass('active');
			 $('#step2').addClass('active');
		});
		$('#stepTwoPrevBtn').click(function(){
			 $('#step2Nav').removeClass('active');
			 $('#step2').removeClass('active');
			 $('#step1Nav').addClass('active');
			 $('#step1').addClass('active');
		});
		$('#stepTwoNextBtn').click(function(){
			 $('#step2Nav').removeClass('active');
			 $('#step2').removeClass('active');
			 $('#step3Nav').addClass('active');
			 $('#step3').addClass('active');
		});
		$('#stepThreePrevBtn').click(function(){
			 $('#step3Nav').removeClass('active');
			 $('#step3').removeClass('active');
			 $('#step2Nav').addClass('active');
			 $('#step2').addClass('active');
		});
	});

</script>



</head>

<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div class="fh5co-hero">
				<div class="fh5co-overlay"></div>

				<div class="fh5co-cover" data-stellar-background-ratio="0.5"
					style="background-image: url(&quot;images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
					<div class="desc">
						<!-- <div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>일정 만들기</h3>
							<br> <br> <br>
						</div> -->
						<div class="container">
							<div class="row">
								<!-- <div class="col-sm-5 col-md-5"> -->
								<div class="tabulation animate-box fadeInUp animated">

									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active" id="step1Nav">
											<a href="#step1" aria-controls="flights" role="tab" data-toggle="tab">STEP1 - 여행 일정</a>
										</li>
										<li role="presentation" id="step2Nav">
											<a href="#step2" aria-controls="hotels" role="tab" data-toggle="tab">STEP2 - 여행 파트너</a>
										</li>
										<li role="presentation" id="step3Nav">
											<a href="#step3" aria-controls="packages" role="tab" data-toggle="tab">STEP3 - 여행 취향</a>
										</li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="step1">
											<div class="row">
												<div class="col-xxs-12 col-xs-6 mt alternate">
													<div class="input-field">
														<img alt="" src="images/calendar.png" width="100"><label
															for="date-start">출발일 : </label> <input type="text"
															class="form-control" id="date-start"
															placeholder="mm/dd/yyyy">
													</div>
												</div>
												<div class="col-xxs-12 col-xs-6 mt alternate">
													<div class="input-field">

														<img alt="" src="images/calendar.png" width="100"
															align="center"><label for="date-end">도착일 :
														</label> <input type="text" class="form-control" id="date-end"
															placeholder="mm/dd/yyyy">
													</div>
												</div>
												<div class="col-xxs-12 col-xs-12 mt">
													<h3 align="center" style="color:#807f7d;" >총 7일</h3>
												</div>
												<!-- <div class="col-xs-12"> -->
												<!-- <input type="button" class="btn btn-primary btn-block"
													value="next" onclick="href = '#step2' "> -->
													
												<div  class="col-xs-12 btn btn-primary">
												<a href="#step2" id="stepOneNextBtn" aria-controls="hotels" role="tab" data-toggle="tab" style="color:white;">NEXT</a>
												</div>
												
												<!-- </div> -->
											</div>
										</div>















										<div role="tabpanel" class="tab-pane" id="step2">
											<div class="row">
												<div class="col-xxs-12 col-xs-6 mt">
													<div class="input-field" align="center">
														<img alt="" src="images/alone.png" width="100"> <br>
														<p style="color:#807f7d;">혼자
													</div>
												</div>
												<div class="col-xxs-12 col-xs-6 mt">
													<div class="input-field" align="center">
														<img alt="" src="images/friend.png" width="100"> <br>
														<p style="color:#807f7d;">친구와
													</div>
												</div>
												<div class="col-xxs-12 col-xs-6 mt">
													<div class="input-field" align="center">
														<img alt="" src="images/couple.png" width="100"> <br>
														<p style="color:#807f7d;">연인과
													</div>
												</div>
												<div class="col-xxs-12 col-xs-6 mt">
													<div class="input-field" align="center">
														<img alt="" src="images/family.png" width="100"> <br>
														<p style="color:#807f7d;">가족과
													</div>
												</div>
												
												<div class="col-xxs-12 col-xs-6 btn btn-primary">
													<a href="#step1" id="stepTwoPrevBtn"
											aria-controls="flights" role="tab" data-toggle="tab" style="color:white;">PREV</a>
												</div>
												
												<div class="col-xxs-12 col-xs-6  btn btn-primary">
													<a href="#step3" id="stepTwoNextBtn"
											aria-controls="flights" role="tab" data-toggle="tab" style="color:white;">NEXT</a>
												</div> 
												<!-- <div class="col-xxs-12 col-xs-6 mt">
													<input type="submit" class="btn btn-primary btn-block"
														value="next">
												</div>  -->
											</div>
										</div>



											
												














										<div role="tabpanel" class="tab-pane" id="step3">
											<div class="row">
												<div class="col-xxs-12 col-xs-12 mt">
													<div class="input-field" align="center">
														<label for="checkbox-1">쇼핑</label> <input type="checkbox"
															name="checkbox-1" id="checkbox-1"> <label
															for="checkbox-2">행사/공연/축제</label> <input type="checkbox"
															name="checkbox-2" id="checkbox-2"> <br>
														<label for="checkbox-3">관광지</label> <input type="checkbox"
															name="checkbox-3" id="checkbox-3"> <label
															for="checkbox-4">레포츠</label> <input type="checkbox"
															name="checkbox-4" id="checkbox-4"> <br>
														<label for="checkbox-5">문화시설</label> <input
															type="checkbox" name="checkbox-5" id="checkbox-5">
														<label for="checkbox-6">맛집</label> <input type="checkbox"
															name="checkbox-6" id="checkbox-6">
													</div>
												</div>
												<div class="col-xxs-12 col-xs-6 btn btn-primary">
													<a href="#step2" id="stepThreePrevBtn"
													   aria-controls="flights" role="tab" data-toggle="tab" style="color:white;">PREV</a>
												</div>
												<div class="col-xxs-12 col-xs-6 mt">
													<input type="submit" class="btn btn-primary btn-block" value="경로 추천 받기"> 
													<input type="submit" class="btn btn-primary btn-block" value="내 경로 만들기">
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