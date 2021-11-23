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

$("#file").change(function(){
	uploadFile();
})

function uploadFile(){
	let form = $(".profile-form")[0];
	let formData = new FormData(form);
	let username = $(".my-username").html();
	console.log(username);
	
	$.ajax({
		type : "POST",
		url : "./edit/fileUpdate",
		data : formData,
		contentType : false,
		processData : false,
		success : function(result) {
			alert(result);
		},
		error : function(error, status, xhr) {
			alert("error");
		}
		
	})
}


/*ajax 회원정보수정*/
$(".update-btn").click(function(){
	
	$.ajax({
		type:"POST",
		url:"./edit",
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

