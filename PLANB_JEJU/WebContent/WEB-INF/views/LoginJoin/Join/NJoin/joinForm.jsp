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
</style>

<script>
	$(document).ready(function(){
		$('#join').click(function(){
			$.ajax({
				/* function(){
					$('#').
						console.log(data);
						$('#menuView').empty();
						var opr="";
						$.each(data.menu,function(index,value){
							console.log(index + "/" + value);
							opr += index + "." + value + "<br>";
						});
						$('#menuView').append(opr);
				} */
			})    
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
								<li role="presentation" class="active">
									<a href="#join" aria-controls="join" role="tab" data-toggle="tab">JOIN</a>
								</li>
								<li role="presentation">
									<a href="#login" aria-controls="login" role="tab" data-toggle="tab">LOGIN</a>
								</li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="join">
									<div class="row">
										<div class="col-xxs-12 col-xs-6 mt">
											<div class="input-field">
												<label for="email">이메일</label> 
												<input type="text"	class="form-control" id="email"
													placeholder="이메일을 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both">
											<div class="input-field">
												<label for="password">비밀번호</label> 
												<input type="password" class="form-control" id="password"
													placeholder="비밀번호를 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both">
											<div class="input-field">
												<label for="passwordck">비밀번호 확인</label> 
												<input type="password" class="form-control" id="passwordck"
													placeholder="비밀번호를 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both">
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
									</div>
								</div>
								<div role="tabpanel" class="tab-pane" id="login">
									<div class="row">
										<div class="col-xxs-12 col-xs-6 mt">
											<div class="input-field">
												<label for="email">이메일</label> 
												<input type="text" class="form-control" id="email"
													placeholder="이메일을 입력해주세요">
											</div>
										</div>
										<div class="col-xxs-12 col-xs-6 mt" style="clear: both">
											<div class="input-field">
												<label for="password">비밀번호</label> 
												<input type="password" class="form-control" id="password"
													placeholder="비밀번호를 입력해주세요">
											</div>
										</div>
										<div class="col-xs-12">
											<input type="submit" class="btn btn-primary btn-block" value="Login">
										</div>
									</div>
								</div>
							</div>
							
							<div>
							
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>