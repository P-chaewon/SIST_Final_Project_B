/**
 * 
 */

$(".follow-btn").on("click",function () {
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");
	if(follow(true, followNum, userNum)==1){
		$(this).hide();
		$(this).siblings(".unfollow-btn").show();
	}
})
		
$(".unfollow-btn").on("click", function () {
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");
	if(follow(false, followNum, userNum)==0){
		$(this).hide();
		$(this).siblings(".follow-btn").show();
	}
})


$(".recommend_follow").click(function(){
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");
	if(follow(true, followNum, userNum)==1){
		$(this).hide();
		$(this).siblings("#btn_following").show();
	}	
})

$(".recommend_following").click(function(){
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");
	if(follow(false, followNum, userNum)==0){
		$(this).hide();
		$(this).siblings("#btn_follow").show();
	}	
})


function follow(check, followNum, userNum) {
	let folCheck=0;
	if(check){
		$.ajax({
			type : "POST",
			url : "/gram/friendships/follow",
			data : {
				followNum : followNum,
				userNum : userNum
			},
			async : false,
			success : function(result){
				if(result.trim()==1){					
					folCheck=1;
					console.log(folCheck);
				}
			}, 
			error : function(error, xhr, status){
				console.log(error);
			}
		})
	} else{
		$.ajax({
			type : "POST",
			url : "/gram/friendships/unfollow",
			data : {
				followNum : followNum,
				userNum : userNum
			},
			async : false,
			success : function(result){
				if(result.trim()==1){	
					folCheck=0;
					console.log(folCheck);
				}
			},
			error : function(error, xhr, status){
				console.log(error);
			}
		})
	}
	return folCheck;
}



