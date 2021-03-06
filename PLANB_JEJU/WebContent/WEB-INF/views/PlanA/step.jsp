<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%--
@Project : PLANB_JEJU
@File name : step.jsp 
@Author : 강나영, 임정연
@Data : 2017.06.16. 
@Desc : 여행 일정, 파트너, 취향 선택 페이지
--%>

<%-- 
<link rel="shortcut icon" href="favicon.ico">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/superfish.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-skin-border.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PlanA/step-radio.css">
<!-- 체크박스를 위한 css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PlanA/checkbox-bootstrap.css">

<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
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
							if ($('#date-start').val() == '') {

								var fullDate = new Date();
								$('#date-start').val(fullDate);
							}

							/* 여행 마침일 NULL값 처리(현재 시간으로 값 넣어두기)  */
							if ($('#date-end').val() == '') {

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
							if ($('#partner_code').val() == '') {
								$('#partner_code').val('P02');
							}
						});
						$('#stepThreePrevBtn').click(function() {
							$('#step3Nav').removeClass('active');
							$('#step3').removeClass('active');
							$('#step2Nav').addClass('active');
							$('#step2').addClass('active');
						});
						$('#stepThreeNextBtn').click(function() {
							$('#step3Nav').removeClass('active');
							$('#step3').removeClass('active');
							$('#step4Nav').addClass('active');
							$('#step4').addClass('active');
						});
<%----------------------------------파트너 div 선택 시 -> 파트너  값 가져오기 ----------------------------------------%>
	$('.partner-radio').click(
								function() {
									$(this).parent().find('.partner-radio')
											.removeClass('selected');
									$(this).addClass('selected');

									$('#partner_code').val(
											$(this).attr('data-value'));
								});

					});
