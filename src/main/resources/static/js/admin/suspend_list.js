/**
 * suspend_list.js
 */

var ck = 0;
var username = "";

$(".ck").click(function(){
	ck = $("input[name=usernum]").val();
	username = (this).getAttribute('data-user-name');
});

$("#unblock").click(function(){
	if (ck == 0) {
		alert("해제할 계정을 선택해주세요.");
	} else {
		var result = confirm(username+"를 해제하시겠습니까?");
		if (result) {
			$("#frm").submit();
		}
	}
});