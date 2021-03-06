/**
 * chat.js
 * chat.jsp javascript
 */



/*
 채팅방 이동
 goChatRoom
 
 roomNum : 채팅방번호
 userNum : 상대방-유저번호
*/
function goChatRoom(roomNum, userNum, userId) {
	url='./t/'+roomNum; 

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
	$.ajax({
		type: "GET"
		, url: "./newChat"
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
	console.log("st:"+text);
	text = text.trim();
	
	if (text.length == 0) {//검색어 없을 때
		
		$.ajax({
			type: "GET"
			, url: "./getFollowUser"
			, success: function(result) {
				$("#modalSearchResultArea").html(result);
			
				$(".searchResult").on("click", function() {
					let userNum = $(this).data('usernum');
					let userId = $(this).find('.suId').text();
					
					newChat(userNum, userId);
				});
			}
			, error: function(error) {
				console.log(error);
			}
		})
	} else {
		$.ajax({
			type: "GET"
			, url: "./getSearchUser"
			, data: {
				searchText: text
			}
			, success: function(result) {
				result = result.trim();
				
				if (!result) {
					let noResult = "<div class='noSearchResult'> 계정을 찾을 수 없습니다. </div>"
					$("#modalSearchResultArea").html(noResult);
				} else {
					$("#modalSearchResultArea").html(result);
				
					$(".searchResult").on("click", function() {
						let userNum = $(this).data('usernum');
						let userId = $(this).find('.suId').text();
						
						newChat(userNum, userId);
					});
				}
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
		, url: "./getChatUserList"
		, success: function(result) {
			result = result.trim();
			$("#chatUserList").html(result);
			
			$(".chat-user-list-box").on("click", function() {
				let roomNum = $(this).data('roomnum');
				let userNum = $(this).data('usernum');
				let userId = $(this).find('.user-id').text();
				
				goChatRoom(roomNum, userNum, userId);
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