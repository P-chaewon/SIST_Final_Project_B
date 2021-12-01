/**
 * refund.js
 */

var ck = "";

// merchant_uid 변경
$(".check").click(function(){
	ck = $(this).val();
	console.log(ck);
});

// 취소 버튼 클릭
$("#cancel").click(function(){
	self.close();
});

// 다음 버튼 클릭
$("#next").click(function(){
	if (ck == "") {
		alert("환불 요청할 건을 선택해주세요.");
	} else {
		location.href = "./request?merchant_uid="+ck;
	}
});