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

$(".follower").click(function(){
	let username=$(this).attr("data-user-name");
	let url = "/gram/"+username+"/followers"
	console.log(url);
	$.ajax({
		type : "GET",
		url : "/gram/"+username+"/followers",
		success : function(result){
			result = result.trim();
			$(".follower-modal-list").html(result);
			$(".follower-modal-container").show();
		}
	})
})

$(".follow-modal-close-txt").click(function(){
	$(".following-modal-container").hide();
	$(".follower-modal-container").hide();
	location.reload(true);
})

/*unfollow modal*/
$(".unfollow-modal-btn").click(function(){
	$(".unfollow-modal-container").show();
})


$(".modal-close").click(function(){
	$(".unfollow-modal-container").hide();
})
/*unfollow modal*/




