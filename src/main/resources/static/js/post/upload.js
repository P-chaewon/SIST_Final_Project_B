/**
 * 
 */
 
/**
 * insert.js
 */
 
$(".write").click(function(){
	$(".frm").submit();
});

$("#default_img").click(function(){
	// file 클릭 이벤트
	$(".img_file").click();
});

$("#thumbnail").click(function(){
	// file 클릭 이벤트
	$(".img_file").click();
});


var delay = 100;

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
		$("#thumbnail").fadeIn(150);
		$("#thumbnail").css({"width":"474", "height":"458px", "margin-left":"-1px"});
		$("#default_img").hide();
		$(".multi_files").show();
	}
});