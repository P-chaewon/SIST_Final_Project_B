/**
 * membership_list.js
 */
 
let num = -1;

$(".ck").click(function() {
	num = (this).getAttribute("data-membership-num");
});

$("#update").click(function() {
	if (num < 0) {
		alert("수정할 멤버십을 선택하세요.");
	} else {
		location.href = "./update?membershipNum=" + num;
	}
});

$("#delete").click(function() {
	if (num < 0) {
		alert("삭제할 멤버십을 선택하세요.");
	} else {
		location.href = "./delete?membershipNum=" + num;
	}
});