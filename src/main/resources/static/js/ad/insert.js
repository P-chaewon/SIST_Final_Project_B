/**
 * insert.js
 */
 
$(".write").click(function(){
	$(".frm").submit();
});

$("#img_icon").click(function(){
	// file 클릭 이벤트
	$(".img_file").click();
});

var openFile = function(event) {
	var input = event.target;
	var reader = new FileReader();

	reader.onload = function() {
		var dataURL = reader.result;
		var output = document.getElementById('thumbnail');
		output.src = dataURL;
	};
	reader.readAsDataURL(input.files[0]);
};

$(".img_file").change(function(){
	if ($(this).val() == "") {
		$("#default_img").show();
		$("#thumbnail").hide();
	} else {
		$("#default_img").hide();
		$("#thumbnail").show();
	}
});