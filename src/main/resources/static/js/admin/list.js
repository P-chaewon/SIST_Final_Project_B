/**
 * list.js
 */

$("#status").change(function(){
	$("#frm").submit();
})

let status = $("#st").val();

$(".s").each(function() {
	if ($(this).val() == status) {
		$(this).prop("selected", true);
	}
});