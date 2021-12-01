/**
 * info.js
 */

/* 환불 요청 새 창 띄우기 */
var popupWidth = 600;
var popupHeight = 400;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
var popupY= (window.screen.height / 2) - (popupHeight / 2);

$("#refund").click(function(){
	window.open('./refund', '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
});

/* 결제 실패 조회 */
$(".fail").click(function(){
	alert((this).getAttribute('data-apply-num'));
});