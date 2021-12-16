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
	<c:import url="../temp/nav2.jsp"></c:import>
	<div id="react-root">
		<section class="edit-section">
			<sec:authentication property="principal" var="userVO"/>
			<div>
			</div>
			<main class="edit-main" role="main">
				<div class="profile-edit">
					<ul class="edit-ul">
						<li>
							<a class="edit-list not-selected" href="/gram/account/edit" tabindex="0">프로필 편집</a>
						</li>
						<li>
							<a class="edit-list selected" href="/gram/account/password/change/" tabindex="0">비밀번호 변경</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/manage_access/" tabindex="0">앱 및 웹사이트</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/push/setting/" tabindex="0">푸시 알림</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/privacy_and_security/" tabindex="0">개인정보 및 보안</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/remove/temporary/" tabindex="0">계정 비활성화</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/remove/permanent/" tabindex="0">회원 탈퇴</a>
						</li>
						<div class="switch-space">
							<div class="pro-account">
								<div class="switch-account ">
									<a class="switch-address" href="/accounts/convert_to_professional_account/" tabindex="0">프로페셔널 계정으로 전환</a>
								</div>
							</div>
						</div>
					</ul>
					<article class="edit-object">
							<div class="basics">
								<div class="photo-profile-1">
									<div class="icon-outline">
										<button class="icon-btn " title="프로필 사진">
											<c:choose>
												<c:when test="${not empty userVO.fileName }">
													<img alt="프로필 사진 추가" class="input-icon" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">									
												</c:when>
												<c:otherwise>
													<img alt="프로필 사진 추가" class="input-icon" src="${pageContext.request.contextPath}/static/icons/user.jpg">
												</c:otherwise>
											</c:choose>
										</button>
									</div>
								</div>
								<div class="photo-profile-2">
									<h1 class="username-txt" title="${userVO.username}">${userVO.username}</h1>
								</div>
							</div>
						<form class="pw-form" method="post">
							<input type="hidden" name="changeUsername" id="changeUsername" value="${userVO.username}">
							<div class="edit-data">
								<aside class="data-name ">
									<label for="curPassword">이전 비밀번호</label>
								</aside>
								<div class="input-change">
									<input autocomplete="current-password" class="pw-input" id="curPassword" name="curPassword" spellcheck="true" type="password">
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name ">
									<label for="newPassword">새 비밀번호</label>
								</aside>
								<div class="input-change">
									<input autocomplete="new-password" class="pw-input" id="newPassword" name="newPassword" spellcheck="true" type="password">
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name ">
									<label for="confirmPassword">새 비밀번호 확인</label>
								</aside>
								<div class="input-change">
									<input autocomplete="new-password" class="pw-input" id="confirmPassword" name="confirmPassword" spellcheck="true" type="password">
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name">
									<label></label>
								</aside>
								<div class="input-change">
									<div class="pw-btn-space">
										<button class="pw-btn" disabled="disabled" type="button">비밀번호 변경</button>
									</div>
								</div>
							</div>
						</form>
					</article>
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
	<script type="text/javascript">
		$(function () {			
			
		})
	</script>
</body>
</html>