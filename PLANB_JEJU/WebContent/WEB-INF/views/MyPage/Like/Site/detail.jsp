<%--
@Project : PLANB_JEJU
@File name : MyPage > Like > Site > detail.jsp 
@Author : 임정연 & 정다혜
@Date : 2017.06.16 & 2017.07.01
@Last Edit Date : 2017.07.02
@Desc : 마이페이지 > 찜한 후기 > 찜한 여행지 후기 상세보기
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="no-js">

<link rel="shortcut icon" href="favicon.ico">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-skin-border.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/PostScript/postscript.css">

<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/postscript/postscript.js"></script>
<script src="${pageContext.request.contextPath}/js/postscript/jssor.slider-24.1.5.min.js" type="text/javascript"></script>

<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>찜한 여행지 후기 게시판</h3>
						</div>
					</div>
					<div class="row row-bottom-padded-md">
						
						<%------------------------------제목 부분 ----------------------------------------%>
						<div class="col-md-12 animate-box" align="center">
							<h2 class="heading-title">${sitePostscript.site}</h2>
						</div>

						<%------------------------------이미지 슬라이더(갤러리) 부분----------------------------------------%>
						<div id="jssor_1"
							style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden; visibility: hidden;">
							<!-- Loading Screen -->
							<div data-u="loading" style="position: absolute; top: 0px; left: 0px; background: url('img/loading.gif') no-repeat 50% 50%; background-color: rgba(0, 0, 0, 0.7);"></div>
							<div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">
								<c:forEach var="photo" items="${sitePostscriptPhotoList}">
									<div>
										<img data-u="image" src="${path}/upload/${photo.photo_src}" />
										<div data-u="thumb">
											<c:forEach var="postTag" items="${sitePostscript.sitePostscriptTag}">
												<a style="color:white;" href="${pageContext.request.contextPath}/MyPage/Like/Site/List.do?searchWord=${postTag.tag}">#${postTag.tag}</a>&nbsp;
											</c:forEach>
										</div>
									</div>
								</c:forEach>
								<a data-u="any" href="https://www.jssor.com/wordpress.html" style="display: none">wordpress slider</a>
							</div>
							
							
							<!-- Thumbnail Navigator -->
							<div data-u="thumbnavigator" class="jssort09-600-45" style="position: absolute; bottom: 0px; left: 0px; width: 600px; height: 45px;">
								<div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: #000; filter: alpha(opacity = 40.0); opacity: 0.4;"></div>
								<!-- Thumbnail Item Skin Begin -->
								<div data-u="slides" style="cursor: default;">
									<div data-u="prototype" class="p">
										<div data-u="thumbnailtemplate" class="t"></div>
									</div>
								</div>
								<!-- Thumbnail Item Skin End -->
							</div>
							<!-- Bullet Navigator -->
							<div data-u="navigator" class="jssorb01" style="bottom: 16px; right: 16px;">
								<div data-u="prototype" style="width: 12px; height: 12px;"></div>
							</div>
							<!-- Arrow Navigator -->
							<span data-u="arrowleft" class="jssora05l" style="top: 0px; left: 8px; width: 40px; height: 40px;" data-autocenter="2"></span> 
							<span data-u="arrowright" class="jssora05r" style="top: 0px; right: 8px; width: 40px; height: 40px;" data-autocenter="2"></span>
						</div>
						<script type="text/javascript">
							jssor_1_slider_init();
						</script>
						<!-- #endregion Jssor Slider End -->
						
						<%----------------------찜콩 버튼----------------------%>
						<br>
						<div class="col-md-9 animate-box" align="center">
							<span class="comment" id="like" style="float: right;"> 
								<span>찜콩
									<c:choose>
										<c:when test="${sitePostscript.site_like=='true'}">
											<img id="heart" onclick="siteLikeChange(this)" src="${pageContext.request.contextPath}/images/PostScript/full_like.png" style="width:30px;height:30px;">
										</c:when>
										<c:otherwise>
											<img id="heart" onclick="siteLikeChange(this)" src="${pageContext.request.contextPath}/images/PostScript/empty_like.png" style="width:30px;height:30px;">
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="site_postscript_rownum" value="${sitePostscript.site_postscript_rownum}">
									<input type="hidden" id="site_like" value="${sitePostscript.site_like}">
								</span>
							</span>
						</div>

						<%------------------------------후기글 부분 ----------------------------------------%>
						<div class="row" style="margin-left:22%;">
							<br>
							<div class="col-md-8">
								<br>
								<div class="box-testimony animate-box">
									<blockquote>
										<span class="quote">
											<span>
												<i class="icon-quotes-left"></i>
											</span>
										</span>
										<span id="contentElement">${sitePostscript.comment}</span>
										<span id="tag"></span>
										<span class="quote">
											<span>
												<i class="icon-quotes-right"></i>
											</span>
										</span>
									</blockquote>								
								</div>								
							</div>
						</div>

						<%------------------------------목록으로 버튼 ----------------------------------------%>
					</div>
					<div align="center">
						<a href="List.do" class="btn btn-primary">목록으로<i class="icon-arrow-right22"></i></a>
					</div>
				</div>
			</div>
		</div>
		<!-- END fh5co-page -->
	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/sticky.js"></script>
	<!-- Stellar -->
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
	<script src="${pageContext.request.contextPath}/js/superfish.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script src="${pageContext.request.contextPath}/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/selectFx.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>

