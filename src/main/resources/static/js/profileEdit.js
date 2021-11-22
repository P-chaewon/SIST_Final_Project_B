/**
 프로필 편집 페이지 js
 */
 
/*데이터가 하나라도 변하면 button의 disabled 삭제*/


$(".input-update").on("input", function() {
    $(".update-btn").removeAttr("disabled");
 })
/*profile 사진 등록*/
$(".icon-btn").click(function(){
	$("#file").click();
})
$(".profile-button").click(function(){
	$("#file").click();
})



/*ajax 회원정보수정*/
$(".update-btn").click(function(){
	
	$.ajax({
		type:"POST",
		url:"account/edit",
		data: {
			nickname:$("#nickname").val(),
			username:$("#username").val(),
			website:$("#website").val(),
			introduction:$("#introduction").val(),
			email:$("#email").val(),
			phone:$("#phone").val()
		},
		success : function(result){			
			alert("update");
		},
		error : function(error, status, xhr){
			console.log(error)
		}
		
	})
	
})

