/**
 * nav.js
 */

/* 알림창 토글 */
$(".alarm_img").click(function(){
	if ($("#alarm_contents").css("display") == "none") {
		// ajax로 최신 알림 5개 조회
		$.ajax({
			type: "get",
			url: "./alarm/getList",
			success: function(data) {
				data = data.trim();
				$("#alarm_contents").html(data);
			}
		});
		$("#alarm_contents").show();
	} else {
		$("#alarm_contents").hide();
	}
});

/* 알림창 아이콘 토글 */
$(".alarm_img").click(function(){
	if ($("#alarm_click").css("display") == "none") {
		$("#alarm_click").show();
		$("#alarm").hide();
	} else {
		$("#alarm_click").hide();
		$("#alarm").show();
	}
})