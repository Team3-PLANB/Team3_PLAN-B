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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cs-skin-border.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/PlanA/step-radio.css">
<!-- 체크박스를 위한 css  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/PlanA/checkbox-bootstrap.css">




<script
	src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>


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
				<div class="fh5co-cover" data-stellar-background-ratio="0.5"
					style="background-image: url(&quot;${pageContext.request.contextPath}/images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
					<div class="desc">
						<div class="container" style="margin-top: 90px;">
							<div class="row">
								<div class="tabulation animate-box fadeInUp animated">
									<div class="table-responsive">
										<table id="mytable" class="table table-bordred table-striped">
											<thead>
												<th  style="margin-left:50px;">추천 경로 선택</th>
											</thead>
											<tbody align="center">
												<tr>
													<td><a href="#"><strong>아이들과 함께 하는 여행</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>숨 막히는 일몰 풍경을 자랑하는 해안도로</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>제주 자연 정복</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>제주도 여행 실화냐</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>우리 아이와 함께 하는 제주 여행</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>가족과 함께</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>부모님과 함께 하는 여행</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>세계 7대 자연 경관 여행</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>제주 가족 여행</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>모든 자연이 조화롭게 만나는 해안도로</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>계절 따라 변화하는 다이내믹 해안도로</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr><tr>
													<td><a href="#"><strong>풍차가 주는 이국적인 해안도로</strong> <i
															class="icon-arrow-right22"></i></a></td>
												</tr>
											</tbody>
										</table>
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
<script
	src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
<!-- Superfish -->
<script src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
<!-- Magnific Popup -->
<%-- <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/magnific-popup-options.js"></script> --%>
<!-- Date Picker -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
<!-- CS Select -->
<script src="${pageContext.request.contextPath}/js/classie.js"></script>
<script src="${pageContext.request.contextPath}/js/selectFx.js"></script>

<!-- Main JS -->
<script src="js/main.js"></script>

