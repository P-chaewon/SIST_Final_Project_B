<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user.css">
</head>
<body class="" style="">      
	<div id="react-root">
		<div style="width: 100%; height: 100%;">
			<div style="width: 100%; height: 100%;">
				<section class="mail-section">
					<div></div>
					<main class="mail-main" role="main">
						<div class="mail-confirmation" style="min-height: 100%;">
							<div class="confirmation-space">
								<div class="confirmation">
									<h1 class="sns-txt">Instagram</h1>
									<div class="confirmation-txt" style="max-width: 350px;">
										<span aria-label="이메일 확인" class="glyphsSpriteEmail_confirm u-__7"></span>
										<div class="mail-txt-space">
											<div class="code-input-txt">인증 코드 입력</div>
										</div>
										<div class="rt-space">
											<div class="send-mail">
												chae1zd.b@gmail.com 주소로 전송된 인증 코드를 입력하세요. 
												<button class="rt-btn" type="button">코드 재전송.</button>
											</div>
										</div>
									</div>
									<div class="mail-form-space" style="width: 100%;">
										<form method="POST">
											<div class="confirmation-form" style="max-width: 350px;">
												<div class="confirmation-code" style="width: 100%;">
													<input aria-label="인증 코드" autocomplete="false" class="mail-code" maxlength="8" name="email_confirmation_code" placeholder="인증 코드" spellcheck="true" type="text" value="">
												</div>
												<div class="next-space" style="width: 100%;">
													<button class="next-btn" disabled="" type="submit">다음</button>
												</div>
												<div class="back-space">
													<button class="back-btn" type="button">돌아가기</button>
												</div>
												<div class="code-error">
													<div class="code-error-txt">
														코드가 유효하지 않습니다. 새 코드를 요청하세요.
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="input-part">
									<div class="link-space">
										<p class="link-account">
											계정이 있으신가요? 
											<a href="/gram/account/login" tabindex="0" >
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
</body>
</html>