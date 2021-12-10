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
					<sec:authorize access="isAuthenticated()">
						<c:import url="../temp/nav.jsp"></c:import>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<div class="pw_reset_nav">
							<div class="pw_reset_nav_logo">
								<div class="pw_reset_logo_div">
									<a href="/gram" tabindex="0">
										<div class="pw_reset_logo_area">
											<div class="reset_logo">
												<img alt="Instagram" class="page_logo" src="/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png" srcset="/static/images/web/mobile_nav_type_logo-2x.png/1b47f9d0e595.png 2x">
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</sec:authorize>
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
												이메일 주소를 입력하시면 계정에 다시 액세스할 수 있는 링크를 보내드립니다.
											</div>
										</div>
										<sec:authorize access="isAuthenticated()">
											<sec:authentication property="principal" var="userVO"/>
											<div class="reset_space focus">
												<form method="post">
													<label class="reset-label login-label" for="email">
														<input class="user-input login-reset-input reset-input-change" disabled="disabled" name="email" id="email" spellcheck="true" type="email" value="${userVO.email}">
														<span class="reset-label-name reset-change-label">이메일</span>
													</label>
												</form>
											</div>
											<div class="reset_space">
												<button class="reset-btn login-send-btn" type="button">로그인 링크 보내기</button>
											</div>
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
											<div class="reset_space">
												<form method="post">
													<label class="reset-label" for="email">
														<input class="user-input reset-input" id="email" name="email" spellcheck="true" type="email">
														<span class="reset-label-name">이메일</span>
													</label>
												</form>
											</div>
											<div class="reset_space">
												<button class="reset-btn send-btn" disabled="disabled" type="button">로그인 링크 보내기</button>
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
										</sec:authorize>
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
			} else {		
				$(this).siblings(".reset-label-name").addClass("reset-change-label");
				$(this).addClass("reset-input-change");
				$(".send-btn").removeAttr("disabled");
			}
		})
	
		/*input 포커스 잃었을 때 스타일 변경*/
		$(".user-input").on("blur",function(){
			$(".reset-label").removeClass("reset-focus-visible");
		})
	</script>
</body>
</html>