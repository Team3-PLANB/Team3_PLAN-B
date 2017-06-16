<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
 <script>
	
	function check(){
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnum.value){
			alert("인증번호를 입력하세요");
			return false;
		}else if(form.authnum.value != authNum){
			alert("인증번호가 맞지 않습니다. 확인해주세요.");
			form.authnum.value="";
			return false;
		}else if(form.authnum.value==authNum){
			alert("인증완료");
			self.close();
		}
	}
</script>
 
<title>PLAN'B JEJU 함께하기</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LoginJoin/join.css">

	<script src="${pageContext.request.contextPath}/js/loginjoin/joinCheck.js"></script>
	<script src="${pageContext.request.contextPath}/js/email.js"></script>
	<script src="${pageContext.request.contextPath}/js/loginjoin/facebook.js" ></script>

 <%
    String clientId = "q6YKhoTAKENem9wjtax9";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8090/PLANB_JEJU/callback.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>

<div class="fh5co-hero">
	<div class="fh5co-overlay"></div>
	<div class="fh5co-cover" data-stellar-background-ratio="0.5"
		style="background-image: url(&quot;images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
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
								<div role="tabpanel" class="tab-pane active" id="joinform">
									<form action="" class="row" id = "frm" method="POST" >
										<div class="col-xxs-12 col-xs-6 mt" style="margin-left:10%;width:100%;">
											<div class="input-field" >
												<label for="email">이메일</label> 
													<div>
														<input type="text"	class="form-control" style="width:250px;float:left;" name = "username" id="username" placeholder="이메일을 입력해주세요" > <!-- onblur="emailCheck()" -->
														<input type="button" onclick="emailCheck()" id="overlabCheck" class="btn btn-primary btn-block" style="float:left;width:80px;height:40px;float:left;font-size:10px;padding:3px;margin-left:15px;" value="메일중복확인">
														<input type="button" onclick="authCheck()" id="authNumSend" class="btn btn-primary btn-block" style="float:left;width:80px;height:40px;float:left;font-size:10px;padding:3px;margin-left:15px;" value="인증번호받기">
													</div>
													
												<div class = "email-msg" id="email-msg" style="clear:both;"></div>
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="password">비밀번호</label> 
												<input type="password" class="form-control" name = "password" id="password"
													placeholder="비밀번호를 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="passwordck">비밀번호 확인</label> 
												<input type="password" class="form-control" id="passwordck"
													placeholder="비밀번호를 입력해주세요" onkeyup="passwordCheck()">
												<div class = "pwdck" id="pwdck"></div>
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="nickname">닉네임</label> 
												<input type="text"class="form-control" name = "nickname" id="nickname"
													placeholder="닉네임을 입력해주세요" > <!-- onblur="nickCheck()" -->
												<div class = "nick-msg" id="nick-msg"></div>
											</div>
										</div>

									</form>
								</div>
								<!-- Tab LOGIN -->
								<div role="tabpanel" class="tab-pane" id="loginform">
									<form action="" class="row" method="POST">
										<div class="col-xxs-12 col-xs-6 mt" style="margin-left:10%">
											<div class="input-field">
												<label for="email">이메일</label> 
												<input type="text" class="form-control" id="username" name = "username"
													placeholder="이메일을 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear:both;margin-left:10%">
											<div class="input-field">
												<label for="password">비밀번호</label> 
												<input type="password" class="form-control" id="password"
													placeholder="비밀번호를 입력해주세요">
											</div>
										</div>
										<div class="col-xs-12">
											<input type="submit" class="btn btn-primary btn-block" value="Login">
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
												<form method="post" name="authenform" onSubmit="return check();">
													<input type="text"	class="form-control" id="e_cknum" name="authnum"
														placeholder="인증 번호 7자리를 입력해주세요" style="margin-left:30%;">
													<input type="submit" class="btn btn-primary btn-block" style="margin-top:20px;width:220%;height:60px;" id = "authNumCheck" value="이메일 인증하기">
												</form>
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-top:20px;margin-left:28%;">
											<div class="input-field" >
												<label for="password">소셜 계정으로 회원가입</label> 
												<a onclick="login()">
													<img src="<%=request.getContextPath() %>/images/logo/001-facebook-2.png">
												</a>
												<a href="">
													<img src="<%=request.getContextPath() %>/images/logo/005-google-plus.png">
												</a>
												<a href="">
													<img src="<%=request.getContextPath() %>/images/logo/naver.png">
												</a>
											</div>
										</div>
										<div class="col-xs-12">
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
										
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-top:20px;margin-left:28%;">
											<div class="input-field" >
												<label for="password">소셜 계정으로 로그인</label> 
												<a onclick="login()">
													<img src="<%=request.getContextPath() %>/images/logo/001-facebook-2.png">
												</a>
												<a href="">
													<img src="<%=request.getContextPath() %>/images/logo/005-google-plus.png">
												</a>
												<a href="<%=apiURL%>">
													<img src="<%=request.getContextPath() %>/images/logo/naver.png">
												</a>
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