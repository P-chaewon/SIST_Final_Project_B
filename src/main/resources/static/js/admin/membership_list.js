/**
 * membership_list.js
 */
 
let num = -1;

var popupWidth = 500;
var popupHeight = 350;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
var popupY = (window.screen.height / 2) - (popupHeight / 2);

$(".ck").click(function() {
	num = (this).getAttribute("data-membership-num");
});

$("#update").click(function() {
	if (num < 0) {
		alert("수정할 멤버십을 선택하세요.");
	} else {
		window.open('./update?membershipNum='+ num, '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}
});

$("#delete").click(function() {
	if (num < 0) {
		alert("삭제할 멤버십을 선택하세요.");
	} else {
		var ck = confirm("정말 삭제하시겠습니까?");
		if (ck) {
			location.href = "./delete?membershipNum=" + num;	
		}
	}
});