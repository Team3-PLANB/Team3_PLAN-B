<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%--
@Project : PLANB_JEJU
@File name : step.jsp 
@Author : 강나영
@Data : 2017.06.16. 
@Desc : 여행 일정, 파트너, 취향 선택 페이지
--%>


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
<link rel="stylesheet" href="css/step-radio.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		/* 
		$('#routeDaysCount').text('총 10일');	 */
	
		<%----------------------------------Tab 간의 PREV, NEXT 버튼 클릭시 탭 디자인 표현 클래스 적용 / NULL값 validation ----------------------------------------%>

		$('#stepOneNextBtn').click(function() {
			
			/* Tab 디자인 클래스 적용 */
			$('#step1Nav').removeClass('active');
			$('#step1').removeClass('active');
			$('#step2Nav').addClass('active');
			$('#step2').addClass('active');
			
			
			/* 여행 시작일 NULL값 처리(현재 시간으로 값 넣어두기)  */
			if($('#date-start').val() == ''){
			
				var fullDate = new Date();
				$('#date-start').val(fullDate);
			}
			
			/* 여행 마침일 NULL값 처리(현재 시간으로 값 넣어두기)  */
			if($('#date-end').val() == ''){
				
				//Thu May 19 2011 17:25:38 GMT+1000 {}
				$('#date-end').val(fullDate);
			}
		});
		
		$('#stepTwoPrevBtn').click(function() {
			$('#step2Nav').removeClass('active');
			$('#step2').removeClass('active');
			$('#step1Nav').addClass('active');
			$('#step1').addClass('active');
		});
		$('#stepTwoNextBtn').click(function() {
			$('#step2Nav').removeClass('active');
			$('#step2').removeClass('active');
			$('#step3Nav').addClass('active');
			$('#step3').addClass('active');
			
			/* 파트너 선택 안했을 시 자동으로 파트너 친구로 지정 */
			if($('#partner_code').val()==''){
				$('#partner_code').val('P02');
			}
		});
		$('#stepThreePrevBtn').click(function() {
			$('#step3Nav').removeClass('active');
			$('#step3').removeClass('active');
			$('#step2Nav').addClass('active');
			$('#step2').addClass('active');
		});
		
		
		<%----------------------------------파트너 div 선택 시 -> 파트너  값 가져오기 ----------------------------------------%>
		$('.partner-radio').click(function(){ 
		    $(this).parent().find('.partner-radio').removeClass('selected');
		    $(this).addClass('selected');
		    
		    $('#partner_code').val($(this).attr('data-value'));
		});
		
		
	});
	
	<%----------------------------------submit 버튼 클릭시 action 경로 처리 ----------------------------------------%>
	function Submit(index) {
	    if (index == 1) {
		    /*   document.myForm.action="${pageContext.request.contextPath}/PLANA.recommend.do"; //실패한 방법*/
		    //$('#[아이디]').attr("action","[경로]");
	    	$("#form").attr("action", "${pageContext.request.contextPath}/PLANA.recommend.do");
	    }
	    
	    /* 여행 이름 없을 경우 자동 생성 */
	    if($('#routename').val()==''){
	    	$('#routename').val('제주도 여행 실화냐');
	    }
	    /* document.myForm.submit(); //실패한 방법 */
	    /* alert($('#date-start').val());
	    alert($('#date-end').val());
	    alert($('#partner_code').val());
	    alert($('#routename').val()); //값 확인 용 alert창*/
	    
	    $('#form').submit();
	  }
