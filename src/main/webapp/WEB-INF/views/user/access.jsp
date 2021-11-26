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
							<a class="edit-list selected" href="/gram/account/manage_access/" tabindex="0">앱 및 웹사이트</a>
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
						<div>
							<div class="app-name-space">
								<h1 class="app-name">앱 및 웹사이트</h1>
							</div>
							<div class="app-content">
								<div class="tab-list" role="tablist">
									<a aria-current="page" class="tab-entity tab-select" role="tab" href="#here" data-link-num="1">
										<span class="">활성</span>
									</a>
									<a class="tab-entity" role="tab" href="#here" data-link-num="2">
										<span class="">만료됨</span>
									</a>
									<a class="tab-entity" role="tab" href="#here" data-link-num="3">
										<span class="">삭제됨</span>
									</a>
								</div>
								<div class="tab-pannel 1">
									<div class="tab-contents-space">
										<div class="tab-contents">
											Instagram을 사용하여 로그인하고 최근에 사용한 앱과 웹사이트로, 회원님이 공유하도록 선택한 정보를 요청할 수 있습니다.
										</div>
									</div>
									<div class="active-subtxt">
										Instagram 계정에 액세스하도록 허용한 앱이 없습니다.
									</div>
								</div>
								<div class="tab-pannel 2">
									<div class="tab-contents-space">
										<div class="tab-contents">
											회원님이 Instagram을 사용하여 로그인하고 한동안 사용하지 않은 앱과 웹사이트입니다. 이 앱과 웹사이트에서 아직 회원님이 이전에 공유한 정보를 가지고 있을 수도 있지만 비공개 정보를 추가로 요청할 수 있는 기능이 만료되었습니다. 앱에 회원님의 정보를 삭제할 것을 요청할 수 있습니다. 그렇게 하려면 앱 개인정보처리방침의 상세 정보와 연락처 정보를 검토하세요. 앱에 연락하는 경우 사용자 ID가 필요할 수도 있습니다.
										</div>
									</div>
									<div class="expire-subtxt">
										Instagram 계정에 대한 액세스 권한을 보유한 앱 중 만료된 앱이 없습니다.
									</div>
								</div>
								<div class="tab-pannel 3">
									<div class="tab-contents-space">
										<div class="tab-contents">
											회원님이 계정에서 삭제한 앱과 웹사이트입니다. 즉, 이 앱과 웹사이트에서 아직 회원님이 이전에 공유한 정보를 가지고 있을 수도 있지만 추가 요청을 할 수 없습니다. 앱에 회원님의 정보를 삭제할 것을 요청할 수 있습니다. 그렇게 하려면 앱 개인정보처리방침의 상세 정보와 연락처 정보를 검토하세요. 앱에 연락하는 경우 사용자 ID가 필요할 수도 있습니다.
										</div>
									</div>
									<div class="delete-subtxt">
										Instagram 계정에 대한 액세스 권한을 보유한 앱 중 삭제된 앱이 없습니다.
									</div>
								</div>
							</div>
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
			let attr = $(".tab-select").attr("data-link-num");
			console.log(attr);
			$(".tab-pannel").not('.'+attr).hide();

			$(".tab-entity").click(function () {
				$(this).siblings().removeClass("tab-select");
				$(this).addClass("tab-select");
				$(".tab-pannel").hide();
				$('.'+$(this).attr("data-link-num")).show();				
			})			
		})
		
	</script>
</body>
</html>