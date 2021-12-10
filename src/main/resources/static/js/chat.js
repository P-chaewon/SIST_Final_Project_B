/**
 * chat.js
 * chat.jsp javascript
 */
 
var stompClient = null;


function getChatUserList() {
	$.ajax({
		type: "GET"
		, url: "./getChatUserList"
		, success: function(result) {
			result = result.trim();
			$("#chatUserList").html(result);
		}, error: function(error) {
			console.log(error);
		}
	})
}



	
function setConnected(connected) {
  $("#connect").prop("disabled", connected);
  $("#disconnect").prop("disabled", !connected);
  if (connected) {
    $("#conversation").show();
  }
  else {
    $("#conversation").hide();
  }
  $("#greetings").html("");
}

// 소켓 연결
function connect() {
  var socket = new SockJS('/gram/websocket');
  stompClient = Stomp.over(socket);
  // SockJS와 stomp client를 통해 연결을 시도.
  stompClient.connect({}, function (frame) {
    setConnected(true);
    console.log('Connected: ' + frame);
    stompClient.subscribe('/topic/4', function (chat) {
		console.log(chat);
    	console.log(JSON.parse(chat.body));
    	showChat(JSON.parse(chat.body));
    });
  });
}

// 연결 해제
function disconnect() {
  if (stompClient !== null) {
    stompClient.disconnect();
  }
  setConnected(false);
  console.log("Disconnected");
}

function sendName() {
  // /app/chat으로 JSON 파라미터를 메세지 body로 전송.
  stompClient.send("/app/chat", {}, JSON.stringify({'userNickName': $("#name").val()}));
}

function showGreeting(message) {
  $("#greetings").append("<tr><td>" + message + "</td></tr>");
}

/* 채팅 메시지 보냄 */
function sendChat() {
	stompClient.send("/app/chat", {}, JSON.stringify({'reciverNum': 3, 'contents': $("#chatMessage").val()}));
}
/* 채팅 메시지 view */
function showChat(chat) {
  $("#greetings").append("<tr><td>" + chat.userNickName + " : " + chat.contents + "</td></tr>");
}





// 다큐먼트 실행 시
$(function () {
  $("form").on('submit', function (e) {
    e.preventDefault();
  });
  connect();
  
  getChatUserList();
  
  /* $( "#connect" ).click(function() { connect(); }); */
  $( "#disconnect" ).click(function() { disconnect(); });
  /* $( "#send" ).click(function() { sendName(); }); */
  $("#chatSend").click(function(){ sendChat(); });
  
  
});