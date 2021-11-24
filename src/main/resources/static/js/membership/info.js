/**
 * info.js
 */

var len = $(".td").length;
for (let i=0; i<len; i++) {
	let membershipNum = $("#td"+i).text();

	$.ajax({
		type: "get", 
		url: "./selectName",
		data: {membershipNum:membershipNum},
		success: function(data){
			data = data.trim();
			$("#td"+i).text(data);
		}
	});
}

/* 환불 요청 새 창 띄우기 */
var popupWidth = 600;
var popupHeight = 400;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
var popupY= (window.screen.height / 2) - (popupHeight / 2);

$("#refund").click(function(){
	window.open('./refund', '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
});