/**
 * 
 */
 
 $(".follow-btn").click(function () {
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");	
	follow(true, followNum, userNum);	
	$(this).hide();
	$(this).siblings("button").show();		
})

$(".unfollow-btn").click(function(){
	$(this).hide();
	$(this).siblings("button").show();
})

function follow(check, followNum, userNum) {
	if(check){
		$.ajax({
			type : "POST",
			url : "/gram/friendships/follow",
			data : {
				followNum : followNum,
				userNum : userNum
			},
			success : function(result){
				if(result.trim()==1){
					
				}
			}, 
			error : function(error, xhr, status){
				console.log(error);
			}
		})
	}
}