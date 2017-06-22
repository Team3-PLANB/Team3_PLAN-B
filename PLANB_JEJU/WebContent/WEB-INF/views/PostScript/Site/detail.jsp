<%--
@Project : PLANB_JEJU
@File name : detail.jsp 
@Author : 임정연 & 정다혜
@Data : 2017.06.16 & 2017.06.22
@Last Edit Data : 2017.06.22
@Desc : 여행지 후기 게시판의 상세보기
--%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B JEJU - 후기 게시판</title>
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

<script src="../../js/postscript/jssor.slider-24.1.5.min.js" type="text/javascript"></script>
<script type="text/javascript">
	jssor_1_slider_init = function() {

		var jssor_1_SlideshowTransitions = [ {
			$Duration : 1200,
			x : -0.3,
			$During : {
				$Left : [ 0.3, 0.7 ]
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.3,
			$SlideOut : true,
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		} ];

		var jssor_1_options = {
			$AutoPlay : 1,
			$SlideshowOptions : {
				$Class : $JssorSlideshowRunner$,
				$Transitions : jssor_1_SlideshowTransitions,
				$TransitionsOrder : 1
			},
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$
			},
			$BulletNavigatorOptions : {
				$Class : $JssorBulletNavigator$
			},
			$ThumbnailNavigatorOptions : {
				$Class : $JssorThumbnailNavigator$,
				$Cols : 1,
				$Align : 0,
				$NoDrag : true
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		/*responsive code begin*/
		/*remove responsive code if you don't want the slider scales while window resizing*/
		function ScaleSlider() {
			var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
			if (refSize) {
				refSize = Math.min(refSize, 600);
				jssor_1_slider.$ScaleWidth(refSize);
			} else {
				window.setTimeout(ScaleSlider, 30);
			}
		}
		ScaleSlider();
		$Jssor$.$AddEvent(window, "load", ScaleSlider);
		$Jssor$.$AddEvent(window, "resize", ScaleSlider);
		$Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
		/*responsive code end*/
	};
</script>
<style>
/* jssor slider bullet navigator skin 01 css */
/*
        .jssorb01 div           (normal)
        .jssorb01 div:hover     (normal mouseover)
        .jssorb01 .av           (active)
        .jssorb01 .av:hover     (active mouseover)
        .jssorb01 .dn           (mousedown)
        */
.jssorb01 {
	position: absolute;
}

.jssorb01 div, .jssorb01 div:hover, .jssorb01 .av {
	position: absolute;
	/* size of bullet elment */
	width: 12px;
	height: 12px;
	filter: alpha(opacity = 70);
	opacity: .7;
	overflow: hidden;
	cursor: pointer;
	border: #000 1px solid;
}

.jssorb01 div {
	background-color: gray;
}

.jssorb01 div:hover, .jssorb01 .av:hover {
	background-color: #d3d3d3;
}

.jssorb01 .av {
	background-color: #fff;
}

.jssorb01 .dn, .jssorb01 .dn:hover {
	background-color: #555555;
}

/* jssor slider arrow navigator skin 05 css */
/*
        .jssora05l                  (normal)
        .jssora05r                  (normal)
        .jssora05l:hover            (normal mouseover)
        .jssora05r:hover            (normal mouseover)
        .jssora05l.jssora05ldn      (mousedown)
        .jssora05r.jssora05rdn      (mousedown)
        .jssora05l.jssora05lds      (disabled)
        .jssora05r.jssora05rds      (disabled)
        */
.jssora05l, .jssora05r {
	display: block;
	position: absolute;
	/* size of arrow element */
	width: 40px;
	height: 40px;
	cursor: pointer;
	background: url('img/a17.png') no-repeat;
	overflow: hidden;
}

.jssora05l {
	background-position: -10px -40px;
}

.jssora05r {
	background-position: -70px -40px;
}

.jssora05l:hover {
	background-position: -130px -40px;
}

.jssora05r:hover {
	background-position: -190px -40px;
}

.jssora05l.jssora05ldn {
	background-position: -250px -40px;
}

.jssora05r.jssora05rdn {
	background-position: -310px -40px;
}

.jssora05l.jssora05lds {
	background-position: -10px -40px;
	opacity: .3;
	pointer-events: none;
}

.jssora05r.jssora05rds {
	background-position: -70px -40px;
	opacity: .3;
	pointer-events: none;
}
/* jssor slider thumbnail navigator skin 09 css */
.jssort09-600-45 .p {
	position: absolute;
	top: 0;
	left: 0;
	width: 600px;
	height: 45px;
}

.jssort09-600-45 .t {
	font-family: verdana;
	font-weight: normal;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	color: #fff;
	line-height: 45px;
	font-size: 20px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>여행지 후기 게시판</h3>
							<p>여행지 후기 게시판입니다.</p>
						</div>
					</div>
					<div class="row row-bottom-padded-md">
						<%------------------------------제목 부분 ----------------------------------------%>
						<div class="col-md-12 animate-box" align="center">
							<h2 class="heading-title">애월해안도로 드라이브~</h2>
						</div>



						<%------------------------------이미지 슬라이더(갤러리) 부분----------------------------------------%>
						<div id="jssor_1"
							style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden; visibility: hidden;">
							<!-- Loading Screen -->
							<div data-u="loading" style="position: absolute; top: 0px; left: 0px; background: url('img/loading.gif') no-repeat 50% 50%; background-color: rgba(0, 0, 0, 0.7);"></div>
							<div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">
								<div>
									<img data-u="image" src="../../images/PostScript/slider_1.jpg" />
									<div data-u="thumb">#날씨맑은 #예산적당 #건강양호</div>
								</div>
								<div>
									<img data-u="image" src="../../images/PostScript/slider_2.jpg" />
									<div data-u="thumb">#날씨맑은 #예산적당 #건강양호</div>
								</div>
								<div>
									<img data-u="image" src="../../images/PostScript/slider_3.jpg" />
									<div data-u="thumb">#날씨맑은 #예산적당 #건강양호</div>
								</div>
								<div>
									<img data-u="image" src="../../images/PostScript/slider_4.png" />
									<div data-u="thumb">#날씨맑은 #예산적당 #건강양호</div>
								</div>
								<a data-u="any" href="https://www.jssor.com/wordpress.html"
									style="display: none">wordpress slider</a>
							</div>
							<!-- Thumbnail Navigator -->
							<div data-u="thumbnavigator" class="jssort09-600-45"
								style="position: absolute; bottom: 0px; left: 0px; width: 600px; height: 45px;">
								<div
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: #000; filter: alpha(opacity = 40.0); opacity: 0.4;"></div>
								<!-- Thumbnail Item Skin Begin -->
								<div data-u="slides" style="cursor: default;">
									<div data-u="prototype" class="p">
										<div data-u="thumbnailtemplate" class="t"></div>
									</div>
								</div>
								<!-- Thumbnail Item Skin End -->
							</div>
							<!-- Bullet Navigator -->
							<div data-u="navigator" class="jssorb01"
								style="bottom: 16px; right: 16px;">
								<div data-u="prototype" style="width: 12px; height: 12px;"></div>
							</div>
							<!-- Arrow Navigator -->
							<span data-u="arrowleft" class="jssora05l"
								style="top: 0px; left: 8px; width: 40px; height: 40px;"
								data-autocenter="2"></span> <span data-u="arrowright"
								class="jssora05r"
								style="top: 0px; right: 8px; width: 40px; height: 40px;"
								data-autocenter="2"></span>
						</div>
						<script type="text/javascript">
							jssor_1_slider_init();
						</script>
						<!-- #endregion Jssor Slider End -->




						





						<%------------------------------후기글 부분 ----------------------------------------%>
						<div class="row">
							<br>
							<div class="col-md-4">
															</div>
							<div class="col-md-4">
								<br>
								<div class="box-testimony animate-box">
									<blockquote>
										<span class="quote"><span><i
												class="icon-quotes-right"></i></span></span>
										<p>&ldquo;저는 드라이브를 무척 좋아하는 편인데 첫 여행지부터 드라이브 코스를 추천해줘서 정말
											기분 좋았습니다ㅎㅎ&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="col-md-4">
								
							</div>
						</div>












						<%------------------------------찜콩과 목록으로 버튼 ----------------------------------------%>
						<br> <br> <br> <br>
						<div class="col-md-12 animate-box" align="center">

							<div class="blog-text">
								<div class="prod-title">
									<span class="comment"><a href="">찜콩<i
											class="icon-bubble2"></i></a></span>
								</div>
							</div>
							
						</div>

					</div>
					<div align="right">
						<a href="PostScript_Board_Site.jsp">목록으로<i
							class="icon-arrow-right22"></i></a>
					</div>
				</div>
			</div>











			<%------------------------------이미지 슬라이더 상세 설정----------------------------------------%>
			<div id="jssor_1"
				style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden; visibility: hidden;">
				<!-- Loading Screen -->
				<div data-u="loading"
					style="position: absolute; top: 0px; left: 0px; background: url('img/loading2.gif') no-repeat 50% 50%; background-color: rgba(0, 0, 0, 0.7);"></div>
				<div data-u="slides"
					style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">
					<div>
						<img data-u="image" src="images/002.jpg" /> <img data-u="thumb"
							src="images/002.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/003.jpg" /> <img data-u="thumb"
							src="images/003-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/004.jpg" /> <img data-u="thumb"
							src="images/004-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/005.jpg" /> <img data-u="thumb"
							src="images/005-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/006.jpg" /> <img data-u="thumb"
							src="images/006-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/007.jpg" /> <img data-u="thumb"
							src="images/007-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/008.jpg" /> <img data-u="thumb"
							src="images/008-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/009.jpg" /> <img data-u="thumb"
							src="images/009-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/010.jpg" /> <img data-u="thumb"
							src="images/010-s62x32.jpg" />
					</div>
					<div>
						<img data-u="image" src="images/011.jpg" /> <img data-u="thumb"
							src="images/011-s62x32.jpg" />
					</div>
					<a data-u="any" href="https://www.jssor.com/wordpress.html"
						style="display: none">wordpress carousel</a>
				</div>
				<!-- Thumbnail Navigator -->
				<div data-u="thumbnavigator" class="jssort03"
					style="position: absolute; left: 0px; bottom: 0px; width: 600px; height: 60px;"
					data-autocenter="1">
					<div
						style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: #000; filter: alpha(opacity = 30.0); opacity: 0.3;"></div>
					<!-- Thumbnail Item Skin Begin -->
					<div data-u="slides" style="cursor: default;">
						<div data-u="prototype" class="p">
							<div class="w">
								<div data-u="thumbnailtemplate" class="t"></div>
							</div>
							<div class="c"></div>
						</div>
					</div>
					<!-- Thumbnail Item Skin End -->
				</div>
				<!-- Arrow Navigator -->
				<span data-u="arrowleft" class="jssora02l"
					style="top: 0px; left: 8px; width: 55px; height: 55px;"
					data-autocenter="2"></span> <span data-u="arrowright"
					class="jssora02r"
					style="top: 0px; right: 8px; width: 55px; height: 55px;"
					data-autocenter="2"></span>
			</div>
			<script type="text/javascript">
				jssor_1_slider_init();
			</script>
			<!-- #endregion Jssor Slider End -->













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

