<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<section class="account-section">
			<div></div>
			<main class="account-main" role="main">
				<article class="login-space">
					<div class="login-image">
						<div class="image-header">
							<img alt="" class="basics next-image" src="${pageContext.request.contextPath}/static/images/user/loginpageimages1.jpg">
							<img alt="" class="basics present-image" src="${pageContext.request.contextPath}/static/images/user/loginpageimages2.jpg">
							<img alt="" class="basics" src="${pageContext.request.contextPath}/static/images/user/loginpageimages3.jpg">
							<img alt="" class="basics" src="${pageContext.request.contextPath}/static/images/user/loginpageimages4.jpg">
							<img alt="" class="basics" src="${pageContext.request.contextPath}/static/images/user/loginpageimages5.jpg">
						</div>
					</div>
					<div class="input-space">
						<div class="input-part">
							<h1 class="sns-name">Instagram</h1>
							<div class="login-section">
								<form class="login-form" id="loginForm" method="post">
									<div class="form-space" style="margin-top: 24px;">
										<div class="login-input">
											<div class="entry-text">
												<label class="label">
													<span class="label-name">사용자 이름</span>
													<input aria-label="사용자 이름" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="75" name="username" id="username" type="text" class="aInput">
												</label>
												<div class="failOrSuccess"></div>
											</div>
										</div>
										<div class="login-input">
											<div class="entry-text">
												<label class="label">
													<span class="label-name">비밀번호</span>
													<input aria-label="비밀번호" aria-required="true" autocapitalize="off" autocorrect="off" name="password" id="password" type="password" class="aInput">
												</label>
												<div class="failOrSuccess"></div>
											</div>
										</div>
										<div class="form-space btn-space">
											<button class="account-btn login-btn" disabled="disabled" type="submit">
												<div class="form-space">로그인</div>
											</button>
										</div>
									</div>
									<div class="error-message">
										<p aria-atomic="true" data-testid="login-error-message" id="errorAlert" role="alert">
										
										</p>
									</div>
									<a class="password-reset" href="/accounts/password/reset/" tabindex="0">비밀번호를 잊으셨나요?</a>
								</form>
							</div>
						</div>
						<div class="input-part">
							<div class="link-space">
								<p class="link-account">
									계정이 없으신가요? 
									<a href="/gram/account/signup/" tabindex="0" style="text-decoration: none;">
										<span class="link-name">가입하기</span>
									</a>
								</p>
							</div>
						</div>
					</div>
				</article>
			</main>
			<c:import url="../temp/footer.jsp"></c:import>
		</section>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user.js"></script>
</body>
</html>