<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/message/css/sweetalert.css">
<script src="${pageContext.request.contextPath}/message/js/sweetalert.min.js" ></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

<header>
	<nav class="navbar navbar-default" style="margin:0px;">
		<div class="container">
			<div class="nav-header">
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark">
					<i></i>
				</a>
				<h1 id="fh5co-logo">
					<a href="${pageContext.request.contextPath}/Index/main.do">
						<i class="icon-airplane"></i>PLAN'B JEJU
					</a>
				</h1>
				<!-- START #fh5co-menu-wrap -->
				<nav id="fh5co-menu-wrap" role="navigation">
					<ul class="sf-menu sf-js-enabled sf-arrows" id="fh5co-primary-menu" style="touch-action: pan-y;">
						<li class="active"><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
						<li><a href="${pageContext.request.contextPath}/PLANA.make.do">일정만들기</a></li>
						<li><a href="${pageContext.request.contextPath}/PostScript/Route/List.do">후기게시판</a></li>
						<!-- ROLE_USER만 : 로그인 시 보이는 탭-->
						<security:authorize access="hasRole('ROLE_USER')">
							<li class="">
								<a href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do" class="fh5co-sub-ddown sf-with-ul">My Page</a>
								<ul class="fh5co-sub-menu" >
									<li><a href="${pageContext.request.contextPath}/MyPage/Schedule/schedule.do">일정 관리</a></li>
									<li><a href="${pageContext.request.contextPath}/MyPage/PostScript/postscriptMain.do">나의 후기</a></li>
									<li><a href="${pageContext.request.contextPath}/MyPage/Like/likeMain.do">찜한 후기</a></li>
									<li><a href="${pageContext.request.contextPath}/MyPage/Message/msgMain.do">쪽지함</a></li>
									<li><a href="${pageContext.request.contextPath}/MyPage/Info/updateInfo.do">회원정보수정</a></li>
								</ul>
							</li>
						</security:authorize>
						<!-- !isAuthenticated() -->
						<security:authorize access="!isAuthenticated()">
							<li>
								<a href="${pageContext.request.contextPath}/LoginJoin/Join/NJoin.do">LOGIN</a>
							</li>
						</security:authorize>
						<!-- isAuthenticated() -->
						<security:authentication property="name" var="loginUser"/>
						<security:authorize access="isAuthenticated()">
							<li>
								<a href="#" id="btn-message-modal">쪽지 보내기</a>
							</li>
							<li id="messageBoxIcon">
								<a href="${pageContext.request.contextPath}/MyPage/Message/msgMain.do">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
									<span class="badge" id="messageBadge" style="background-color: red; padding: 3px; position: absolute; right: 2px; top: 4px; display: none;">0</span>
								</a>
							</li>
							<li><a href="${pageContext.request.contextPath}/logout">${loginUser}로그아웃</a></li>
						</security:authorize>
				   </ul>

				</nav>
			</div>
		</div>
	</nav>
</header>

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
							placeholder="받을사람 이메일 ex:) a@naver.com"
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

<!--메세지를 위한 웹소켓 구현-->
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.min.js"></script>

<script>
	//$(document).ready(() => {
		
	$(window).load(function(){
		

	    // websocket init
		if ('${loginUser}' != '') WebSocket.init();

        // message modal handler
        $('#btn-message-modal').on('click', function(e){
        	
        	console.log('dididdiid');	
            //e.preventDefault();
            $('#modal-message-register').modal({});
         
			 if(sessionStorage.getItem("MessageReceiverId")!=null){
            	
            	if(sessionStorage.getItem("MessageReceiverId")!=''){
            		var receiver_id = sessionStorage.getItem("MessageReceiverId");

            		$('input[name=form-first-name]').val(receiver_id);
            	}
            } 
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
				//swal("[ from ] " + obj.sender + "\n[ 받은 쪽지 ]\n" + obj.comment);
				
				swal({
					  title: "[ from ]"+obj.sender,
					  text: "[ 받은 쪽지 ]" + obj.comment,
					  confirmButtonText: "읽음"
				},
				function(isConfirm){
				  if (isConfirm) {
					  $.ajax({
							type : "post",
							url : '${pageContext.request.contextPath}/message/unread/count/up',
							
							dataType : "json",
							data : JSON.stringify({"sender":obj.sender, "receiver":obj.receiver, "comment":obj.comment}),
							contentType: "application/json; charset=UTF-8",
							success : function(result){
								//결과값 전달 후에 뱃지 다시 띄우기
								//init();
								location.reload(true);
							},
							error : function(xhr) {
								console.log("에러남 : " + xhr);
							}
						});
				  } 
				});
				
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
 

