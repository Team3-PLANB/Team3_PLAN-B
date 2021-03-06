<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
 -->
 
<title>PLAN'B JEJU 함께하기</title>
	<%-- <!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css"> --%>
	<!-- CS Select -->
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-select.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs-skin-border.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LoginJoin/join.css">
<%-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">

	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js" ></script> --%>
	<script src="${pageContext.request.contextPath}/js/loginjoin/facebook.js" ></script>
	<script src="${pageContext.request.contextPath}/js/loginjoin/joinCheck.js"></script>
	<script src="${pageContext.request.contextPath}/js/email.js"></script>
	<script src="${pageContext.request.contextPath}/js/loginjoin/login.js" ></script>
<div class="fh5co-hero">
	<div class="fh5co-overlay"></div>
	<div class="fh5co-cover" data-stellar-background-ratio="0.5">
		<div class="desc">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 col-md-5">
						<div class="tabulation animate-box fadeInUp animated">
						
							<!-- 네비게이션 Tab : join/login -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active" id="join_tab">
									<a href="#joinform" aria-controls="join" role="tab" data-toggle="tab">JOIN</a>
								</li>
								<li role="presentation" id="login_tab">
									<a href="#loginform" aria-controls="login" role="tab" data-toggle="tab">LOGIN</a>
								</li>
							</ul>

							<!-- Tab JOIN -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id = "joinform">
									<form action="joinok.do" class="row" id = "joinfrm" method="POST" >
										<div class="col-xxs-12 col-xs-6 mt" style="margin-left:10%;width:100%;">
											<div class="input-field" >
												<label for="email">이메일</label> 
													<div>
														<input type="text"	class="form-control" style="width:250px;float:left;" name = "username" id="username" placeholder="이메일을 입력해주세요" onkeyup="revText()"> <!-- onblur="emailCheck()" -->
														<input type="button" onclick="emailCheck()" id="overlabCheck" class="btn btn-primary btn-block" style="float:left;width:80px;height:40px;float:left;font-size:10px;padding:3px;margin-left:15px;" value="메일중복확인">
														<input type="button" onclick="authCheck()" id="authNumSend" class="btn btn-primary btn-block" style="float:left;width:80px;height:40px;float:left;font-size:10px;padding:3px;margin-left:15px;" value="인증번호받기">
														<input type="hidden" id="saveAuthNum" >										
													</div>
													
												<div class = "email-msg" id="email-msg" style="clear:both;"></div>
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="password">비밀번호</label> 
												<input type="password" class="form-control" name = "password" id="password"
													placeholder="비밀번호를 입력해주세요" autocomplete="off">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="passwordck">비밀번호 확인</label> 
												<input type="password" class="form-control" id="passwordck"
													placeholder="비밀번호를 입력해주세요" onkeyup="passwordCheck()" autocomplete="off">
												<div class = "pwdck" id="pwdck"></div>
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="nickname">닉네임</label> 
												<input type="text"class="form-control" name = "nickname" id="nickname"
													placeholder="닉네임을 입력해주세요" onkeyup = "nickCheck()" autocomplete="off">
												<div class = "nick-msg" id="nick-msg"></div>
											</div>
										</div>
									</form>
								</div>
								<!-- Tab LOGIN -->
								<div role="tabpanel" class="tab-pane" id="loginform">
									<form action="<%=request.getContextPath() %>/login" class="row" id="loginfrm" method="POST">
										<div class="col-xxs-12 col-xs-6 mt" style="margin-left:10%">
											<div class="input-field">
												<label for="email">이메일</label> 
												<input type="text" class="form-control" id="username" name = "username"
													placeholder="이메일을 입력해주세요">
												<div class="emailCheck"></div>
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear:both;margin-left:10%">
											<div class="input-field">
												<label for="password">비밀번호</label> 
												<input type="password" class="form-control" id="password" name = "password"
													placeholder="비밀번호를 입력해주세요" autocomplete="off">
												<div class="pwdCheck" id = "pwdCheck"></div>
											</div>
										</div>
										<div class="col-xs-12">
											<input type="button" class="btn btn-primary btn-block" value="Login" onclick="loginCheck()">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 이메일 인증 -->
					<div class="col-sm-5 col-md-5"  style="margin-left:180px;" id="social_join" >
						<div class="tabulation animate-box fadeInUp animated" >
							<div class="tab-content" >
								<div role="tabpanel" class="tab-pane active" id="social_jo">
									<div class="row" >
										<div class="col-xxs-12 col-xs-6 mt" >
											<div class="input-field" >
												<input type="text"	class="form-control" id="authnum" name="authnum"
														placeholder="　　인증 번호 7자리를 입력해주세요" style="margin-left:30%;" autocomplete="off">
												<input type="button" onclick="authNumCheck()" class="btn btn-primary btn-block" style="margin-top:20px;width:220%;height:60px;" id = "authNumCheck" value="이메일 인증하기">
												
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-top:20px;">
											<div class="input-field">
												<label for="password">소셜 계정으로 회원가입</label> 
												<a onclick="login()">
													　　　　<div><img src="<%=request.getContextPath() %>/images/logo/facebook-login-blue.png"></div>
												</a>
												<%-- <a href="">
													<img src="<%=request.getContextPath() %>/images/logo/005-google-plus.png">
												</a>
												<a href="">
													<img src="<%=request.getContextPath() %>/images/logo/naver.png">
												</a> --%>
											</div>
										</div>
										<div class="col-xs-12">
											<input type="hidden" id="overOk">
											<input type="hidden" id="authOk">
											<input type="button" class="btn btn-primary btn-block" value="Join" onclick="frm_submit()">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 소셜계정 로그인 -->
					<div class="col-sm-5 col-md-5"  style="margin-left:180px;" id="social_login" >
						<div class="tabulation animate-box fadeInUp animated" >
							<div class="tab-content" >
								<div role="tabpanel" class="tab-pane active" id="social_log">
									<div class="row" >
										
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-top:20px;">
											<div class="input-field" >
												<label for="password">소셜 계정으로 로그인</label> 
												<a onclick="login()">
													<img src="<%=request.getContextPath() %>/images/logo/facebook-login-blue.png">
												</a>
												<%-- <a href="">
													<img src="<%=request.getContextPath() %>/images/logo/005-google-plus.png">
												</a>
												<a href="<%=apiURL%>">
													<img src="<%=request.getContextPath() %>/images/logo/naver.png">
												</a> --%>
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