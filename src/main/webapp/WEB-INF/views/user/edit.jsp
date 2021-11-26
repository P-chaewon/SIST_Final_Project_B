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
							<a class="edit-list selected" href="/gram/account/edit/" tabindex="0">프로필 편집</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/password/change/" tabindex="0">비밀번호 변경</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/manage_access/" tabindex="0">앱 및 웹사이트</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/push/setting/" tabindex="0">푸시 알림</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/remove/temporary/" tabindex="0">계정 비활성화</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/privacy_and_security/" tabindex="0">개인정보 및 보안</a>
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
									<button class="icon-btn" title="프로필 사진 추가">
										<c:choose>
											<c:when test="${not empty userVO.fileName }">
												<img alt="프로필 사진 추가" class="input-icon" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">									
											</c:when>
											<c:otherwise>
												<img alt="프로필 사진 추가" class="input-icon" src="${pageContext.request.contextPath}/static/icons/user.jpg">
											</c:otherwise>
										</c:choose>
									</button>
									<div>
										<form enctype="multipart/form-data" method="POST" role="presentation" class="profile-form">
											<input accept="image/jpeg,image/png" class="profile-photo" type="file" name="file" id="file">
										</form>
									</div>
								</div>
							</div>
							<div class="photo-profile-2">
								<h1 class="my-username" title="${userVO.username }">${userVO.username}</h1>
								<button class="txt-btn profile-update" type="button">프로필 사진 바꾸기</button>
								<div>
									<form enctype="multipart/form-data" method="POST" role="presentation" class="profile-form">
										<input accept="image/jpeg,image/png" class="profile-photo" type="file" name="file" id="file">
									</form>
								</div>
							</div>
						</div>
						<form class="update-form" method="POST">
							<div class="edit-data">
								<aside class="data-name">
									<label for="nickname">닉네임</label>
								</aside>
								<div class="input-change">
									<div class="pChange" style="width: 100%; max-width: 355px;">
										<input aria-required="false" id="nickname" placeholder="닉네임" type="text" class="input-update" value="${userVO.nickname}">
										<div class="pInfo" style="width: 100%; max-width: 355px;">
											<div class="info-text">
												사람들이 회원님의 닉네임을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name">
									<label for="username">사용자 이름</label>
								</aside>
								<div class="input-change">
									<div class="pChange" style="width: 100%; max-width: 355px;">
										<input aria-required="false" id="username" placeholder="사용자 이름" type="text" class="readonly-data" readonly="readonly" value="${userVO.username}">
									</div>
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name">
									<label for="website">웹사이트</label>
								</aside>
								<div class="input-change">
									<div class="pChange" style="width: 100%; max-width: 355px;">
										<input aria-required="false" id="website" placeholder="웹사이트" type="url" class="input-update" value="${userVO.website}">
									</div>
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name">
									<label for="introduction">소개</label>
								</aside>
								<div class="input-change">
									<textarea class="input-introduction input-update" id="introduction">${userVO.introduction}</textarea>
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name">
									<label for="email">이메일</label>
								</aside>
								<div class="input-change">
									<div class="pChange" style="width: 100%; max-width: 355px;">
										<input aria-required="false" id="email" placeholder="이메일" type="text" class="input-update" value="${userVO.email}">
									</div>
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name">
									<label for="phone">전화번호</label>
								</aside>
								<div class="input-change">
									<div class="pChange" style="width: 100%; max-width: 355px;">
										<input aria-required="false" id="phone" placeholder="전화번호" type="text" class="input-update" value="${userVO.phone}">
									</div>
								</div>
							</div>
							<div class="edit-data">
								<aside class="data-name tvweK">
									<label></label>
								</aside>
								<div class="input-change">
									<div class="btn-space">
										<button class="blue-btn-small update-btn" disabled="disabled" type="button">제출</button>
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
	<div class="modal-container" role="presentation" style="display: none;">
		<div class="modal" role="dialog">
			<div class="modal-content">
				<div class="madal-space">
					<div class="modal-header">
						<h3 class="modal-header-text">프로필 사진 바꾸기</h3>
					</div>
					<div class="modal-body">
						<button class="modal-btn photo-upload " tabindex="0">사진 업로드</button>
						<button class="modal-btn photo-delete " tabindex="0">현재 사진 삭제</button>
						<button class="modal-btn cancel" tabindex="0">취소</button>
						<form enctype="multipart/form-data" action="./edit/fileUpdate" method="POST" role="presentation" class="profile-form">
							<input accept="image/jpeg,image/png" class="profile-photo" type="file" name="file" id="file">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profileEdit.js"></script>
</body>
</html>