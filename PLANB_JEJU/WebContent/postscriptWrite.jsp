<%--
@Project : PLANB_JEJU
@File name : postscriptWrite.jsp 
@Author : 임정연
 @Data : 2017.06.17
@Desc : 후기 작성 페이지
--%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B &mdash; JEJU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
<link rel="shortcut icon" href="favicon.ico">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="css/cs-select.css">
<link rel="stylesheet" href="css/cs-skin-border.css">
<!-- 갤러리 등록을 위한 css  -->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/PostScript/style.css">
<script src="js/modernizr-2.6.2.min.js"></script>
<link rel="stylesheet" href="css/PostScript/checkbox-bootstrap.css">

<style>
.nav-tabs {
	border-bottom: 2px solid #DDD;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	border-width: 0;
}

.nav-tabs>li>a {
	border: none;
	color: #666;
}

.nav-tabs>li.active>a, .nav-tabs>li>a:hover {
	border: none;
	color: #F78536 !important;
	background: transparent;
}

.nav-tabs>li>a::after {
	content: "";
	background: #F78536;
	height: 2px;
	position: absolute;
	width: 100%;
	left: 0px;
	bottom: -1px;
	transition: all 250ms ease 0s;
	transform: scale(0);
}

.nav-tabs>li.active>a::after, .nav-tabs>li:hover>a::after {
	transform: scale(1);
}

.tab-nav>li>a::after {
	background: #21527d none repeat scroll 0% 0%;
	color: #fff;
}

.tab-pane {
	padding: 15px 0;
}

.tab-content {
	padding: 20px
}

.card {
	background: #FFF none repeat scroll 0% 0%;
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
	margin-bottom: 30px;
}

body {
	background: #EDECEC;
	padding: 50px
}

.complete {
	background: #F78536;
	color: #fff !important;
	border: none !important;
	border: 2px solid transparent !important;
	box-shadow: none;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#root"
							aria-controls="root" role="tab" data-toggle="tab">루트 후기 작성</a></li>
						<li role="presentation"><a href="#site" aria-controls="site"
							role="tab" data-toggle="tab">여행지 후기 작성</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<%------------------------------루트 후기 작성 ----------------------------------------%>
						<div role="tabpanel" class="tab-pane active" id="root">
							<input type="text" class="form-control" placeholder="제목"><br>
							<textarea name="" class="form-control" id="" cols="30" rows="7"
								placeholder="후기"></textarea>
							<br> <input type="text" class="form-control"
								placeholder="태그"><br>
							<div align="center">
								<input type="submit" value="작성 완료" class="complete">
							</div>
						</div>
						<%------------------------------여행지 후기 작성----------------------------------------%>
						<div role="tabpanel" class="tab-pane" id="site">
							<div class="wrap-upload-buttons">
								<div class="container" align="center">
									<ul class="btn-nav">
										<li><span><img
												src="images/PostScript/landscape.png" /><input type="file"
												name="" click-type="type1" class="picupload" multiple
												accept="image/*" /></span></li>
									</ul>
								</div>
							</div>


							<!--boostatrp modal-->
							<div class="modal fade popups" id="hint_brand" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content clearfix">
										<div class="modal-body login-box clearfix">
											<!--user post text -wrap-->
											<div class="user-post-text-wrap">
												<div class="user-pic-post">
													<img src="https://unsplash.it/176/176/?random">
												</div>
												<div class="user-txt-post">
													<textarea class="form-control upostTextarea"
														placeholder="What's on your mind"></textarea>
												</div>
											</div>
											<!--user post text -wrap end-->
											<ul id="media-list" class="clearfix">
												<li class="myupload"><span><i class="fa fa-plus"
														aria-hidden="true"></i><input type="file"
														click-type="type2" id="picupload" class="picupload"
														multiple></span></li>
											</ul>

											<!--post btn wrap-->
											<div class="user-post-btn-wrap clearfix">
												<input type="submit" class="btn" value="post">
											</div>
											<!--post btn wrap end-->
										</div>
									</div>
								</div>
							</div>
							<br> <input type="text" class="form-control"
								placeholder="제목"><br>
							<textarea name="" class="form-control" id="" cols="30" rows="7"
								placeholder="후기"></textarea>
							<br>
							<div class="checkbox">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="" src="images/PostScript/003-sun.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="checkbox-bootstrap checkbox-lg"> <input
									type="checkbox"> <span class="checkbox-placeholder"></span>
									맑음
								</label>&nbsp;&nbsp;&nbsp; <label class="checkbox-bootstrap checkbox-lg">
									<input type="checkbox"> <span
									class="checkbox-placeholder"></span> 흐림
								</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
									<input type="checkbox"> <span
									class="checkbox-placeholder"></span> 우중충
								</label>
							</div><br>
							<div class="checkbox">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="" src="images/PostScript/002-money.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="checkbox-bootstrap checkbox-lg"> <input
									type="checkbox"> <span class="checkbox-placeholder"></span>
									부족
								</label>&nbsp;&nbsp;&nbsp; <label class="checkbox-bootstrap checkbox-lg">
									<input type="checkbox"> <span
									class="checkbox-placeholder"></span> 적당
								</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
									<input type="checkbox"> <span
									class="checkbox-placeholder"></span> 풍족
								</label>
							</div><br>
							<div class="checkbox">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="" src="images/PostScript/001-hospital.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="checkbox-bootstrap checkbox-lg"> <input
									type="checkbox"> <span class="checkbox-placeholder"></span>
									양호
								</label>&nbsp;&nbsp;&nbsp; <label class="checkbox-bootstrap checkbox-lg">
									<input type="checkbox"> <span
									class="checkbox-placeholder"></span> 쏘쏘
								</label>&nbsp;&nbsp;&nbsp;<label class="checkbox-bootstrap checkbox-lg">
									<input type="checkbox"> <span
									class="checkbox-placeholder"></span> 악화
								</label>
							</div><br>
							<div align="center">
								<input type="submit" value="작성 완료" class="complete">
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


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
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/postscript/app.js"></script>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
	_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
</html>

