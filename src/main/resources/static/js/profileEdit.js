/**
 프로필 편집 페이지 js
 */
 
/*데이터가 하나라도 변하면 button의 disabled 삭제*/
$(".input-update").on("input", function() {
    $(".update-btn").removeAttr("disabled");
 })
 
 /*ajax 회원정보수정*/
$(".update-btn").click(function(){	
	let website = $("#website").val();
	if(websiteCheck(website)){
		console.log(website);
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
				if(result.trim()==1){
					$(".update-btn").attr("disabled", "disabled");
					alertMsg("프로필이 저장되었습니다.");				
				} else {
					alertMsg("프로필이 저장되지 못했습니다.");
				}
			},
			error : function(error, status, xhr){
				alertMsg("프로필이 저장되지 못했습니다.");
			}		
		})	
	} else {
		alertMsg("올바른 웹사이트를 입력하세요.");
	}
})

/*profile 사진 등록*/
$(".icon-btn").click(function(){
	let fileName = $(this).attr("data-user-fileName");
	console.log(fileName);
	if(fileName==""){	
		$("#file").click();
	} else {
		$(".modal-container").show();
	}
})

$(".profile-update").click(function(){
	let fileName = $(this).attr("data-user-fileName");
	console.log(fileName);
	if(fileName==""){	
		$("#file").click();
	} else {
		$(".modal-container").show();
	}
})

$("#file").change(function(){
	let fileName = $(this).val();
	console.log(fileName == "");
	if(fileName != ""){	
		fileDelete();
		uploadFile();
		$(".modal-container").hide();
	}	
})


/*-------------------------------------- modal영역 버튼 시작 --------------------------------------*/
/*1. file Upload*/
$(".photo-upload").click(function(){
	$("#file").click();
})

/*2. fileDelete*/
$(".photo-delete").click(function(){
	console.log("delete");
	fileDelete();
	$(".modal-container").hide();
	$(".input-icon").attr("src", "/gram/static/icons/user.jpg");
})

/*3-1. 취소 버튼 클릭 시 modal close*/
$(".cancel").click(function(){
	$(".modal-container").hide();
})
/*3-2. modal 영역 외 클릭 시 modal close*/
$(document).mouseup(function (e){
  var modal = $(".modal-container");
  if(modal.has(e.target).length === 0){
    $(".modal-container").hide();
  }
});
/*-------------------------------------- modal영역 버튼 끝 --------------------------------------*/


/*비밀번호 변경 버튼 클릭*/
$(".pw-btn").click(function(){
	pwChangeCheck();
})

/*계정 삭제 버튼 클릭*/
$(".delete-btn").click(function () {
	removePwCheck();
})

/*계정 비활성화 버튼 클릭*/
$(".temporary-btn").click(function(){
	removePwCheck();
})



/*파일 upload 함수 ajax*/
function uploadFile(){
	let form = $(".profile-form")[0];
	let formData = new FormData(form);
	
	$.ajax({
		type : "POST",
		url : "./edit/fileUpdate",
		data : formData,
		contentType : false,
		processData : false,
		success : function(result) {
			console.log(result)
			$(".input-icon").attr("src", "/gram/static/upload/user/"+result.trim());
			$(".profile-button").attr("data-user-fileName", result.trim());
			$(".icon-btn").attr("data-user-fileName", result.trim());
			alertMsg("프로필 사진이 추가되었습니다.");
		},
		error : function(error, status, xhr) {
			alertMsg("프로필 사진이 추가되지 못했습니다.");
		}
		
	})
}

/*파일 삭제 함수*/
function fileDelete(){
	$.ajax({
		type : "POST",
		url : "./edit/fileDelete",
		success : function(result){	
			if(result.trim()==1){
				alertMsg("프로필 사진이 삭제되었습니다.");	
				$(".profile-button").attr("data-user-fileName", "");
				$(".icon-btn").attr("data-user-fileName", "");			
			} else {
				alertMsg("프로필 사진이 삭제되지 못했습니다.");
			}
		},
		error : function(error, status, xhr){
			alertMsg("프로필 사진이 삭제되지 못했습니다.");
		}
	})
}

/* 수정, 저장 후 알람 */
function alertMsg(msg){
	$(".update-text").html(msg);
	$(".update-ease-out").addClass("update-ease-in");
	$(".update-ease-in").removeClass("update-ease-out");
	setTimeout(function(){
		$(".update-ease-in").addClass("update-ease-out");
		$(".update-ease-out").removeClass("update-ease-in");
	}, 3000);	
}

/*웹사이트 유효성 검사*/
function websiteCheck(website){
	var websiteReg = /(http(s)?:\/\/|www.)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}([\/a-z0-9-%#?&=\w])+(\.[a-z0-9]{2,4}(\?[\/a-z0-9-%#?&=\w]+)*)*/gi;
	if(website.length == 0 || websiteReg.test(website)){
		return true;
	}
}

/*비밀번호 변경*/
function pwChangeCheck(){
	$.ajax({
		type : "POST",
		url : "/gram/account/password/check",
		data : {
			pw : $("#curPassword").val(),
			newPw : $("#newPassword").val(),
			confirmPw : $("#confirmPassword").val()
		},
		success : function(result){
			result = result.trim();
			if(result==0){
				alertMsg("이전 비밀번호가 잘못 입력되었습니다. 다시 입력해주세요.");
			} else {
				if($("#curPassword").val()==$("#newPassword").val()){
					alertMsg("현재 비밀번호와 다른 새 비밀번호를 만드세요.");
				} else {
					if($("#newPassword").val()!=$("#confirmPassword").val()){
						alertMsg("두 비밀번호가 일치하는지 확인하세요.");						
					} else {
						if(passwordCheck($("#newPassword").val())){
							pwChange();
						} else {
							alertMsg("6~20자의 영문, 숫자와 특수기호(~!-@#$%^&*+|=)만 사용 가능합니다.")
						}
					}
				}
			}
		},
		error : function(error, xhr, status){
			alertMsg("비밀번호 변경에 실패하였습니다");
		}
	})
}

function pwChange(){
	$.ajax({
		type : "POST",
		url : "/gram/account/password/change",
		data : {
			username : $("#changeUsername").val(),
			password : $("#newPassword").val()
		},
		success : function(result){
			if(result.trim()==1){
				alertMsg("비밀번호가 변경되었습니다.")
			} else {
				alertMsg("비밀번호 변경에 실패하였습니다.")
			}
		},
		error : function(error, xhr, status){
			alertMsg("비밀번호 변경에 실패하였습니다");
		}
	})
};

/*비밀번호 유효성 검사*/
function passwordCheck(password) {
	var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!-@#$%^&*+|=])[A-Za-z\d~!-@#$%^&*+|=]{6,20}$/;
	
	if(pwReg.test(password)){
		return true;
	}
}

/*탈퇴 비밀번호 확인*/
function removePwCheck() {
	$.ajax({
		type : "POST",
		url : "/gram/account/password/check",
		data : {
			pw : $("#password").val()
		},
		success : function (result) {
			console.log(result.trim());
			if(result.trim()==1){
				$(".delete-form").submit();
			} else {
				alertMsg("비밀번호가 일치하지 않습니다.");
			}
		},
		error : function(error, status, xhr){
			alertMsg("비밀번호가 일치하지 않습니다.");
		}
	})
}



