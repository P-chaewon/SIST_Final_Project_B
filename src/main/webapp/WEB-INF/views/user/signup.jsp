<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="/">

<c:import url="../temp/head.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user.css" type="text/css">
</head>
<body>
	<div id="react-root">
		<section class="account-section">
			<div></div>
			<main class="account-main" role="main">
				<div class="signup-space" style="min-height: 100%;">
					<div class="input-space">
						<div class="input-part">
							<h1 class="sns-name">
								<img alt="" src="${pageContext.request.contextPath}/static/icons/WithUs-logo.png" width="180px;" >
							</h1>
							<div class="signup-section">
								<form class="signup-form" method="post">
									<h2 class="input-text">친구들의 사진을 보려면 가입하세요.</h2>
									<div class="form-space btn-space">
									</div>
									<div class="signup-input">
										<div class="entry-text">
											<label class="label">
												<span class="label-name">휴대폰 번호</span>
												<input aria-label="휴대폰 번호" aria-required="true" autocapitalize="off" autocomplete="tel"  name="phone" id="phone" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="aInput user-input signup-input">
											</label>
											<div class="failOrPass">
												<span class=""></span>
											</div>
										</div>
										<div class="fail-message"></div>
									</div>
									<div class="signup-input">
										<div class="entry-text">
											<label class="label">
												<span class="label-name">이메일 주소</span>
												<input aria-label="이메일 주소" aria-required="false" autocapitalize="sentences" autocorrect="off" name="email" id="email" type="email" class="aInput user-input signup-input">
											</label>
											<div class="failOrPass">
												<span class=""></span>
											</div>
										</div>
										<div class="fail-message"></div>
									</div>
									<div class="signup-input">
										<div class="entry-text">
											<label class="label">
												<span class="label-name">닉네임</span>
												<input aria-label="닉네임" aria-required="false" autocapitalize="sentences" autocorrect="off" name="nickname" id="nickname" type="text" class="aInput user-input signup-input">
											</label>
											<div class="failOrPass">
												<span class=""></span>
											</div>
										</div>
										<div class="fail-message"></div>
									</div>
									<div class="signup-input">
										<div class="entry-text">
											<label class="label">
												<span class="label-name">사용자 이름</span>
												<input aria-label="사용자 이름" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30" name="username" id="username" type="text" class="aInput user-input signup-input"  onkeyup="this.value=this.value.replace(/[^a-zA-Z-_0-9]/g,'');">
											</label>
											<div class="failOrPass">
												<span class=""></span>
											</div>	
										</div>
										<div class="fail-message">2글자 입력해주세요.</div>
									</div>
									<div class="signup-input">
										<div class="entry-text">
											<label class="label">
												<span class="label-name">비밀번호</span>
												<input aria-label="비밀번호" aria-required="true" autocapitalize="off" autocomplete="new-password" autocorrect="off" id="password" name="password" type="password" class="aInput user-input signup-input">
											</label>
											<div class="failOrPass">
												<span class=""></span>
											</div>
										</div>
										<div class="fail-message"></div>
									</div>
									<div class="signup-input">
										<div class="entry-text">
											<label class="label">
												<span class="label-name">비밀번호 재확인</span>
												<input aria-label="비밀번호 재확인" aria-required="true" autocapitalize="off" autocomplete="new-password" autocorrect="off" id="pwCheck" name="passwordCheck" type="password" class="aInput user-input signup-input">
											</label>
											<div class="failOrPass">
												<span class=""></span>
											</div>
										</div>
										<div class="fail-message"></div>
									</div>
									<div>
										<div class="form-space btn-space">
											<button class="account-btn signup-btn" disabled="disabled" type="button">가입</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="input-part">
							<div class="link-space">
								<p class="link-account">
									계정이 있으신가요? 
									<a href="/gram/account/login" style="text-decoration: none;" tabindex="0">
										<span class="link-name">로그인</span>
									</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</main>
			<c:import url="../temp/footer.jsp"></c:import>
		</section>
	</div>
	<div class="update-message-space">
		<div class="update-ease-out">
			<div class="update-message">
				<div class="update-text-space">
					<p class="update-text"></p>
				</div>
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath}/static/js/user.js"></script>
<script type="text/javascript">
	
	$(".signup-btn").click(function () {
		let email = $("#email").val();
		let phone = $("#phone").val();
		let nickname = $("#nickname").val();
		let username = $("#username").val();
		let password = $("#password").val();
		
		$.ajax({
			type : "POST",
			url : "/gram/account/signup",
			data : {
				email : email,
				phone : phone,
				nickname : nickname,
				username : username,
				password : password
			},
			success : function (result) {
				result=result.trim();
				if(result>0){
					authkeyMail(email, username);					
				}
			},
			error : function (error) {
				console.log("회원가입 실패");
			}
		})
	})
	
	
	function authkeyMail(email, username) {
		$.ajax({
			type : "GET",
			url : "/gram/account/mail",
			data : {
				email : email,
				username : username
			},
			success : function (result) {
				result = result.trim();
				$("#react-root").html(result);
			}
		})
		
	}
</script>
</body>
</html>