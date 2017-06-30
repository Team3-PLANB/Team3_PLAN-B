<%--
@Project : PLANB_JEJU
@File name : listBoard.jsp 
@Author : 임정연  & 정다혜
 @Data : 2017.06.16 & 2017.06.22
@Desc : 나의 여행지 후기 리스트
--%>





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B JEJU - 나의 여행지 후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
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


</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">

					<%------------------------------리스트 부분 ----------------------------------------%>
					<div class="container">
						<div class="row row-bottom-padded-md">
						<c:forEach var="sitePostscript" items="${sitePostscriptList}">
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="fh5co-blog animate-box">
										<a href="${pageContext.request.contextPath}/PostScript/Site/Detail.do?site_postscript_rownum=${sitePostscript.getSite_postscript_rownum()}">
											<img class="img-responsive" src="${pageContext.request.contextPath}/images/PostScript/listBoard_Site.jpg" alt="">
										</a>
										<div class="blog-text">
											<div class="prod-title">
												<h3>
													<a href="${pageContext.request.contextPath}/PostScript/Site/Detail.do?site_postscript_rownum=${sitePostscript.getSite_postscript_rownum()}">${sitePostscript.getSite()}</a>
												</h3>
<%-- 												<span class="comment" id="like" style="float:right;">
													<span id="siteLikeChange">찜콩
														<c:choose>
															<c:when test="${sitePostscript.getSite_like()=='true'}">
																<img id="heart" src="${pageContext.request.contextPath}/images/PostScript/full_like.png" style="width:30px;height:30px;">
															</c:when>
															<c:otherwise>
																<img id="heart" src="${pageContext.request.contextPath}/images/PostScript/empty_like.png" style="width:30px;height:30px;">
															</c:otherwise>
														</c:choose>
													</span>
													<input type="hidden" id="site_postscript_rownum" value="${sitePostscript.getSite_postscript_rownum()}">
													<input type="hidden" id="site_like" value="${sitePostscript.getSite_like()}">
												</span> --%>
												<span class="posted_by">${sitePostscript.getUsername()}</span> 
												<span class="posted_by" style="float:right;">${sitePostscript.getWritetime()}</span> 
												<span>
													<span id="tag">
														${sitePostscript.getComment()}
													</span>
													<span id="contentElement">
													</span>
												</span>
 												<input type = "button" class="btn btn-primary" value = "수정하기" />

 												<input type = "button" class="btn btn-primary" style="margin-left:85px" value ="삭제하기" />
											</div>
										</div>
									</div>
								</div>
							</c:forEach>						
						</div>
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

