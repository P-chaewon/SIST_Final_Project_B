/**
 * chatForm.js
 * chatForm.jsp javascript
 */
 
var stompClient = null;


/*
 채팅방 - 정보 
 */
function getDetailInfo() {
	$(".chat-right-area").empty();
	
	let $button = $('<button></button>');
	$button.attr('class', 'aa');
	$(".chat-right-area").append($button);
	
	

}



/*
 채팅방 이동
 goChatRoom
 
 roomNum : 채팅방번호
 userNum : 상대방-
*/
function goChatRoom(roomNum, userNum, userId) {
	url='./'+roomNum; 

	let $form = $('<form></form>'); 
	$form.attr('action', url); 
	$form.attr('method', 'post'); 
	$form.appendTo('body'); 
	
	let hd1 = $('<input type="hidden" value="'+roomNum+'" name="roomNum">'); 
	let hd2 = $('<input type="hidden" value="'+userNum+'" name="userNum">'); 
	let hd3 = $('<input type="hidden" value="'+userId+'" name="receiverUserId">'); 

	$form.append(hd1).append(hd2).append(hd3);
	
	$form.submit();
}




/*
새로운 채팅방 개설
*/
function newChat(userNum, userId) {
	console.log('newChat');
	$.ajax({
		type: "GET"
		, url: "../newChat"
		, data: {
			userNum: userNum
		}
		, success: function(result) {
			
			goChatRoom(result, userNum, userId);
		}, error: function(error) {
			console.log(error);
		}
	});
}



/*
새로운 채팅 -- 유저 검색
*/
function getSearchUser(text) {
	text = text.trim();
	
	//검색어 없을 때
	if (text.length == 0) {
		$("#modalSearchResultArea").find(".searchResult").remove();
		$(".noSearchResult").css('display', 'flex');
	} else {
		$.ajax({
			type: "GET"
			, url: "../getSearchUser"
			, data: {
				searchText: text
			}
			, success: function(result) {
				result = result.trim();
				$("#modalSearchResultArea").html(result);
				
				$(".searchResult").on("click", function() {
					let userNum = $(this).data('usernum');
					let userId = $(this).find('.suId').text();
					
					newChat(userNum, userId);
				});
			}, error: function(error) {
				console.log(error);
			}
		})
	}
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
			
			$(".chat-user-list-box").on("click", function() {
				let roomNum = $(this).data('roomnum');
				let userNum = $(this).data('usernum');
				let userId = $(this).find('.user-id').text();
				
				goChatRoom(roomNum, userNum, userId);
			});
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
		//console.log('chat.body:'+JSON.parse(chat.body));
    	showChat(JSON.parse(chat.body).contents, 'l');
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


/* 기존 채팅 메시지 db에서 불러와서 html 렌더링 */
function getChatLog() {
	console.log('roomNum:'+roomNum);
	$.ajax({
		type: "POST"
		, url: "../getChatMessage"
		, data: {
			roomNum : roomNum
		}
		, success: function(result) {
			$.each (result, function(key, value) {
				console.log("con:"+value.contents);
				
				if (userNum == value.userNum) {
					showChat(value.contents, 'r');
				} else {
					showChat(value.contents, 'l');
				}
			})
			
			chatScrollDown();
		}, error: function(error) {
			console.log(error);
		}
	})
}


/* 채팅 가장 아래로 스크롤 */
function chatScrollDown() {
	$(".chat-contents-wrap").scrollTop($('.chat-contents-wrap')[0].scrollHeight);
}


/* 채팅 메시지 보냄 */
function sendChat() {
	let contents = $("#chatMessage").val();
	let data = {'roomNum': roomNum, 'userNum':userNum, 'receiverNum':receiverNum, 'contents':contents};
	
	if (contents.trim().length != 0) {
		stompClient.send("/app/chat", {}, JSON.stringify(data));
		showChat(data.contents, 'r');
	}
	$("#chatMessage").val("").focus();
	
	chatScrollDown();
}


/* 채팅 메시지 view */
function showChat(chat, gbn) {

	$("#chatContentsArea").append(
		"<div class='contents-row'>"
			+ "<div class='"+gbn+"-row'>"
				+ "<div class='chatContent'>"+ chat +"</div>"
		+ "</div>"
		+ "</div>");
}




// 다큐먼트 실행 시
$(function () {
	// form 이벤트 해제
	$("form").on('submit', function (e) {
		e.preventDefault();
	});
	
	connect();
		  
	getChatUserList();
		  
	getChatLog();
  
  
  

	/* 채팅전송 */
	$("#chatSend").click(function(){ sendChat(); });
	$("#chatMessage").keyup(function(e) {
	if (e.keyCode == 13) { //엔터키
			sendChat();
		}
	});
	
	/* 상세정보 */
	$("#detailInfoBtn").click(function() {
		getDetailInfo();
	})


	/* *** modal event *** */
	$(".newChatBtn").click(function() {
		$(".modal").css('display', 'flex');
	}) 
	
	$(".modalCloseBtn").click(function() {
		$(".modal").css('display', 'none');
	})
	
	//모달검색
	$("#searchText").on("change keyup paste", function() {
		getSearchUser($("#searchText").val());
	});
	
	

});