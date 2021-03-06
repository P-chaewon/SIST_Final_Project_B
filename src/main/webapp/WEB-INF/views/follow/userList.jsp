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
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/follow.css">
</head>
<body class="" style="">
	<c:import url="../temp/nav2.jsp"></c:import>
	<div id="react-root">
		<section class="list-section">
		<div></div>
			<main class="list-main" role="main">
				<div class="recommend-space">
					<div class="retxt-space">
						<h4 class="recommend-txt">추천</h4>
					</div>
					<div class="recommend-follow">
						<div style="height: auto; overflow: hidden auto;">
							<div style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
								<sec:authentication property="principal.userNum" var="userNum"/>
								<c:forEach items="${users}" var="userVO">
									<div aria-labelledby="f1434f5afa35c5c f2a78f1ec3fe4d f23da1b2925d2c8 f203f41533b5e9c" class="popular-follow">
										<div class="user-img-space">
											<div class="user-img-div">
												<div class="user-img-btn" aria-disabled="true" role="button" tabindex="-1">
													<canvas class="user-img-canvas" height="54" width="54" style="position: absolute; top: -5px; left: -5px; width: 54px; height: 54px;"></canvas>
													<a class="user-img-link" href="/dlwlrma/" tabindex="0" style="width: 44px; height: 44px; display: block;">
														<img alt="dlwlrma님의 프로필 사진" class="user-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">						
													</a>
												</div>
											</div>
										</div>
										<div class="user-info-space">
											<div class="username-space" id="f2a78f1ec3fe4d">
												<div class="follow-username">
													<span class="username-txt">
														<a class="username-link" title="${userVO.username }" href="/gram/${userVO.username}" tabindex="0">${userVO.username }</a>
													</span>
												</div>
											</div>
											<div class="nickname-space" id="f23da1b2925d2c8">
												<div class="nickname-txt" >${userVO.nickname}</div>
											</div>
										</div>
										<div class="follow-btn-space" id="f1434f5afa35c5c">
											<button class="follow-btn" type="button" data-user-num="${userNum}" data-follow-num="${userVO.userNum}">팔로우</button>
											<button class="unfollow-btn" type="button" data-user-num="${userNum}" data-follow-num="${userVO.userNum}" style="display: none;">팔로잉</button>
										</div>
									</div>
								</c:forEach>
								<c:if test="${empty recommend}">
									<div class="start-btn-space" style="display: none;">
										<button class="start-btn" type="button">시작하기</button>
									</div>								
								</c:if>
							</div>
						</div>
					</div>
					<div class="S-Ubq"></div>
				</div>
				<iframe class="DiscoverPeoplePage/iframe" height="0" title="팔로우할 만한 계정 둘러보기" width="0"></iframe>
			</main>
			<c:import url="../temp/footer.jsp"></c:import>
			<div id="fb-root" class="fb_reset">
				<div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
					<div></div>
				</div>
			</div>
		</section>
	</div>
	<div class="_-rjm">
		<div class="tA2fc"></div>
	</div>
	<div class="_5qKD1">
		<div class="q5edG"></div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/follow.js"></script>
</body>
</html>