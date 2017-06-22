<%--
@Project : PLANB_JEJU
@File name : siteMain.jsp 
@Author : 임정연
@Data : 2017.06.16
@Desc : 나의 여행지 후기 게시판의 리스트
--%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B JEJU - 후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" /> -->
<link rel="shortcut icon" href="favicon.ico">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="css/cs-select.css">
<link rel="stylesheet" href="css/cs-skin-border.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/postscript.css">


<script src="js/modernizr-2.6.2.min.js"></script>


</head>

<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container" id="here">

					<%------------------------------나의 후기 - 루트 후기 리스트 부분 ----------------------------------------%>
					<div class="container">
						<div class="row row-bottom-padded-md">
						
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">
										<img class="img-responsive" src="${pageContext.request.contextPath}/images/PostScript/listBoard_Root.JPG" alt="">
									</a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do?route_code=${route_code}">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">${routePostScript.nickname}</span> 
											<span class="posted_by" style="float:right;">2017.06.09</span> 
											<span class="comment" id="like">
												<%-- <a href="">찜콩
													<c:choose>
														<c:if test="">
															<img src="" class="likeChange">
														</c:if>
														<c:otherwise>
															<img src="" class="likeChange">
														</c:otherwise>
													</c:choose>
												</a> --%>
											</span>
											<p>#힐링#자연#건강#웃음</p>
											<p><a href="#">쪽지 쓰기</a></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">
										<img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do"><img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do"><img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do"><img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do"><img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do"><img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do"><img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do"><img
										class="img-responsive" src="../../images/PostScript/listBoard_Root.JPG" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${pageContext.request.contextPath}/PostScript/Root/Detail.do">낮코밤코의 첫 제주도</a>
											</h3>
											<span class="posted_by">2017.06.09</span> <span
												class="comment" id="like"><a href="">찜콩<i
													class="icon-bubble2" id="like2"></i></a></span>
											<p>#힐링#자연#건강#웃음</p>
											<p>
												<a href="#">쪽지 쓰기</a>
											</p>
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
	
	
	<button id="moveTopBtn">
		<img src="${pageContext.request.contextPath}/images/MyPage/btn_backtotop.png" style="width:80px;height:80px;" title="위로 가기">
	</button>
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

