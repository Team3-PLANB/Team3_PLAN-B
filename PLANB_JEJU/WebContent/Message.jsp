<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
  <textarea id="chatOutput" name="" class="chatting_history" rows="24"></textarea>
  <div class="chatting_input">
    <input id="chatInput" type="text" class="chat">
  </div>

<script src="/js/sockjs.min.js"></script>
<script src="/js/stomp.min.js"></script>


<!--메세지를 위한 웹소켓 구현-->
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		WebSocket.init();
	});

	let WebSocket = (function () {
		const SERVER_SOCKET_API = "${pageContext.request.contextPath}/websocket";
		const ENTER_KEY = 13;
		let stompClient;
		let textArea = document.getElementById("chatOutput");
		let inputElm = document.getElementById("chatInput");

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
			textArea.value += message + "\n - ";
		}

		function chatKeyDownHandler(e) {
			if (e.which === ENTER_KEY && inputElm.value.trim() !== "") {
				sendMessage(inputElm.value);
				clear(inputElm);
			}
		}

		function clear(input) {
			input.value = "";
		}

		function sendMessage(text) {

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
				comment: text,
				sender: sender,
				receiver: receiver
			};

			console.log(message);

			stompClient.send("/stomp/sendToUser", {}, JSON.stringify(message));
		}

		function init() {
			connect();
			inputElm.addEventListener("keydown", chatKeyDownHandler);
		}

		return {
			init: init
		}
	})();

</script>
 

</body>
</html>