<%----------------------------------submit 버튼 클릭시 action 경로 처리 ----------------------------------------%>
	function Submit(index) {
		if (index == 1) {
			/*   document.myForm.action="${pageContext.request.contextPath}/PLANA.recommend.do"; //실패한 방법*/
			//$('#[아이디]').attr("action","[경로]");
			$("#form").attr("action",
					"${pageContext.request.contextPath}/PLANA.recommend.do");
		}

		/* 여행 이름 없을 경우 자동 생성 */
		if ($('#routename').val() == '') {
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
				<div class="fh5co-cover" data-stellar-background-ratio="0.5">
					<div class="desc">
						<div class="container" style="margin-top: 90px;">
							<div class="row">
								<div class="tabulation animate-box fadeInUp animated">

									<%----------------------------------tab 나누기 ----------------------------------------%>
									<ul class="nav nav-tabs" role="tablist">

										<li role="presentation" class="active" id="step1Nav"><a
											href="#step1" aria-controls="a" role="tab" data-toggle="tab">STEP1
												- 여행 일정</a></li>

										<li role="presentation" id="step2Nav"><a href="#step2"
											aria-controls="b" role="tab" data-toggle="tab">STEP2 - 여행
												파트너</a></li>

										<li role="presentation" id="step3Nav"><a href="#step3"
											aria-controls="c" role="tab" data-toggle="tab">STEP3 - 여행
												취향</a></li>

										<li role="presentation" id="step4Nav"><a href="#step4"
											aria-controls="d" role="tab" data-toggle="tab">STEP4 - 나의
												여행 경로 만들기</a></li>
									</ul>

									<%----------------------------------STEP1 - 여행 일정 ----------------------------------------%>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="step1">
											<div class="row">
												<div class="col-xxs-12 col-xs-6 mt alternate">
													<div class="input-field">
														<img alt=""
															src="${pageContext.request.contextPath}/images/PlanA/calendar.png"
															width="100"><label for="date-start">출발일 : </label>
														<input type="text" class="form-control" id="date-start"
															name="sday" placeholder="mm/dd/yyyy">
													</div>
												</div>
												<div class="col-xxs-12 col-xs-6 mt alternate">
													<div class="input-field">
														<img alt=""
															src="${pageContext.request.contextPath}/images/PlanA/calendar.png"
															width="100" align="center"><label for="date-end">도착일
															: </label> <input type="text" class="form-control" id="date-end"
															name="eday" placeholder="mm/dd/yyyy">
													</div>
												</div>
												<div class="col-xxs-12 col-xs-12 mt">
													<h3 align="center" id="routeDaysCount"
														style="color: #807f7d;"></h3>
												</div>

												<div class="col-xxs-12 col-xs-4 mt alternate"></div>
												<div class="col-xs-4 btn btn-primary" href="#step2"
													id="stepOneNextBtn" aria-controls="b" role="tab"
													data-toggle="tab">NEXT</div>
												<div class="col-xxs-12 col-xs-4 mt alternate"></div>

											</div>
										</div>








										<%----------------------------------STEP2 - 여행 파트너 ----------------------------------------%>
										<div role="tabpanel" class="tab-pane" id="step2">
											<div class="row">
												<div class="partner-radio-group">
													<div class="col-xxs-12 col-xs-6 mt partner-radio"
														data-value="P04">
														<br>
														<div class="input-field" align="center">
															<img alt=""
																src="${pageContext.request.contextPath}/images/PlanA/alone.png"
																width="100"> <br>
															<p style="color: #807f7d;">
																<strong>혼자</strong>
															</p>
														</div>
													</div>

													<div class="col-xxs-12 col-xs-6 mt partner-radio"
														data-value="P02">
														<br>
														<div class="input-field" align="center">
															<img alt=""
																src="${pageContext.request.contextPath}/images/PlanA/friend.png"
																width="100"> <br>
															<p style="color: #807f7d;">
																<strong>친구와</strong>
															</p>
														</div>
													</div>

													<div class="col-xxs-12 col-xs-6 mt partner-radio"
														data-value="P03">
														<br>
														<div class="input-field" align="center">
															<img alt=""
																src="${pageContext.request.contextPath}/images/PlanA/couple.png"
																width="100"> <br>
															<p style="color: #807f7d;">
																<strong>연인과</strong>
															</p>
														</div>
													</div>

													<div class="col-xxs-12 col-xs-6 mt partner-radio"
														data-value="P01">
														<br>
														<div class="input-field" align="center">
															<img alt=""
																src="${pageContext.request.contextPath}/images/PlanA/family.png"
																width="100"> <br>
															<p style="color: #807f7d;">
																<strong>가족과</strong>
															</p>
														</div>
													</div>

													<!-- 파트너  값 저장해 둘 hidden 태그-->
													<input type="hidden" id="partner_code" name="partner_code">


												</div>
												<br>
												<div class="col-xxs-12 col-xs-4 btn btn-primary"
													href="#step1" id="stepTwoPrevBtn" aria-controls="a"
													role="tab" data-toggle="tab">PREV</div>

												<div class="col-xxs-12 col-xs-4 mt partner-radio"></div>

												<div class="col-xxs-12 col-xs-4  btn btn-primary"
													href="#step3" id="stepTwoNextBtn" aria-controls="c"
													role="tab" data-toggle="tab">NEXT</div>

											</div>
										</div>




















										<%----------------------------------STEP3 - 여행 취향 ----------------------------------------%>
										<div role="tabpanel" class="tab-pane" id="step3">
											<div class="row">
												<div class="col-xxs-12 col-xs-12 mt alternate"
													style="left: 300px">
													<div class="checkbox">
														<img alt=""
															src="${pageContext.request.contextPath}/images/PlanA/shopping&food.png"
															width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-1"
															value="A0401"> <span class="checkbox-placeholder"></span>
															쇼핑
														</label>&nbsp;&nbsp;&nbsp; <label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-2"
															value="A0502"> <span class="checkbox-placeholder"></span>
															맛집
														</label>
													</div>
													<br>
													<div class="checkbox">
														<img alt=""
															src="${pageContext.request.contextPath}/images/PlanA/mountains.png"
															width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-7"
															value="A0101"> <span class="checkbox-placeholder"></span>
															자연
														</label> &nbsp;&nbsp;&nbsp;<label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-8"
															value="A0201"> <span class="checkbox-placeholder"></span>
															역사관광
														</label>&nbsp;&nbsp;&nbsp; <label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-9"
															value="A0202"> <span class="checkbox-placeholder"></span>
															힐링
														</label> &nbsp;&nbsp;&nbsp;<label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-10"
															value="A0203"> <span class="checkbox-placeholder"></span>
															체험
														</label>&nbsp;&nbsp;&nbsp; <label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-11"
															value="A0204"> <span class="checkbox-placeholder"></span>
															산업관광
														</label>
													</div>
													<br>
													<div class="checkbox">
														<img alt=""
															src="${pageContext.request.contextPath}/images/PlanA/building.png"
															width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-12"
															value="A0205"> <span class="checkbox-placeholder"></span>
															건축/조형
														</label> &nbsp;&nbsp;&nbsp;<label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-13"
															value="A0206"> <span class="checkbox-placeholder"></span>
															문화시설
														</label>
													</div>
													<br>
													<div class="checkbox">
														<img alt=""
															src="${pageContext.request.contextPath}/images/PlanA/festival.png"
															width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-14"
															value="A0207"> <span class="checkbox-placeholder"></span>
															축제
														</label> &nbsp;&nbsp;&nbsp;<label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-15"
															value="A0208"> <span class="checkbox-placeholder"></span>
															행사/공연
														</label>
													</div>
													<br>
													<div class="checkbox">
														<img alt=""
															src="${pageContext.request.contextPath}/images/PlanA/sports.png"
															width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-4"
															value="A0302"> <span class="checkbox-placeholder"></span>
															육상 레포츠
														</label>&nbsp;&nbsp;&nbsp; <label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-5"
															value="A0303"> <span class="checkbox-placeholder"></span>
															수상 레포츠
														</label>&nbsp;&nbsp;&nbsp;<label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-6"
															value="A0304"> <span class="checkbox-placeholder"></span>
															항공 레포츠
														</label>&nbsp;&nbsp;&nbsp;<label
															class="checkbox-bootstrap checkbox-lg"> <input
															type="checkbox" name="personal" id="checkbox-3"
															value="A0305"> <span class="checkbox-placeholder"></span>
															복합 레포츠
														</label>
													</div>
													<br>
												</div>
												<br>
												<div class="col-xxs-12 col-xs-4 btn btn-primary"
													href="#step2" id="stepThreePrevBtn" role="tab"
													data-toggle="tab" aria-controls="b">PREV</div>
												<div class="col-xxs-12 col-xs-4 mt partner-radio"></div>
												<div class="col-xxs-12 col-xs-4 btn btn-primary"
													href="#step4" id="stepThreeNextBtn" role="tab"
													aria-controls="d" data-toggle="tab">NEXT</div>
											</div>
										</div>



										<%----------------------------------STEP4 - 여행 이름 설정 ----------------------------------------%>
										<div role="tabpanel" class="tab-pane" id="step4">
											<div class="row">
												<div class="col-xxs-12 col-xs-6 mt alternate">
													<div class="input-field">

														<input type="text" class="form-control" id="routename"
															name="routename" placeholder="여행 이름을 정해주세요.">
													</div>
												</div>
												<div class="col-xxs-12 col-xs-6 mt">
													<input
														type="submit" class="btn btn-primary btn-block"
														value="경로 추천 받기" onclick='Submit(1)'>
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

</form>





<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script
	src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sticky.js"></script>

 <!-- Stellar -->
<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
<!-- Superfish -->
<script src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
<!-- Magnific Popup -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/magnific-popup-options.js"></script> --%>
<!-- Date Picker -->
<%-- <script
	src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script> --%>
<script
	src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
<!-- CS Select -->
<script src="${pageContext.request.contextPath}/js/classie.js"></script>
<script src="${pageContext.request.contextPath}/js/selectFx.js"></script>

<!-- Main JS -->
<script src="js/main.js"></script>

