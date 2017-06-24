<%--
@Project : PLANB_JEJU
@File name : postscriptMain.jsp 
@Author : 임정연
 @Data : 2017.06.22
@Desc : 마이페이지의 나의 후기
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../myPageMain.jsp"></jsp:include>

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



<div id="fh5co-tours">
	<div class="container">
		<div class="row">
			<div
				class="col-md-6 col-sm-6 fh5co-tours animate-box fadeInUp animated"
				data-animate-effect="fadeIn">
				<div href="#">
					<img src="${pageContext.request.contextPath}/images/MyPage/mypostscript1.jpg"
						alt="Free HTML5 Website Template by FreeHTML5.co"
						class="img-responsive">
					<div class="desc">
						<span class="price">나의 루트 후기</span>
						<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/MyPage/PostScript/Route/List.do">나의 루트 후기 보기
							<i class="icon-arrow-right22"></i>
						</a>
					</div>
				</div>
			</div>
			<div
				class="col-md-6 col-sm-6 fh5co-tours animate-box fadeInUp animated"
				data-animate-effect="fadeIn">
				<div href="#">
					<img src="${pageContext.request.contextPath}/images/MyPage/mypostscript2.jpg"
						alt="Free HTML5 Website Template by FreeHTML5.co"
						class="img-responsive">
					<div class="desc">
						<span class="price">나의 여행지 후기</span> 
						<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/MyPage/PostScript/Site/List.do">나의 여행지 후기 보기
							<i class="icon-arrow-right22"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>