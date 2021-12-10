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
							<a class="edit-list not-selected" href="/gram/account/edit/" tabindex="0">프로필 편집</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/password/change/" tabindex="0">비밀번호 변경</a>
						</li>
						<li>
							<a class="edit-list not-selected" href="/gram/account/manage_access/" tabindex="0">앱 및 웹사이트</a>
						</li>
						<li>
							<a class="edit-list selected" href="/gram/account/push/setting/" tabindex="0">푸시 알림</a>
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
						<div class="push-setting-space">
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">좋아요</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonlikes1" name="likes" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonlikes2" name="likes" type="radio" value="2">
												내가 팔로우하는 사람
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonlikes3" name="likes" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님이 회원님의 사진을 좋아합니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">댓글</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtoncomments1" name="comments" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtoncomments2" name="comments" type="radio" value="2">
												내가 팔로우하는 사람
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtoncomments3" name="comments" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님이 댓글을 남겼습니다: "멋지네요!"
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
								<h2 class="setting-name">댓글 좋아요</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtoncomment_likes1" name="comment_likes" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtoncomment_likes2" name="comment_likes" type="radio" value="2" checked="">
												내가 팔로우하는 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님이 회원님의 댓글을 좋아합니다: "멋지네요!"
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">회원님이 나온 사진의 좋아요 및 댓글</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonlike_and_comment_on_photo_user_tagged1" name="like_and_comment_on_photo_user_tagged" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonlike_and_comment_on_photo_user_tagged2" name="like_and_comment_on_photo_user_tagged" type="radio" value="2" checked="">
												내가 팔로우하는 사람
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonlike_and_comment_on_photo_user_tagged3" name="like_and_comment_on_photo_user_tagged" type="radio" value="3">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님이 회원님이 태그된 게시물에 댓글을 남겼습니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">수락한 팔로우 요청</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonfollow_request_accepted1" name="follow_request_accepted" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonfollow_request_accepted3" name="follow_request_accepted" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											John Appleseed(@johnappleseed)님이 팔로우 요청을 수락했습니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">Instagram Direct 요청</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonpending_direct_share1" name="pending_direct_share" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonpending_direct_share3" name="pending_direct_share" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님이 메시지를 보내고 싶어합니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">Instagram Direct</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtondirect_share_activity1" name="direct_share_activity" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtondirect_share_activity3" name="direct_share_activity" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님이 메시지를 보냈습니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">알림</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonnotification_reminders1" name="notification_reminders" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonnotification_reminders3" name="notification_reminders" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											"알림을 읽지 않으셨습니다" 등을 안내하는 알림입니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">첫 게시물과 스토리</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonfirst_post1" name="first_post" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonfirst_post2" name="first_post" type="radio" value="2">
												내가 팔로우하는 사람
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonfirst_post3" name="first_post" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님의 첫 Instagram 스토리 게시 등을 안내하는 알림입니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">동영상 조회수</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonview_count1" name="view_count" type="radio" value="1">
											해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonview_count3" name="view_count" type="radio" value="3" checked="">
												모든 사람
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											회원님의 동영상 조회수가 10만회를 넘었습니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">지원 요청</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonreport_updated1" name="report_updated" type="radio" value="1">
												해제
											</div>
										</label>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonreport_updated3" name="report_updated" type="radio" value="3" checked="">
												설정
											</div>
										</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											7월 10에 요청하신 지원에 대한 내용이 업데이트되었습니다.
										</div>
									</div>
								</div>
							</section>
							<section class="setting-object">
								<div class="setting-name-space">
									<h2 class="setting-name">라이브 방송</h2>
								</div>
								<div class="">
									<fieldset>
										<label class="setting-label">
											<div class="setting-div">
												<input class="setting-input" id="igCoreRadioButtonlive_broadcast1" name="live_broadcast" type="radio" value="1">
												해제
											</div>
										</label>
									<label class="setting-label">
										<div class="setting-div">
											<input class="setting-input" id="igCoreRadioButtonlive_broadcast3" name="live_broadcast" type="radio" value="3" checked="">
											설정
										</div>
									</label>
									</fieldset>
									<div class="setting-explain">
										<div class="explain-text">
											johnappleseed님이 라이브 방송을 시작했습니다. 지금 바로 시청해보세요!
										</div>
									</div>
								</div>
							</section>
						</div>
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