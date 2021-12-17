<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<ul class="follow-list-ul">
	<sec:authentication property="principal.userNum" var="userNum"/>
	<sec:authentication property="principal.username" var="username"/>
	
	<c:choose>
		<c:when test="${empty likeuser }">
		<p id="count_text" style="margin-top: 41px; margin-left: 107px;">가장 먼저 <span class="point-span" style="font-weight: bold;">좋아요</span>를 눌러보세요</p>
		
		</c:when>
		<c:otherwise>
		
		<c:forEach items="${likeuser}" var="like">
		<div class="like-userlist">
			<li class="like-list-li">
				<div class="like-one-user">
					<div class="like-one-user-info">
						<div class="like-user-img-space">
							<div class="like-user-img-background" aria-disabled="true" role="button" tabindex="-1">
								<canvas class="like-user-img-canvas" height="40" width="40" style="position: absolute; top: -5px; left: -5px; width: 40px; height: 40px;"></canvas>
								<a class="like-user-img-link" href="/gram/${like.userVO.username}" tabindex="0" style="width: 30px; height: 30px; display: block;">
									<img alt="${like.userVO.username}님의 프로필 사진" class="follow-user-img" style="width: 30px; height: 30pxl" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${like.userVO.fileName}">
								</a>
							</div>
						</div>
						<div class="like-user-name-space">
							<div class="like-username-space">
								<span class="like-username">
									<a class="like-username-link" title="${like.userVO.username}" href="/gram/${like.userVO.username}" tabindex="0">${like.userVO.username }</a>
								</span> 
							</div>
							<div class="like-nickname ">${like.userVO.nickname }</div>
						</div>
					</div>
					
				</div>
			</li>
		</div>
	</c:forEach>
		
		</c:otherwise>
	</c:choose>
	
</ul>
