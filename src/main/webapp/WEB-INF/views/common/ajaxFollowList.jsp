<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="follow-list-ul">
	<c:forEach items="${follows}" var="userVO">
		<c:forEach items="${followNums }" var="followNum">
			<div class="follow-userlist">
				<li class="follow-list-li">
					<div class="follow-one-user">
						<div class="follow-one-user-info">
							<div class="follow-user-img-space">
								<div class="follow-user-img-background" aria-disabled="true" role="button" tabindex="-1">
									<canvas class="follow-user-img-canvas" height="40" width="40" style="position: absolute; top: -5px; left: -5px; width: 40px; height: 40px;"></canvas>
									<a class="follow-user-img-link" href="/${userVO.username}" tabindex="0" style="width: 30px; height: 30px; display: block;">
										<c:choose>
											<c:when test="${not empty userVO.fileName}">
												<img alt="${userVO.username}님의 프로필 사진" class="follow-user-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">
											</c:when>
											<c:otherwise>
												<img alt="${userVO.username}님의 프로필 사진" class="follow-user-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/icons/user.jpg">
											</c:otherwise>
										</c:choose>
									</a>
								</div>
							</div>
							<div class="follow-user-name-space">
								<div class="follow-username-space">
									<span class="follow-username">
										<a class="follow-username-link" title="${userVO.username}" href="/${userVO.username}" tabindex="0">${userVO.username }</a>
									</span> 
								</div>
								<div class="follow-nickname ">${userVO.nickname }</div>
							</div>
						</div>
						<div class="follow-btn-space">
							<c:choose>
								<c:when test="${userVO.userNum eq followNum }">
									<button class="following-modal-btn" type="button">팔로잉</button>							
								</c:when>
								<c:otherwise>
									<button class="follow-modal-btn" type="button" >팔로우</button>
								</c:otherwise>
											
							</c:choose>
						</div>
					</div>
				</li>
			</div>
		</c:forEach>
	</c:forEach>
</ul>
