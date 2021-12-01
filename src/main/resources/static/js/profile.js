/**
 * 
 */
 
$(".edit-btn").click(function(){
	location.href = "/gram/account/edit";
})

$(".following").click(function(){
	let username=$(this).attr("data-user-name");
	let url = "/gram/"+username+"/following"
	console.log(url);
	$.ajax({
		type : "GET",
		url : "/gram/"+username+"/following",
		success : function(result){
			result = result.trim();
			$(".follow-modal-list").html(result);
			$(".following-modal-container").show();
		}
	})
})

$(".follow-modal-close-txt").click(function(){
	$(".following-modal-container").hide();
})

$(document).mouseup(function (e){
  var modal = $(".following-modal-container");
  if(modal.has(e.target).length === 0){
    $(".following-modal-container").hide();
  }
});

$(".following-modal-btn").on("click", function(){
	$(".unfollow-modal-container").show();
})