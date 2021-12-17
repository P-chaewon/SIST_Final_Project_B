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
							<a class="edit-list not-selected" href="/gram/account/password/change/" tabindex="0">비밀번호 변경</a>
						</li>
						<li>
							<a class="edit-list selected" href="/gram/account/activity/" tabindex="0">로그인 활동</a>
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
								</div>
							</div>
						</div>
					</ul>
					<article class="edit-object">
						<div class="activity-space">
							<div class="activity-name-space">
								<h2 class="activity-name">로그인 활동</h2>
							</div>
							<table class="activity-table">
								<tr>
									<th>사용자 이름</th>
									<th>로그인 날짜</th>
									<th>접속 ip</th>
									<th>접속 상태</th>
								</tr>
								<c:forEach items="${userlog}" var="log">
									<tr>
										<td>${userVO.username}</td>
										<td>${log.loginDate}</td>
										<td>${log.loginIp }</td>
										<td>
											<c:choose>
												<c:when test="${log.loginCheck}">
													로그인
												</c:when>
												<c:otherwise>
													로그아웃
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</table>
							<span style="font-size: 13px;">최대 5개까지의 로그인 활동 기록이 표시됩니다.</span>
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
			
		})
	</script>
</body>
</html>