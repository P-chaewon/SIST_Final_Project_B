/**
 * membership_insert.js
 */
 
$("#cancel").click(function(){
	self.close();
});

var membershipName = "";
var membershipAmount = 0;

$("#next").click(function(){
	
	membershipName = $("#membershipName").val();
	membershipAmount = $("#membershipAmount").val();
	
	if (membershipName != "" && membershipAmount != 0) {
		$.ajax({
		type: "post", 
		url: "./create",
		data: {
			membershipName:membershipName,
			membershipAmount:membershipAmount
		},
		async: false,
		success: function(data){
			data = data.trim();
			opener.document.location.href="./list";
			self.close();
		}
	});
	} else {
		alert("등록할 멤버십의 정보를 입력해주세요.");
	}	
})