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
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user.css">
</head>
<body>
	<sec:authentication property="principal" var="userVO"/>
	<div id="react-root">
		<div style="width: 100%; height: 100%;">
			<section class="pw-recovery-sercion">
				<div></div>
				<main class="pw-recovery-main" role="main">
					<div class="pw_recov">
						<div class="pw_recov_nav">
							<div class="pw_nav_logo">
								<a href="/gram" tabindex="0">
									<div class="pw_reset_logo_area">
										<div class="reset_logo">
											<c:choose>
												<c:when test="${not empty userVO.fileName }">
													<img alt="Instagram" class="page_logo" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">
												</c:when>
												<c:otherwise>
													<img alt="Instagram" class="page_logo" src="${pageContext.request.contextPath}/static/icons/instagram_logo.png">
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="pw-recovery">
						<div class="recovery">
							<div class="recov-user-info">
								<div class="recov_user_img">
									<span role="link" tabindex="-1" style="width: 74px; height: 74px;">
										<img alt="" class="recov_user_img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/icons/user.jpg">
									</span>
								</div>
								<div class="recov_username">
									<h4 class="">${userVO.username }</h4>
								</div>
								<form class="pw_change_form" method="POST">
									<div class="recover-error-msg">
										
									</div>
									<input type="hidden" name="username" id="recover-username" value="${userVO.username }">
									<div class="new_pw">
										<div class="entry-text">
											<label class="pw_recov_label">
												<span class="label-name">새 비밀번호</span>
												<input aria-label="새 비밀번호" type="password" id="recover-pw" class="user-input aInput recov-input">
											</label>
										</div>
									</div>
									<div class="new_pw_check">
										<div class="entry-text">
											<label class="pw_recov_label">
												<span class="label-name">새 비밀번호 확인</span>
												<input aria-label="새 비밀번호 확인" type="password" id="recover-pw-check" class="user-input aInput recov-input">
											</label>
										</div>
									</div>
									<button class="recov_btn" disabled="disabled" type="button">비밀번호 변경</button>
								</form>
							</div>
						</div>
					</div>
				</main>
			</section>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profileEdit.js"></script>
</body>
</html>