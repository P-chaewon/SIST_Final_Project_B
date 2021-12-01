/**
 * membership_insert.js
 */
 
$("#cancel").click(function(){
	self.close();
});

var membershipNum = $("#membershipNum").val();
var membershipName = "";
var membershipAmount = 0;

$("#next").click(function(){
	
	membershipName = $("#membershipName").val();
	membershipAmount = $("#membershipAmount").val();
	
	if (membershipName != "" && membershipAmount != 0) {
		$.ajax({
			type: "post",
			url: "./update",
			data: {
				membershipNum: membershipNum,
				membershipName: membershipName,
				membershipAmount: membershipAmount
			},
			success: function(data) {
				data = data.trim();
				opener.document.location.href="./list";
				self.close();
			}
		});
	} else {
		alert("수정할 멤버십의 정보를 입력해주세요.");
	}	
});