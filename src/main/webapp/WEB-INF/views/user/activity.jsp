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
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/profileEdit.css" type="text/css">
</head>
<body>
	<c:import url="../temp/nav.jsp"></c:import>
	<div id="react-root">
		<section class="edit-section">
			<div>
			</div>
			<main class="edit-main" role="main">
				<div class="profile-edit">
					<ul class="edit-ul">
						<li>
							<a class="edit-list not-selected" href="/gram/account/edit" tabindex="0">프로필 편집</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/password/change/" tabindex="0">비밀번호 변경</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/manage_access/" tabindex="0">앱 및 웹사이트</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/emails/setting/" tabindex="0">이메일 및 SMS</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/push/setting/" tabindex="0">푸시 알림</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/contact_history/" tabindex="0">연락처 관리</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/privacy_and_security/" tabindex="0">개인정보 및 보안</a>
						</li>
						<li>
							<a class="edit-list selected" href="/gram/session/login_activity/" tabindex="0">로그인 활동</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/emails/emails_sent/" tabindex="0">Instagram에서 보낸 이메일</a>
						</li>
						<div class="switch-space">
							<div class="pro-account">
								<div class="switch-account ">
									<a class="switch-address" href="/accounts/convert_to_professional_account/" tabindex="0">프로페셔널 계정으로 전환</a>
								</div>
							</div>
						</div>
					</ul>
				
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profileEdit.js"></script>
</body>
</html>