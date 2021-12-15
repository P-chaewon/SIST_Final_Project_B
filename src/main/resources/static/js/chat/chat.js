/**
 * chat.js
 * chat.jsp javascript
 */



/*
 채팅방 이동
 goChatRoom
 
 roomNum : 채팅방번호
 userNum : 상대방-
*/
function goChatRoom(roomNum, userNum) {
	console.log('roomNum');
	url='./t/'+roomNum; 

	var $form = $('<form></form>'); 
	$form.attr('action', url); 
	$form.attr('method', 'post'); 
	$form.appendTo('body'); 
	
	var hd1 = $('<input type="hidden" value="'+roomNum+'" name="roomNum">'); 
	var hd2 = $('<input type="hidden" value="'+userNum+'" name="userNum">'); 
	
	$form.append(hd1).append(hd2);
	
	$form.submit();
}



/*
새로운 채팅방 개설
*/
function newChat(userNum) {
	$.ajax({
		type: "GET"
		, url: "./newChat"
		, data: {
			userNum: userNum
		}
		, async: false
		, success: function(result) {
			result = result.trim();
			console.log(result);
		}
	});
}


/*
새로운 채팅 -- 유저 검색
*/
function getSearchUser(text) {
	$.ajax({
		type: "GET"
		, url: "./getSearchUser"
		, data: {
			searchText: text
		}
		, success: function(result) {
			result = result.trim();
			$("#modalSearchResultArea").html(result);
			
						
			$(".searchResult").on("click", function() {
				let userNum = $(this).data('usernum');
				newChat(userNum);
			});
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
		, url: "./getChatUserList"
		, success: function(result) {
			result = result.trim();
			$("#chatUserList").html(result);
			
			$(".chat-user-list-box").on("click", function() {
				let roomNum = $(this).data('roomnum');
				let userNum = $(this).data('usernum');
				goChatRoom(roomNum, userNum);
			})
		}, error: function(error) {
			console.log(error);
		}
	})
}






// 다큐먼트 실행 시
$(function () {
  getChatUserList();

	$(".newChatBtn").click(function() {
		$(".modal").css('display', 'flex');
	});
	
	$(".modalCloseBtn").click(function() {
		$(".modal").css('display', 'none');
	});
	
	$("#searchText").on("change keyup paste", function() {
		getSearchUser($("#searchText").val());
	});

});