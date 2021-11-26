/**
 * refund.js
 */
 
$("#done").click(function(){
	$("#frm").submit();
});

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