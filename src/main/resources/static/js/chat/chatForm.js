/**
 * chatForm.js
 * chatForm.jsp javascript
 */
 
var stompClient = null;


// 채팅 폼 출력 --필요
function getChatForm() {
	console.log("rn:"+$(this).data('roomNum'));
	
	$.ajax({
		type: "GET"
		, url: "./getChatForm"
		, data: {
			
		}
		, success: function(result) {
			result = result.trim();
			$("#chat-right-area").html(result);
		}
		, error: function(error) {
			console.log(error);
		}
	})
}


/*
새로운 채팅 -- 유저 검색
*/
function getSearchUser(text) {
	$.ajax({
		type: "GET"
		, url: "../getSearchUser"
		, data: {
			searchText: text
		}
		, success: function(result) {
			result = result.trim();
			$("#modalSearchResultArea").html(result);
		}, error: function(error) {
			console.log(error);
		}
	})
}



/*
 채팅중인 유저 리스트 출력
*/
function getChatUserList() {
	$.ajax({
		type: "GET"
		, url: "../getChatUserList"
		, success: function(result) {
			result = result.trim();
			$("#chatUserList").html(result);
		}, error: function(error) {
			console.log(error);
		}
	})
}



	
function setConnected(connected) {
  if (connected) {
   	//연결 O
  }
  else {
    //X
  }
  $("#greetings").html("");
}

// 소켓 연결
function connect() {
  var socket = new SockJS('/gram/websocket');
  stompClient = Stomp.over(socket);
  // SockJS와 stomp client를 통해 연결을 시도.
  stompClient.connect({}, function () {
    //setConnected(true);
    //console.log('Connected: ' + frame);
    stompClient.subscribe('/topic/'+userNum, function (chat) {
		console.log('chat.body:'+JSON.parse(chat.body));
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



/* 채팅 메시지 보냄 */
function sendChat() {
	let data = {'userNum':userNum, 'receiverNum':receiverNum, 'contents':$("#chatMessage").val()};
	stompClient.send("/app/chat", {}, JSON.stringify(data));
	showChat(data);
	$("#chatMessage").val("").focus();
}


/* 채팅 메시지 view */
function showChat(chat) {
	console.log('showChat');
	$("#chatContentsArea").append(
		"<div class='contents-row'>"
			+ "<div class='r-row'>"
				+ "chat" + " : " + chat.contents
		+ "</div>"
		+ "</div>");
}





// 다큐먼트 실행 시
$(function () {
  $("form").on('submit', function (e) {
    e.preventDefault();
  });
  connect();
  
  getChatUserList();
  
  /* $( "#connect" ).click(function() { connect(); }); */
  /* $( "#disconnect" ).click(function() { disconnect(); }); */
  /* $( "#send" ).click(function() { sendName(); }); */
  $("#chatSend").click(function(){ sendChat(); });


/* modal event */
	$(".newChatBtn").click(function() {
		$(".modal").css('display', 'flex');
	}) 
	
	$(".modalCloseBtn").click(function() {
		$(".modal").css('display', 'none');
	})
	
	$("#searchText").on("change keyup paste", function() {
		console.log('변경!!!:'+$("#searchText").val());
		getSearchUser($("#searchText").val());
	});

});