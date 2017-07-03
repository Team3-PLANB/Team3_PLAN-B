<%--
@Project : PLANB_JEJU
@File name : scheduleMain.jsp 
@Author : 임정연 & 정다혜
 @Data : 2017.06.22
@Desc : 마이페이지의 일정 관리
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../myPageMain.jsp"></jsp:include>
<!-- 
    <link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	Animate.css
	<link rel="stylesheet" href="css/animate.css">
	Icomoon Icon Fonts
	<link rel="stylesheet" href="css/icomoon.css">
	Bootstrap 
	<link rel="stylesheet" href="css/bootstrap.css">
	Superfish
	<link rel="stylesheet" href="css/superfish.css">
	Magnific Popup
	<link rel="stylesheet" href="css/magnific-popup.css">
	Date Picker
	<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
	CS Select
	<link rel="stylesheet" href="css/cs-select.css">
	<link rel="stylesheet" href="css/cs-skin-border.css">
	
	<link rel="stylesheet" href="css/style.css">

 -->

<div id="fh5co-tours">
			<div class="container">
				<div class="row">
					<c:forEach var="mytRoute" items="${mytRouteList}">
						<div class="col-md-4 col-sm-6 fh5co-tours animate-box fadeInUp animated" data-animate-effect="fadeIn">
							<div href="#"><img src="${pageContext.request.contextPath}/images/travel/${mytRoute.route_thumbnail}" alt="myroute" class="img-responsive" style="width:359px; height:359px;">
								<div class="desc">
									<span></span>
									<h3>${mytRoute.routename}</h3>
									<span>${mytRoute.sday} ~ ${mytRoute.eday}</span>
									<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/PLANA.update.do?route_code=${mytRoute.route_code}">상세보기<i class="icon-arrow-right22"></i></a>
 									<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/PostScript/History/history.do?route_code=${mytRoute.route_code}">히스토리<i class="icon-arrow-right22"></i></a>
									<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/PostScript/Route/Write.do?route_code=${mytRoute.route_code}">후기 작성<i class="icon-arrow-right22"></i></a>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-md-12 text-center animate-box fadeInUp animated">
						<p><a class="btn btn-primary btn-outline btn-lg" href="#">일정 만들기<i class="icon-arrow-right22"></i></a></p>
					</div>
				</div>
			</div>
		</div>