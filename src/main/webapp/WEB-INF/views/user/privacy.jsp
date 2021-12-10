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
							<a class="edit-list not-selected" href="/gram/account/push/setting/" tabindex="0">푸시 알림</a>
						</li>
						<li>
							<a class="edit-list selected" href="/gram/account/privacy_and_security/" tabindex="0">개인정보 및 보안</a>
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
						<main class="privacy-space">
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">계정 공개 범위</h2>
									</div>
								</div>
								<div class="">
									<div class="privacy-check">
										<div class="account-privacy" id="accountPrivacy">
											<label class="check-label" for="f192c7b8c89c6f4">
												<input class="check-input" id="f192c7b8c89c6f4" type="checkbox" value="">
												<div class="check-box"></div>
												비공개 계정
											</label>
										</div>
									</div>
									<p class="privacy-explain">
										계정이 비공개 상태인 경우 회원님이 승인한 사람만 Instagram에서 회원님의 사진과 동영상을 볼 수 있습니다. 기존 팔로워는 영향을 받지 않습니다.
									</p>
								</div>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">활동 상태</h2>
									</div>
								</div>
								<div class="">
									<div class="privacy-check">
										<div class="account-privacy" id="activityStatus">
											<label class="check-label" for="f3549f96f1d716">
												<input class="check-input" id="f3549f96f1d716" type="checkbox" value="" checked="">
												<div class="check-box"></div>
												활동 상태 표시
											</label>
										</div>
									</div>
									<p class="privacy-explain">
										Instagram 앱에서 최근 활동한 시간 정보가 회원님이 팔로우하는 계정 및 메시지를 보낸 모든 사람에게 표시됩니다. 이 설정을 해제하면 다른 계정의 활동 상태를 볼 수 없습니다.
									</p>
								</div>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">스토리 공유</h2>
									</div>
								</div>
								<div class="">
									<div class="privacy-check">
										<div class="account-privacy" id="feedPostReshareDisabled">
											<label class="check-label" for="f307ad7383e87c8">
												<input class="check-input" id="f307ad7383e87c8" type="checkbox" value="" checked="">
												<div class="check-box"></div>
												공유 허용
											</label>
										</div>
									</div>
									<p class="privacy-explain">
										사람들이 회원님의 스토리를 메시지로 공유할 수 있습니다
									</p>
								</div>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">댓글</h2>
									</div>
								</div>
								<a class="privacy-link" href="/accounts/comment_filter/" tabindex="0">댓글 설정 수정</a>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">내가 나온 사진</h2>
									</div>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonusertagReviewEnabledautomatic" name="usertagReviewEnabled" type="radio" value="automatic" checked="">
												자동으로 추가
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonusertagReviewEnabledmanual" name="usertagReviewEnabled" type="radio" value="manual">
												수동으로 추가
											</div>
										</label>
									</fieldset>
									<p class="privacy-explain">
										<span>회원님이 나온 사진을 프로필에 추가할 방법을 선택하세요.</span> 
											회원님이 나온 사진에 대해 
										<a class="privacy-link" href="https://help.instagram.com/1874272716133511" rel="nofollow noopener noreferrer" target="_blank">
											더 알아보기
										</a>
									</p>
								</div>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">계정 데이터</h2>
									</div>
								</div>
								<a class="privacy-link" href="/accounts/access_tool/" tabindex="0">계정 데이터 보기</a>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">2단계 인증</h2>
									</div>
								</div>
								<a class="privacy-link" href="/accounts/two_factor_authentication/" tabindex="0">2단계 인증 설정 수정</a>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">데이터 다운로드</h2>
									</div>
								</div>
								<a class="privacy-link" href="/download/request/" tabindex="0">다운로드 요청</a>
							</section>
							<section class="privacy-section">
								<div class="privacy-div">
									<div class="privacy-name-space">
										<h2 class="privacy-name">개인정보 및 보안 도움말</h2>
									</div>
								</div>
								<a class="privacy-link" href="/accounts/data_controls_support/" tabindex="0">지원</a>
							</section>
						</main>
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
</body>
</html>