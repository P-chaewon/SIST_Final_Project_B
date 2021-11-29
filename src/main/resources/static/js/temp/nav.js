/**
 * nav.js
 */
$("#alarm").click(function(){
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