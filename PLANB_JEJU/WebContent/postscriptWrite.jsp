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
<link rel="stylesheet" href="css/style.css">

<!-- 갤러리 등록을 위한 css  -->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/PostScript/style.css">
<script src="js/modernizr-2.6.2.min.js"></script>
<link rel="stylesheet" href="css/PostScript/checkbox-bootstrap.css">

<script type="text/javascript">
	/* 첫번째 체크박스 중복체크 X  */
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("aaa");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	/* 두번째 체크박스 중복체크 X  */
	function doOpenCheck2(chk) {
		var obj = document.getElementsByName("bbb");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	/* 세번째 체크박스 중복체크 X  */
	function doOpenCheck3(chk) {
		var obj = document.getElementsByName("ccc");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
</script>
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-5 col-md-5">
				<div class="tabulation animate-box fadeInUp animated">

					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#step1"
							aria-controls="flights" role="tab" data-toggle="tab">루트 후기 작성</a></li>
						<li role="presentation"><a href="#step2"
							aria-controls="hotels" role="tab" data-toggle="tab">여행지 후기 작성</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="step1">
							<div class="table-responsive">

								<div role="tabpanel" class="tab-pane active" id="root">
									<input type="text" class="form-control" placeholder="제목"><br>
									<textarea name="" class="form-control" id="" cols="30" rows="7"
										placeholder="후기"></textarea>
									<br> <input type="text" class="form-control"
										placeholder="태그"><br>
									<div align="center">
										<input type="submit" value="작성 완료"
											class="btn btn-primary btn-block">
									</div>
								</div>
							</div>
						</div>


						<div role="tabpanel" class="tab-pane" id="step2">
							<div class="table-responsive">
								<div class="wrap-upload-buttons">
									<div class="container">
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

												<!--user post text -wrap end-->
												<ul id="media-list" class="clearfix">
													<li class="myupload"><span><i
															class="fa fa-plus" aria-hidden="true"></i><input
															type="file" click-type="type2" id="picupload"
															class="picupload" multiple></span></li>
												</ul>

												<!--post btn wrap-->
												<div class="user-post-btn-wrap clearfix">
													<input type="submit" class="btn" value="사진 등록">
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
								<div align="center">
									<div class="checkbox">
										<img alt="" src="images/PostScript/003-sun.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label class="checkbox-bootstrap checkbox-lg"> <input
											name="aaa" type="checkbox" value="1"
											onclick="doOpenCheck(this);"> <span
											class="checkbox-placeholder"></span> 맑음
										</label>&nbsp;&nbsp;&nbsp; <label
											class="checkbox-bootstrap checkbox-lg"> <input
											name="aaa" type="checkbox" value="2"
											onclick="doOpenCheck(this);"> <span
											class="checkbox-placeholder"></span> 흐림
										</label>&nbsp;&nbsp;&nbsp;<label
											class="checkbox-bootstrap checkbox-lg"> <input
											name="aaa" type="checkbox" value="3"
											onclick="doOpenCheck(this);"> <span
											class="checkbox-placeholder"></span> 우중충
										</label>
									</div>
									<br>
									<div class="checkbox">
										<img alt="" src="images/PostScript/002-money.png" width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label class="checkbox-bootstrap checkbox-lg"> <input
											name="bbb" type="checkbox" value="1"
											onclick="doOpenCheck2(this);"> <span
											class="checkbox-placeholder"></span> 부족
										</label>&nbsp;&nbsp;&nbsp; <label
											class="checkbox-bootstrap checkbox-lg"> <input
											name="bbb" type="checkbox" value="2"
											onclick="doOpenCheck2(this);"> <span
											class="checkbox-placeholder"></span> 적당
										</label>&nbsp;&nbsp;&nbsp;<label
											class="checkbox-bootstrap checkbox-lg"> <input
											name="bbb" type="checkbox" value="3"
											onclick="doOpenCheck2(this);"> <span
											class="checkbox-placeholder"></span> 풍족
										</label>
									</div>
									<br>
									<div class="checkbox">
										<img alt="" src="images/PostScript/001-hospital.png"
											width="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label class="checkbox-bootstrap checkbox-lg"> <input
											name="ccc" type="checkbox" value="1"
											onclick="doOpenCheck3(this);"> <span
											class="checkbox-placeholder"></span> 양호
										</label>&nbsp;&nbsp;&nbsp; <label
											class="checkbox-bootstrap checkbox-lg"> <input
											name="ccc" type="checkbox" value="2"
											onclick="doOpenCheck3(this);"> <span
											class="checkbox-placeholder"></span> 쏘쏘
										</label>&nbsp;&nbsp;&nbsp;<label
											class="checkbox-bootstrap checkbox-lg"> <input
											name="ccc" type="checkbox" value="3"
											onclick="doOpenCheck3(this);"> <span
											class="checkbox-placeholder"></span> 악화
										</label>
									</div>
								</div>
								<br>
								<div align="center">
									<input type="submit" value="작성 완료"
										class="btn btn-primary btn-block">
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/sticky.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/selectFx.js"></script>
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
