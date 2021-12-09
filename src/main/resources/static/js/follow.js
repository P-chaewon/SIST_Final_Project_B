/**
 * 
 */

$(".follow-btn").on("click",function () {
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");
	if(followCount(true, followNum, userNum)>0){
		$(this).hide();
		$(this).siblings(".unfollow-btn").show();
		$(".start-btn-space").show();
	}
})
		
$(".unfollow-btn").on("click", function () {
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");
	if(followCount(false, followNum, userNum)>0){
		$(this).hide();
		$(this).siblings(".follow-btn").show();
	} else {
		$(this).hide();
		$(this).siblings(".follow-btn").show();
		$(".start-btn-space").hide();
	}
})

$(".start-btn").click(function(){
	location.reload(true);
})

$("#btn_follow").click(function(){
	let followNum=$(this).attr("data-follow-num");
	let userNum=$(this).attr("data-user-num");
	if(follow(true, followNum, userNum)==1){
		$(this).hide();
		$(this).siblings("#btn_following").show();
	}	
})

$("#btn_following").click(function(){
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
			context : this,
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


let folCount = 0;
function followCount(check, followNum, userNum) {
	if(check){
		$.ajax({
			type : "POST",
			url : "/gram/friendships/follow",
			data : {
				followNum : followNum,
				userNum : userNum
			},
			async : false,
			context : this,
			success : function(result){
				if(result.trim()==1){					
					folCount++;
					console.log(folCount);
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
					folCount--;			
					console.log(folCount);
				}
			},
			error : function(error, xhr, status){
				console.log(error);
			}
		})
	}
	return folCount;
}

