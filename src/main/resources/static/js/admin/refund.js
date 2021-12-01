/**
 * refund.js
 */

var uids = $(".uid");

for (var uid of uids) {
  let merchant_uid = uid.getAttribute("data-merchant-uid");
  $.ajax({
		type: "get", 
		url: "./selectInfo",
		data: {merchant_uid:merchant_uid},
		async: false,
		success: function(data){
			data = data.trim();
			$("#c_"+merchant_uid).html(data);
		}
	});
}

$(".contents").hide();

$(".t").click(function(){
	let merchant_uid = (this).getAttribute("data-merchant-uid");
	if ($("#c_"+merchant_uid).css("display") == "none") {
		$("#c_"+merchant_uid).show();
	} else {
		$("#c_"+merchant_uid).hide();
	}
});

var flag = false;

$("#done").click(function(){
	// 체크 값 확인
	var ck_boxes = $(".ck_box");
	
	for (var ck_box of ck_boxes) {
		if (ck_box.checked) {
			flag = true;
			break;
		}
	}
	
	if (flag) {
		var result = confirm("환불 완료 처리하시겠습니까?");
		if (result) {
			$("#frm").submit();
		}
	} else {
		alert("환불 완료 처리할 건을 선택해주세요.");
	}
});