<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user.css">

</head>
<body>
	<div id="react-root">
		<div style="width: 100%; height: 100%;">
			<section class="account-section">
				<main class="account-main" role="main">
						<div class="pw_reset_nav">
							<div class="pw_reset_nav_logo">
								<div class="pw_reset_logo_div">
									<a href="/gram" tabindex="0">
										<div class="pw_reset_logo_area">
											<div class="reset_logo">
												<img alt="Instagram" class="page_logo" src="${pageContext.request.contextPath}/static/icons/WithUs-logo.png" style="width: 100px; height:80px; margin-top: 15px;">
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					<div class="pw-reset-space">
						<div class="pw-reset">
							<div class="pw_reset_contents">
								<div class="pw-reset-div" style="max-width: 388px;">
									<div class="pw_reset_contents">
										<div class="reset-icon-space">
											<img alt="" id="reset-icon" src="${pageContext.request.contextPath}/static/icons/lock.png">
										</div>
										<div class="reset_space">
											<h4 class="login_check_txt">로그인에 문제가 있나요?</h4>
										</div>
										<div class="reset_space">
											<div class="email_input_txt">
												사용자 이름를 입력하시면 가입 시 입력하신 메일로 임시 비밀번호를 보내드립니다.
											</div>
										</div>
										<div class="reset_space">
											<form method="post" class="reset-form" action="./reset">
												<label class="reset-label" for="email">
													<input class="user-input reset-input" id="username" name="username" spellcheck="true" type="text">
													<span class="reset-label-name">사용자 이름</span>
												</label>
											</form>
										</div>
										<div class="reset_space">
											<button class="reset-btn send-btn" disabled="" type="button">로그인 링크 보내기</button>
										</div>
										<div class="or-space">
											<div class="hr"></div>
											<div class="or-txt">또는</div>
											<div class="hr"></div>
										</div>
										<div class="reset_space">
											<a class="link-text" href="/gram/account/signup" tabindex="0">새 계정 만들기</a>
										</div>
										<div class="login-link-space">
											<div class="login-link-contents" style="height: 44px;">
												<a class="link-text" href="/gram/account/login" tabindex="0">로그인으로 돌아가기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
				<c:import url="../temp/footer.jsp"></c:import>
			</section>
		</div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profileEdit.js"></script>
	<script type="text/javascript">
		/*input 클릭 시 span 스타일 변경*/
		$(".user-input").on("focus",function(e){	
			$(".reset-label").addClass("reset-focus-visible");
		})
	
		/*input value가 있을 때*/
		$(".user-input").on("input",function(){
			if($(this).val()==''){
				$(this).siblings(".reset-label-name").removeClass("reset-change-label");
				$(this).removeClass("reset-input-change");
				$(".send-btn").attr("disabled", true);
			} else {		
				$(this).siblings(".reset-label-name").addClass("reset-change-label");
				$(this).addClass("reset-input-change");
				$(".send-btn").attr("disabled", false);
			}
		})
	
		/*input 포커스 잃었을 때 스타일 변경*/
		$(".user-input").on("blur",function(){
			$(".reset-label").removeClass("reset-focus-visible");
		})
		
		$(".reset-btn").click(function () {
			$(".reset-form").submit();
		})
				
		let msg = "${result}";
		if(msg!=""){
			alertMsg(msg);
		} 
	</script>
</body>
</html>