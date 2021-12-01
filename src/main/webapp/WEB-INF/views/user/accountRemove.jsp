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
							<a class="edit-list not-selected" href="/gram/account/edit/" tabindex="0">프로필 편집</a>
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
							<a class="edit-list selected" href="/gram/account/remove/permanent/" tabindex="0">회원 탈퇴</a>
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
						<div class="delete-space">
							<h1 class="delete-name">계정 삭제</h1>
							<p class="delete-txt-header">
								<span class="delete-username"><sec:authentication property="principal.username" var="username"/>${username }</span>
								님, 안녕하세요.
							</p>
							<br>
							<p class="delete-txt-footer">
							잠시 Instagram 활동을 쉬고 싶으시다면 계정을 삭제하는 대신 <a href="/gram/account/remove/temporary/">일시적으로 비활성화</a>할 수 있습니다. Instagram 활동을 쉬는 동안에는 회원님의 프로필이 Instagram에 표시되지 않습니다.
							</p>
							<form class="delete-form" method="post" action="./">
								<div class="delete-reason-select">
									<div class="edit-data">
										<aside class="delete-aside">
											<label for="deletion-reason">계정을 삭제하려는 이유가 <br> 무엇인가요?</label>
										</aside>
										<div class="input-change">
											<div class="delete-select-div">
												<span class="reason-down-arrow"></span>
												<select id="deletion-reason" class="deletion-reason-select">
													<option value="---">선택</option>
													<option value="hard-to-use">시작할 때 문제가 있음</option>
													<option value="ads">광고가 너무 많음</option>
													<option value="unwanted-content">삭제하고 싶은 내용이 있음</option>
													<option value="privacy-concerns">개인정보 보호 문제</option>
													<option value="second-account">2차 계정을 만들었습니다</option>
													<option value="too-busy">너무 내용이 많고 산만함</option>
													<option value="cant-find-friends">팔로우할 사람을 찾을 수 없음</option>
													<option value="other">기타</option>
												</select>
											</div>
										</div>
									</div>
									<div class="reason hard-to-use">
										<p>계정을 영구적으로 삭제하기 전에 고객 센터에 있는 다음 도움말의 내용을 따라 해보세요.</p>
										<div>
											<ul>
												<li>
													<a class="help-link" href="https://help.instagram.com/182492381886913/">시작 관련 팁</a>
												</li>
											</ul>
										</div>
									</div>
									<div class="reason ads">
										<p>Instagram 내 광고에 대한 추가 정보:</p>
										<ul>
											<li>회원님의 사진과 동영상은 회원님만의 소유이며 광고는 여기에 관여할 수 없습니다.</li>
											<li>
												Instagram은 언제나 회원님의 관심사를 바탕으로 관련성 높은 비즈니스 광고를 보여드리기 위해 최선을 다하고 있습니다. 
												<a class="help-link" href="https://help.instagram.com/1415228085373580">
													Instagram에서 회원님에게 표시할 광고를 결정합니다. 
												</a> 
												운영 원리에 대해 자세히 알아보세요.
											</li>
										</ul>
									</div>
									<div class="reason unwanted-content">
										<p>계정을 영구적으로 삭제하기 전에 고객 센터에 있는 다음 도움말의 내용을 따라 해보세요.</p>
										<ul>
											<li>
												<a class="help-link" href="https://help.instagram.com/289098941190483">내가 남긴 댓글을 삭제하고 싶습니다</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/286340048138725">팔로우를 취소하고 싶습니다.</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/426700567389543">
													다른 사용자가 나를 팔로우하지 않았으면 좋겠습니다.
												</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/289302621183285">내가 업로드한 사진을 삭제하고 싶습니다</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/583107688369069">사용자 이름이나 계정 정보를 바꾸고 싶습니다.</a>
											</li>
										</ul>
									</div>
									<div class="reason privacy-concerns">
										<p>계정을 영구적으로 삭제하기 전에 고객 센터에 있는 다음 도움말의 내용을 따라 해보세요.</p>
										<ul>
											<li>
												<a class="help-link" href="https://help.instagram.com/426700567389543">사용자를 차단하고 싶습니다</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/448523408565555">비공개 계정이 필요합니다.</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/286340048138725">팔로우를 취소하고 싶습니다.</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/368191326593075">내 계정이 해킹되었습니다</a>
											</li>
										</ul>
									</div>
									<div class="reason second-account">
										<p>
											기본 계정이 삭제되는 것을 막기 위해 보조 계정으로 로그인했는지 확인해주세요. 현재 <span class="reason-username">${username }</span>(으)로 로그인한 상태입니다.
											이 계정이 아닌 경우에는 <a class="logout-url" href="/gram/account/logout/">먼저 로그아웃</a>한 뒤 올바른 계정으로 로그인하세요.
										</p>
									<br>
									</div>
									<div class="reason too-busy">
										<p>Instagram을 사용하기 어려우시다면 다음 단계에 따라 휴대폰에서 앱을 삭제할 수 있습니다:</p>
										<ol>
											<li>Instagram 앱을 찾습니다.</li>
											<li>앱 아이콘을 길게 누릅니다.</li>
											<li>화면이 "떨리기" 시작하다가 앱 아이콘에 "X" 모양이 표시됩니다.</li>
											<li>"X" 모양을 누르고 계속 진행할지 물으면 "삭제"를 선택합니다.</li>
										</ol>
										<p>정말 아쉽지만 Instagram을 잠시 떠나 바라시던 휴식을 누리시길 바랍니다. 회원님의 모든 사진 및 프로필 정보는 계속 저장되지만 더 이상 알림을 받지 않게 됩니다. 나중에 다시 Instagram을 설치하려는 경우 기존 계정을 다시 사용할 수 있습니다.</p>
										<br>
									</div>
									<div class="reason cant-find-friends">
										<p>계정을 영구적으로 삭제하기 전에 고객 센터에 있는 다음 도움말의 내용을 따라 해보세요.</p>
										<ul>
											<li>
												<a class="help-link" href="https://help.instagram.com/169948159813228">소셜 네트워크에 링크</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/466210366861501">해시태그 사용 방법</a>
											</li>
											<li>
												<a class="help-link" href="https://help.instagram.com/533052966709644">팔로우할 유명한 계정 찾기</a>
											</li>
										</ul>
									</div>
									<div class="edit-data">
										<aside class="delete-pw">
											<label for="password">계속하려면 비밀번호를 다시 입력하세요</label>
										</aside>
										<div class="input-change">
											<div>
												<input type="hidden" name="username" id="delUsername" value="${username }">
												<input class="delete-pw-input" id="password" name="password" required="" spellcheck="true" type="password">
												<a class="pw-forget-txt" href="/accounts/password/reset/" tabindex="0">비밀번호를 잊으셨나요?</a>
											</div>
										</div>
									</div>
								</div>
								<div class="delete-line">
								</div>
								<p class="delete-btn-txt">아래 버튼을 누르면 계정의 모든 사진, 댓글, 좋아요가 삭제됩니다.</p>
								<div class="delete-btn-space">
									<button class="blue-btn-small delete-btn" disabled="disabled" type="button">계정 삭제</button>
								</div>
							</form>
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
	<script type="text/javascript">
		$(function () {			
			let val = $(".deletion-reason-select").val();
			$(".reason").not('.'+val).hide();
			
			$(".deletion-reason-select").change(function () {
				$(".reason").hide();
				$('.'+$(this).val()).show();
				
				console.log($(".deletion-reason-select").val()!="---");
				if($(".deletion-reason-select").val()!="---"){
					$(".delete-btn").removeAttr("disabled");
				} else {
					$(".delete-btn").attr("disabled", "disabled");
				}
			})
			
			let msg = "${result}";
			if(msg!=""){
				alertMsg(msg);
			} 
		})
	</script>
</body>
</html>