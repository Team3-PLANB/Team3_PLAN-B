<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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

<link rel="stylesheet" href="WEB-INF/views/LoginJoin/style.css">

<style type="text/css">
	input[type="password"] {
		background: rgba(0, 0, 0, 0.05);
		border: none;
		box-shadow: none;
		font-weight: bold;
		font-size: 14px;
		padding: 5px 10px !important;
		-webkit-border-radius: 0;
		-moz-border-radius: 0;
		-ms-border-radius: 0;
		border-radius: 0;
		width: 150%;
		color: #F78536 !important;
	}
	input[type="text"]{
		width: 150%;
	}
	img{
		width: 45px;
		height: 45px;
		border-radius: 8px;
		margin:3px;
	}
</style>

<script>
	$(document).ready(function(){
		$('#social_join').hide();
		$('.nav').find('#login_tab').click(function(){
			$('#social_join').hide();
			$('#social_login').show();
		});
		$('.nav').find('#join_tab').click(function(){
			$('#social_login').hide();
			$('#social_join').show();
		});
	});
</script>

<div class="fh5co-hero">
	<div class="fh5co-overlay"></div>
	<div class="fh5co-cover" data-stellar-background-ratio="0.5"
		style="background-image: url(&quot;images/cover_bg_1.jpg&quot;); background-position: 0px -47.7px;">
		<div class="desc">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 col-md-5">
						<div class="tabulation animate-box fadeInUp animated">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" id="join_tab">
									<a href="#join" aria-controls="join" role="tab" data-toggle="tab">JOIN</a>
								</li>
								<li role="presentation" class="active" id="login_tab">
									<a href="#login" aria-controls="login" role="tab" data-toggle="tab">LOGIN</a>
								</li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane" id="join">
									<form action="" class="row" method="POST" >
										<div class="col-xxs-12 col-xs-6 mt" style="margin-left:10%;">
											<div class="input-field">
												<label for="email">이메일</label> 
												<input type="text"	class="form-control" id="email" placeholder="이메일을 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="password">비밀번호</label> 
												<input type="password" class="form-control" id="password"
													placeholder="비밀번호를 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="passwordck">비밀번호 확인</label> 
												<input type="password" class="form-control" id="passwordck"
													placeholder="비밀번호를 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-left:10%;">
											<div class="input-field">
												<label for="nickname">닉네임</label> 
												<input type="text"class="form-control" id="nickname"
													placeholder="닉네임을 입력해주세요">
											</div>
										</div>
										<div class="col-xs-12">
											<input type="submit" class="btn btn-primary btn-block"
												value="Join">
										</div>
									</form>
								</div>
								<div role="tabpanel" class="tab-pane active" id="login">
									<form action="" class="row" method="POST">
										<div class="col-xxs-12 col-xs-6 mt" style="margin-left:10%">
											<div class="input-field">
												<label for="email">이메일</label> 
												<input type="text" class="form-control" id="email"
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
					
					
					<div class="col-sm-5 col-md-5"  style="margin-left:180px;" id="social_join" >
						<div class="tabulation animate-box fadeInUp animated" >
							<div class="tab-content" >
								<div role="tabpanel" class="tab-pane active" id="social_jo">
									<div class="row" >
										<div class="col-xxs-12 col-xs-6 mt" >
											<div class="input-field" > 
												<input type="text"	class="form-control" id="email"
													placeholder="이메일 인증 번호를 입력해주세요" style="margin-left:30%;">
												<button class="btn btn-primary btn-block" style="margin-top:20px;width:220%;height:60px;">이메일 인증번호 받기</button>
											</div>
										</div>
										
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-top:20px;margin-left:28%;">
											<div class="input-field" >
												<label for="password">소셜 계정으로 회원가입</label> 
												<a href="">
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
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-sm-5 col-md-5"  style="margin-left:180px;" id="social_login" >
						<div class="tabulation animate-box fadeInUp animated" >
							<div class="tab-content" >
								<div role="tabpanel" class="tab-pane active" id="social_log">
									<div class="row" >
										
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both;margin-top:20px;margin-left:28%;">
											<div class="input-field" >
												<label for="password">소셜 계정으로 로그인</label> 
												<a href="">
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