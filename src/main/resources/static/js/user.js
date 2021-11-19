/**
 * 
 */

/*input 클릭 시 span 스타일 변경*/
$(".aInput").on("focus",function(e){	
	$(this).parents(".entry-text").addClass("focus-visible");	
	$(this).parent().next().children("span").removeAttr("class");
})

/*input value가 있을 때*/
$(".aInput").on("input",function(){
	if($(this).val()==''){
		$(this).siblings(".change-label").addClass("label-name");
		$(this).siblings(".label-name").removeClass("change-label");
		$(this).removeClass("aInput-change");
	} else {		
		$(this).siblings(".label-name").addClass("change-label");
		$(this).siblings(".change-label").removeClass("label-name");
		$(this).addClass("aInput-change");
	}
})

/*input 포커스 잃었을 때 스타일 변경*/
$(".aInput").on("blur",function(){
	$(".entry-text").removeClass("focus-visible");
})

/*로그인 page에서의 button disabled 삭제*/
$(".aInput").on("input",function(){
	if($("#username").val().length>1&&$("#password").val().length>5){
		$(".login-btn").removeAttr("disabled");
	} else {
		$(".login-btn").attr("disabled", "disabled");
	}
})

/*회원가입 페이지 유효성 검사*/
/*휴대폰 번호 검사*/
let phonePass = 0;
$("#phone").on("change", function(){
	let phone = $(this).val().length;
	if(phone==0){
		$(this).parent().next().children("span").removeAttr("class");
		$(this).parents(".entry-text").next().hide();
	} else if(phoneCheck(phone)){
		$(this).parent().next().children("span").addClass("pass-icon");
		$(this).parents(".entry-text").next().hide();
		phonePass = 1;
	} else {
		$(this).parent().next().children("span").addClass("fail-icon");
		$(this).parents(".entry-text").next().show();
		$(this).parents(".entry-text").next().text("휴대폰 번호를 다시 한번 확인해주세요.");
	}
})
/*이메일 검사*/
let mailPass = 0;
$("#email").on("change", function(){
	let email = $(this).val();
	if(email.length==0){
		$(this).parent().next().children("span").removeAttr("class");
		$(this).parents(".entry-text").next().hide();
	}else if(emailCheck(email)){
		$(this).parent().next().children("span").addClass("pass-icon");
		$(this).parents(".entry-text").next().hide();
		mailPass = 1;
	} else {
		$(this).parent().next().children("span").addClass("fail-icon");
		$(this).parents(".entry-text").next().show();
		$(this).parents(".entry-text").next().text("이메일 형식에 맞게 작성해주세요.");
	}
})
/*닉네임 검사*/
let nickPass = 0;
$("#nickname").on("change", function(){
	let nickname = $(this).val();
	if(nickname.length==0){
		$(this).parent().next().children("span").removeAttr("class");
		$(this).parents(".entry-text").next().hide();
	}else if(nicknameCheck(nickname)){
		$(this).parent().next().children("span").addClass("pass-icon");
		$(this).parents(".entry-text").next().hide();
		nickPass = 1;
	} else {
		$(this).parent().next().children("span").addClass("fail-icon");
		$(this).parents(".entry-text").next().show();
		$(this).parents(".entry-text").next().text("2글자 입력해주세요.");
	}
})
/*사용자 이름 중복확인*/
let idPass=0;
$("#username").on("change",function(){
	let username = $(this).val();
	if(usernameDuplicate(username)==1){
		$(this).parents(".entry-text").next().show();
		$(this).parents(".entry-text").next().text("이미 사용중인 아이디 입니다.");
	} else {
		if(username.length==0){
			$(this).parent().next().children("span").removeAttr("class");
			$(this).parents(".entry-text").next().hide();
		}else if(usernameCheck(username)){
			$(this).parent().next().children("span").addClass("pass-icon");
			$(this).parents(".entry-text").next().hide();
			idPass=1;
		} else {
			$(this).parent().next().children("span").addClass("fail-icon");
			$(this).parents(".entry-text").next().show();
			$(this).parents(".entry-text").next().text("4~20자의 영문, 숫자와 특수기호(_, -)만 사용 가능합니다.");
		}
	}
})

/*password 체크*/
let pwPass = 0;
$("#password").on("change", function(){
	let password = $(this).val();
	if(password.length==0){
		$(this).parent().next().children("span").removeAttr("class");
		$(this).parents(".entry-text").next().hide();
	}else if(passwordCheck(password)){
		$(this).parent().next().children("span").addClass("pass-icon");
		$(this).parents(".entry-text").next().hide();
		pwPass = 1;
	} else {
		$(this).parent().next().children("span").addClass("fail-icon");
		$(this).parents(".entry-text").next().show();
		$(this).parents(".entry-text").next().text("6~20자의 영문, 숫자와 특수기호(~!-@#$%^&*+|=)만 사용 가능합니다.");
	}
})
/*pw 재확인*/
let pwCheckPass=0;
$("#pwCheck").on("change", function(){
	let password = $("#password").val();
	let pwCheck = $(this).val();
	if(pwCheck.length==0){
		$(this).parent().next().children("span").removeAttr("class");
		$(this).parents(".entry-text").next().hide();
	}else if(pwDoubleCheck(password, pwCheck)){
		$(this).parent().next().children("span").addClass("pass-icon");
		$(this).parents(".entry-text").next().hide();
		pwCheckPass=1;
	} else {
		$(this).parent().next().children("span").addClass("fail-icon");
		$(this).parents(".entry-text").next().show();
		$(this).parents(".entry-text").next().text("비밀번호가 일치하지 않습니다.");
	}
	console.log(pwCheckPass);
})
/*유효성검사 전부 통과하면 button disabled 삭제*/
$(".aInput").on("change", function(){
	if(phonePass==1 && mailPass==1 && nickPass==1 && idPass==1 && pwPass==1 && pwCheckPass==1){
		$(".signup-btn").removeAttr("disabled");
	} else {
		$(".signup-btn").attr("disabled", "disabled");
	}
	
})

/*phone의 길이가 10 or 11이어야 true*/
function phoneCheck(phone){
	if(phone==10 || phone==11){
		return true;
	}
}

/*email 형식에 맞게 작성되어야 true*/
function emailCheck(email){
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(email.length!=0 && emailReg.test(email)){
		return true;
	}
}

/*nickname은 2글자 이상이어야 true*/
function nicknameCheck(nickname){
	var nicknameReg = /^[a-zA-Z0-9가-힣!@#$%^~*+=_-]{2,}$/i;
	if(nicknameReg.test(nickname)) {
		return true;
	}
}

/*username은 4글자 이상, 20글자 이하만 가능*/
function usernameCheck(username){
	var idReg = /^[a-zA-Z0-9_-]{4,20}$/i;
	if(idReg.test(username)){
		return true;
	}
}

/*username 중복 검사*/
function usernameDuplicate(username){
	var usernameResult=0;
	$.ajax({
		url : "/gram/account/idCheck",
		type : "GET",
		data : {username:username},
		async : false,
		success : function(result) {
			if(result==1){
				usernameResult = 1;
			}
		},
		error : function(xhr, status, error){
			console.log(error);
		}
	});
	return usernameResult;
}

/*password*/
function passwordCheck(password) {
	var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!-@#$%^&*+|=])[A-Za-z\d~!-@#$%^&*+|=]{6,20}$/;
	
	if(pwReg.test(password)){
		return true;
	}
}
/*비밀번호 재확인*/
function pwDoubleCheck(password, pwCheck) {
	if(password==pwCheck){
		return true;
	}
}
