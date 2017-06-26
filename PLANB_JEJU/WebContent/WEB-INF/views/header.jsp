<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
									<li><a href="${pageContext.request.contextPath}/MyPage/PostScript/postScriptMain.do">나의 후기</a></li>
									<li><a href="${pageContext.request.contextPath}/MyPage/Like/like.do">찜한 후기</a></li>
									<li><a href="${pageContext.request.contextPath}/MyPage/Message/msgMain.do">쪽지함</a></li>
									<li><a href="${pageContext.request.contextPath}/MyPage/Info/updateInfo.do">회원정보수정</a></li>
								</ul>
							</li>
						</security:authorize>
						<security:authorize access="!isAuthenticated()">
							<li>
								<a href="${pageContext.request.contextPath}/LoginJoin/Join/NJoin.do">LOGIN</a>
							</li>
						</security:authorize>
						<!-- 로그아웃 -->
						<security:authentication property="name" var="loginUser"/>
						<security:authorize access="isAuthenticated()">
							<li><a href="${pageContext.request.contextPath}/logout">${loginUser }로그아웃</a></li>
							<li id="messageBoxIcon">
								<a href="#">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
									<span class="badge" id="messageBadge" style="background-color: red; padding: 3px; position: absolute; right: 2px; top: 4px;">0</span>
								</a>
							</li>
						</security:authorize>
				   </ul>
				</nav>
			</div>
		</div>
	</nav>
</header>

<%--<textarea id="chatOutput" name="" class="chatting_history" rows="10" cols="30"></textarea>--%>
<div class="chatting_input">
	<input id="chatInput" type="text" class="chat">
	<button type="button" class="btn btn-default" onclick="sendMessage()"></button>
</div>

<!--메세지를 위한 웹소켓 구현-->
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		WebSocket.init();
	});

	let WebSocket = (function () {
		const SERVER_SOCKET_API = "${pageContext.request.contextPath}/websocket";
		let stompClient;
		let inputElm = document.getElementById("chatInput");
		//let textArea = document.getElementById("chatOutput");

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
		}

		function sendMessage(text) {

			let comment = "";
			let sender = '${loginUser }';
			let receiver = 'b@naver.com';

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

			inputElm.value = "";
		}

		function init() {
			connect();

			// 안읽은 쪽지를 조회하여 뱃지 API
			$.get('${pageContext.request.contextPath}/websocket')
		}

		return {
			init: init
		}
	})();

</script>
 

