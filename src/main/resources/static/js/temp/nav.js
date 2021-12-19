/**
 * nav.js
 */

/* 알림창 토글 */
$(".alarm_img").click(function(){
	if ($("#alarm_contents").css("display") == "none") {
		// ajax로 최신 알림 5개 조회
		$.ajax({
			type: "get",
			url: "/gram/alarm/getList",
			success: function(data) {
				data = data.trim();
				$("#alarm_contents").html(data);
			}
		});
		$("#alarm_contents").show();
		// 스크롤 제한 on
		// $('html, body').css({'overflow': 'hidden', 'height': '100%'});
	} else {
		$("#alarm_contents").hide();
		// 스크롤 제한 off
		// $('html, body').css({'overflow': 'auto', 'height': 'auto'});
	}
});

/* 알림창 아이콘 토글 */
/*$(".alarm_img").click(function(){
	if ($("#alarm_click").css("display") == "none") {
		$("#alarm_click").show();
		$("#alarm").hide();
	} else {
		$("#alarm_click").hide();
		$("#alarm").show();
	}
})*/


function getSearchUser(text) {
	$.ajax({
		type: "GET"
		, url: "/gram/getSearchUser"
		, data: {
			searchText: text
		}
		, success: function(result) {
			result = result.trim();
			$("#search-modalSearchResultArea").html(result);
		}, error: function(error) {
			console.log(error);
		}
	})
}


	$("#search").click(function() {
		if($(".search_modal").css('display') == 'none'){
		$('.search_modal').css({"display": "block"});
	}else{
		$('.search_modal').css({"display": "none"});
	}
	});
	
	$(".search-modalCloseBtn").click(function() {
		$(".search_modal").css('display', 'none');
	});
	
	$("#searchText").on("change keyup paste", function() {
		getSearchUser($("#searchText").val());
	});
	