</script>



	<form action="" method="post" id="form">

		<div id="fh5co-wrapper">
			<div id="fh5co-page">
				<div class="fh5co-hero">
					<div class="fh5co-overlay"></div>

					<div class="fh5co-cover" data-stellar-background-ratio="0.5"
						style="background-image: url(&quot;images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
						<div class="desc">
							
							<div class="container">
								<div class="row">
									<!-- <div class="col-sm-5 col-md-5"> -->
									<div class="tabulation animate-box fadeInUp animated">

										<!-- Nav tabs -->
										<ul class="nav nav-tabs" role="tablist">
											<li role="presentation" class="active" id="step1Nav"><a
												href="#step1" aria-controls="flights" role="tab"
												data-toggle="tab">STEP1 - 여행 일정</a></li>
											<li role="presentation" id="step2Nav"><a href="#step2"
												aria-controls="hotels" role="tab" data-toggle="tab">STEP2
													- 여행 파트너</a></li>
											<li role="presentation" id="step3Nav"><a href="#step3"
												aria-controls="packages" role="tab" data-toggle="tab">STEP3
													- 여행 취향</a></li>
													
											<li role="presentation" id="step4Nav">
										</ul>

										<!-- Tab panes -->
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="step1">
												<div class="row">
													<div class="col-xxs-12 col-xs-6 mt alternate">
														<div class="input-field">
															<img alt="" src="images/calendar.png" width="100"><label
																for="date-start">출발일 : </label> 
																<input type="text"
																class="form-control" id="date-start"
																name="sday"
																placeholder="mm/dd/yyyy">
														</div>
													</div>
													<div class="col-xxs-12 col-xs-6 mt alternate">
														<div class="input-field">

															<img alt="" src="images/calendar.png" width="100"
																align="center"><label for="date-end">도착일 :
															</label> 
															<input type="text" class="form-control" id="date-end"
															name="eday"
																placeholder="mm/dd/yyyy">
														</div>
													</div>
													<div class="col-xxs-12 col-xs-12 mt">
														<h3 align="center" id="routeDaysCount" style="color: #807f7d;"></h3>
													</div>

													<div class="col-xs-12 btn btn-primary">
														<a href="#step2" id="stepOneNextBtn"
															aria-controls="hotels" role="tab" data-toggle="tab"
															style="color: white;">NEXT</a>
													</div>

													<!-- </div> -->
												</div>
											</div>







									
											<!-- 파트너 -->
											<div role="tabpanel" class="tab-pane" id="step2">
												<div class="row">
												<div class="partner-radio-group">
												
													
													<div class="col-xxs-12 col-xs-6 mt partner-radio" data-value="P04">
														<div class="input-field" align="center">
															<img alt="" src="images/alone.png" width="100"> <br>
															<p style="color: #807f7d;">혼자
														</div>
													</div>
													
													<div class="col-xxs-12 col-xs-6 mt partner-radio" data-value="P02">
														<div class="input-field" align="center">
															<img alt="" src="images/friend.png" width="100"> <br>
															<p style="color: #807f7d;">친구와
														</div>
													</div>
													
													<div class="col-xxs-12 col-xs-6 mt partner-radio" data-value="P03">
														<div class="input-field" align="center">
															<img alt="" src="images/couple.png" width="100"> <br>
															<p style="color: #807f7d;">연인과
														</div>
													</div>
													
													<div class="col-xxs-12 col-xs-6 mt partner-radio" data-value="P01">
														<div class="input-field" align="center">
															<img alt="" src="images/family.png" width="100"> <br>
															<p style="color: #807f7d;">가족과
														</div>
													</div>
													
													<!-- 파트너  값 저장해 둘 hidden 태그-->
													<input type="hidden" id="partner_code" name="partner_code">
												

													</div>
													
													<div class="col-xxs-12 col-xs-6 btn btn-primary">
														<a href="#step1" id="stepTwoPrevBtn"
															aria-controls="flights" role="tab" data-toggle="tab"
															style="color: white;">PREV</a>
													</div>

													<div class="col-xxs-12 col-xs-6  btn btn-primary">
														<a href="#step3" id="stepTwoNextBtn"
															aria-controls="flights" role="tab" data-toggle="tab"
															style="color: white;">NEXT</a>
													</div>
													
												</div>
											</div>
											
									


















											<!-- 취미 -->
											<div role="tabpanel" class="tab-pane" id="step3">
												<div class="row">
													<div class="col-xxs-12 col-xs-12 mt">
														<div class="input-field" align="center">
															
																
															<label for="checkbox-1">쇼핑</label> 
															<input type="checkbox"
																name="personal" id="checkbox-1" value="A0401" checked="true"> 
															
															<label
																for="checkbox-2">맛집</label> 
															<input type="checkbox"
																name="personal" id="checkbox-2" value="A0502">
															
															<label
																for="checkbox-7">자연</label> 
															<input type="checkbox"
																name="personal" id="checkbox-7" value="A0101">
																
															<label
																for="checkbox-8">역사관광</label> 
															<input type="checkbox"
																name="personal" id="checkbox-8" value="A0201">
																
															<label
																for="checkbox-9">힐링</label> 
															<input type="checkbox"
																name="personal" id="checkbox-9" value="A0202">
																
															<label
																for="checkbox-10">체험</label> 
															<input type="checkbox"
																name="personal" id="checkbox-10" value="A0203">
																
															<label
																for="checkbox-11">산업관광</label> 
															<input type="checkbox"
																name="personal" id="checkbox-11" value="A0204">
																
															<label
																for="checkbox-12">건축/조형</label> 
															<input type="checkbox"
																name="personal" id="checkbox-12" value="A0205">
																
															<label
																for="checkbox-13">문화시설</label> 
															<input type="checkbox"
																name="personal" id="checkbox-13" value="A0206">
															
															<label
																for="checkbox-14">축제</label> 
															<input type="checkbox"
																name="personal" id="checkbox-14" value="A0207">
									
															<label
																for="checkbox-15">행사/공연</label> 
															<input type="checkbox"
																name="personal" id="checkbox-15" value="A0208"> <br> 
															
															<label
																for="checkbox-4">육상 레포츠</label> 
															<input type="checkbox"
																name="personal" id="checkbox-4" value="A0302"> <br>
															
															<label
																for="checkbox-5">수상 레포츠</label> 
															<input type="checkbox"
																name="personal" id="checkbox-5" value="A0303"> <br>
															
															<label
																for="checkbox-6">항공 레포츠</label> 
															<input type="checkbox"
																name="personal" id="checkbox-6" value="A0304"> <br>
															
															<label
																for="checkbox-3">복합 레포츠</label> 
															<input type="checkbox"
																name="personal" id="checkbox-3" value="A0305">
															
															
														</div>
													</div>
													
													<div class="col-xxs-12 col-xs-6 btn btn-primary">
														<a href="#step2" id="stepThreePrevBtn"
															aria-controls="flights" role="tab" data-toggle="tab"
															style="color: white;">PREV</a>
													</div>
													
													<div class="col-xxs-12 col-xs-6 btn btn-primary">
														<a href="#step4" id="stepThreeNextBtn"
															aria-controls="hotels" role="tab" data-toggle="tab"
															style="color: white;">NEXT</a>
													</div>
													
													
												</div>
											</div>
											
											
											
											<!-- 여행 이름 설정 Tab -->
											<div role="tabpanel" class="tab-pane" id="step4">
												<div class="row">
													<div class="col-xxs-12 col-xs-6 mt alternate">
														<div class="input-field">
														
															<input type="text" class="form-control" id="routename"
															name="routename"
																placeholder="여행 이름을 정해주세요">
														</div>
													</div>
													
													<div class="col-xxs-12 col-xs-6 mt">
														<input type="submit" 
															class="btn btn-primary btn-block"
															value="내 경로 만들기" onclick='Submit()'> 
														<input type="submit"
															class="btn btn-primary btn-block" 
															value="경로 추천 받기" onclick='Submit(1)'>
													</div>

													<!-- </div> -->
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

	</form>
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

