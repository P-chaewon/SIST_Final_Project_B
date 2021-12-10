/**
 * report_list.js
 */

var ck = 0;
var username = "";
var enabled = "";

$(".ck").click(function(){
	ck = $("input[name=userNum]").val();
	username = (this).getAttribute('data-user-name');
	enabled = (this).getAttribute('data-enabled');
});

$("#block").click(function(){
	if (ck == 0) {
		alert("정지할 계정을 선택해주세요.");
	} else if (enabled == 'false') {
		alert("이미 정지된 계정입니다.");
	}
	else {
		var result = confirm(username+"를 차단하시겠습니까?");
		if (result) {
			$("#frm").submit();
		}	
	}
});