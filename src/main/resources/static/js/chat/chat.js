/**
 * chat.js
 * chat.jsp javascript
 */



// 채팅 폼 출력 -----지우기?
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
//


// 이거 만들면 됩니당!!!!!! 1215
function newChat() {
	$.ajax({
		type: "GET"
		, url: "./newChat"
		, data: {
			
		}
	})
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
	}) 
	
	$(".modalCloseBtn").click(function() {
		$(".modal").css('display', 'none');
	})
	
	$("#searchText").on("change keyup paste", function() {
		console.log('변경!!!:'+$("#searchText").val());
		getSearchUser($("#searchText").val());
	});
});