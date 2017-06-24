<%--
@Project : PLANB_JEJU
@File name : historyMain.jsp 
@Author : 임정연, 홍단비
@Data : 2017.06.22
@Desc : 마이페이지의 히스토리
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../myPageMain.jsp"></jsp:include>

    <link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
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
				<c:forEach var="myroutelist" items="${myroutelist}">
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box fadeInUp animated" data-animate-effect="fadeIn">
						<div href="${pageContext.request.contextPath}/History/historyDetial.do?routecode=${myroutelist.route_code}"><img src="${pageContext.request.contextPath}/images/historyMain.PNG" alt="${myroutelist.routename }" class="img-responsive">
							<div class="desc">
								<span></span>
								<h3 style ="font-size: 22px;">${myroutelist.routename }</h3>
								<span>${myroutelist.sday } - ${myroutelist.eday }</span>
								<a class="btn btn-primary btn-outline" href="${pageContext.request.contextPath}/MyPage/History/historyDetial.do">상세보기<i class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>