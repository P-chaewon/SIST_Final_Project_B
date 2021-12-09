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
		<section class="pw-chal-section">
			<main class="pw-chal-main">
				<div class="pw_recov">
					<div class="pw_recov_nav">
						<div class="pw_nav_logo">
							<a href="/gram" tabindex="0">
								<div class="pw_reset_logo_area">
									<div class="reset_logo">
										<img alt="Instagram" class="page_logo" src="${pageContext.request.contextPath}/static/icons/instagram_logo.png">
									</div>
								</div>
							</a>
						</div>
						<div class="pw_reset_btn_area">
							<div class=""></div>
							<button class="other_account_login" type="button">
								<div class="other_login_text">다른 계정으로 로그인</div>
							</button>
						</div>
					</div>
				</div>
				<div class="challenge" style="height: 100%;">
					<div class="pw_challenge">
						<div class="chal_check">
							<div class="challenge_check_area">
								<div class="challenge_check">
									<h4>이메일 전송됨</h4>
								</div>
								<div class="challenge_text_area">
									<div class="challenge_text">
										계정에 다시 로그인할 수 있는 링크가 포함된 이메일을 
											<div class="challenge_mail_address">
												c*******4@gmail.com
											</div> 
										주소로 보내드렸습니다.
									</div>
								</div>
								<div class="challenge_btn_area">
									<button class="challenge_btn" type="button">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</section>
	</div>
</body>
</html>