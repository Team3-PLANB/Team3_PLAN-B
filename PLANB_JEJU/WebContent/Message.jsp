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
  <script src="js/sockjs.min.js"></script>
  <script src="js/stomp.min.js"></script>


<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    WebSocket.init();
});

	let WebSocket = (function() {
    const SERVER_SOCKET_API = "/websocket";
    const ENTER_KEY = 13;
    let stompClient;
    let textArea = document.getElementById("chatOutput");
    let inputElm = document.getElementById("chatInput");

    function connect() {
        let socket = new SockJS(SERVER_SOCKET_API);
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function () {
            stompClient.subscribe('/topic/roomId', function (msg) {
                printMessage(JSON.parse(msg.body).content);
            });
        });
    }

    function printMessage(message) {
        textArea.value += message + "\n";
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
        stompClient.send("/app/hello", {}, JSON.stringify({'content': text}));
    }

    function init() {
        connect();
        inputElm.addEventListener("keydown", chatKeyDownHandler);
    }
    return {
        init : init
    }
})();

</script>

</body>
</html>