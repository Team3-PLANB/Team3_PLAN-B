<%--
@Project : PLANB_JEJU
@File name :listBoard.jsp 
@Author : 임정연 & 정다혜
@Data : 2017.06.16 & 2017.06.20
@Last Edit Data : 2017.06.21
@Desc : 루트 후기 게시판의 리스트 (메인)
--%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PLAN'B JEJU - 후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" /> -->
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


<!--메세지를 위한 웹소켓 구현-->
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.min.js"></script>

<script>
	$(document).ready(() => {
		console.log("안녕");
	    // websocket init
		if ('${loginUser}' != '') WebSocket.init();

        // message modal handler
        $('#btn-message-modal').on('click', function(e){
            //e.preventDefault();
            $('#modal-message-register').modal({});
        });
	});

	let WebSocket = (() => {
		const SERVER_SOCKET_API = "${pageContext.request.contextPath}/websocket";

		let stompClient;

		// send button onclick event
		$('#send-message-button').click(() => sendMessage());

		function connect() {
			let socket = new SockJS(SERVER_SOCKET_API);
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function () {
				stompClient.subscribe('/topic/user', function (msg) {
					printMessage(msg.body);
				});
			});

		}

		function printMessage(message) {
			//textArea.value += message + "\n - ";
			let obj = JSON.parse(message);

			// 받는 회원만 진행
			if (obj.receiver == '${loginUser}') {
				$('#messageBadge').text(obj.unread_count).fadeIn(1000);
				swal("[ from ] " + obj.sender + "\n[ 받은 쪽지 ]\n" + obj.comment);
			}

			$('#modal-message-register').modal('hide');
		}

		function sendMessage(text) {

			let comment = $('textarea[name=form-about-yourself]').val();
			let sender = '${loginUser }';
			let receiver = $('input[name=form-first-name]').val();

			if (sender == '') {
				alert('로그인 후 사용하세요.');
				return;
			}

			if (receiver == '') {
				alert('받는 회원을 입력하세요.');
				return;
			}

			let message = {
				comment: comment,
				sender: sender,
				receiver: receiver
			};

			stompClient.send("/stomp/sendToUser", {}, JSON.stringify(message));

		}

		function init() {

			// socket connect
			connect();

			// 안읽은 쪽지를 조회하여 뱃지 API
			// 참고 (body) => $('#messageBadge').text(body) == function(body) {$('#messageBadge').text(body)}
		   	$.get('${pageContext.request.contextPath}/message/unread/count', (body) => {
				if (Number(body) > 0) {
					$('#messageBadge').text(body).fadeIn(1000);
				}
			});

		}

		return {
			init: init
		}
	})();

</script>



</head>

<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-tours" class="fh5co-section-gray">
				<div class="container" id="here">
				<%------------------------------후기 게시판의 header ----------------------------------------%>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>후기 게시판</h3>
							<p>루트 후기 게시판입니다.</p>
							<ul class="portfolio-filter" style='align:center'>
							<!--  -->
								<li>
									<a class="btn btn-default default active" href="${pageContext.request.contextPath}/PostScript/Route/List.do" data-filter=".a">루트 후기</a>
								</li>
								<li>
									<a class="btn btn-default" href="${pageContext.request.contextPath}/PostScript/Site/List.do" data-filter=".b">여행지 후기</a>
								</li>
							</ul>
						</div>
					</div>
					
					
					
					<%-----------------------------검색 부분 ----------------------------------------%>
					<form action="${pageContext.request.contextPath}/PostScript/Route/List.do">
						<div class="row animate-box" align="right">
							<img src="${pageContext.request.contextPath}/images/PostScript/hash.png" style="margin-right:10px;">
							<input type="submit" style="margin-left:10px;float:right;" value="검색하기" class="btn btn-primary">
							<input type="text" style="width:200px;float:right;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" placeholder="검색할 태그">
						</div>
					</form>
					<br>

					<%------------------------------리스트 부분 ----------------------------------------%>
					<div class="container">
						<div class="row row-bottom-padded-md">
							<c:forEach var="routePostscript" items="${routePostscriptList}">
								<div class="col-lg-4 col-md-4 col-sm-6" >
									<div class="fh5co-blog animate-box">
										<a href="${pageContext.request.contextPath}/PostScript/Route/Detail.do?route_postscript_rownum=${routePostscript.route_postscript_rownum}">
											<img class="img-responsive" src="${pageContext.request.contextPath}/images/PostScript/listBoard_Route.jpg" alt="">
										</a>
										<div class="blog-text" style="height:400px;">
											<div class="prod-title">
												<h3>
													<a href="${pageContext.request.contextPath}/PostScript/Route/Detail.do?route_postscript_rownum=${routePostscript.route_postscript_rownum}">${routePostscript.routename}</a>
												</h3>
												<span class="comment" id="like" style="float:right;">
													<span id="routeLikeChange">찜콩
														<c:choose>
															<c:when test="${routePostscript.route_like=='true'}">
																<img id="heart" src="${pageContext.request.contextPath}/images/PostScript/full_like.png" style="width:30px;height:30px;">
															</c:when>
															<c:otherwise>
																<img id="heart" src="${pageContext.request.contextPath}/images/PostScript/empty_like.png" style="width:30px;height:30px;">
															</c:otherwise>
														</c:choose>
													</span>
													<input type="hidden" id="route_postscript_rownum" value="${routePostscript.route_postscript_rownum}">
													<input type="hidden" id="route_like" value="${routePostscript.route_like}">
												</span>
												<span class="posted_by">${routePostscript.username}</span>
												<input id="writer" type="hidden" value="${routePostscript.username}">
												<span class="posted_by" style="float:right;">${routePostscript.writetime}</span> 
												<span>
													<c:forEach var="postTag" items="${routePostscript.routePostscriptTag}">
														<a href="${pageContext.request.contextPath}/PostScript/Route/List.do?searchWord=${postTag.tag}">#${postTag.tag}</a>&nbsp;
													</c:forEach>
												</span>
												<span id="contentElement">
												</span>
												<p><a href="#" id="btn-message-modal">쪽지 쓰기</a></p>
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
	
	
	
	<!-- Message Modal -->
<div class="modal fade" id="modal-message-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="modal-register-label">쪽지 보내기</h3>
			</div>

			<div class="modal-body">

				<form role="form" action="" method="post" class="registration-form">
					<div class="form-group">
						<label class="sr-only" for="form-first-name">받는 사람</label> <input
							type="text" name="form-first-name"
							placeholder="받는이 이메일" value="$('#writer').val()"
							class="form-first-name form-control" id="form-first-name">
					</div>
					<div class="form-group">
						<label class="sr-only" for="form-about-yourself">내용</label>
						<textarea name="form-about-yourself" placeholder="내용을 입력해주세요."
								  class="form-about-yourself form-control"
								  id="form-about-yourself"></textarea>
					</div>
					<button type="button" class="btn btn-primary" id="send-message-button">보내기</button>
				</form>

			</div>

		</div>
	</div>
</div>


	
	<button id="moveTopBtn">
		<img src="${pageContext.request.contextPath}/images/PostScript/btn_backtotop.png" style="width:80px;height:80px;" title="위로 가기">
	</button>
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

