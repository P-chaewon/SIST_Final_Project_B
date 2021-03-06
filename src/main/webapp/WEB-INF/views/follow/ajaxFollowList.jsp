<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.userNum" var="userNum"/>
<sec:authentication property="principal.username" var="username"/>
<c:choose>
	<c:when test="${empty follows}">
		<c:choose>
			<c:when test="${type eq 'following'}">
				<div style="padding: 40px 0;">
					<img src="${pageContext.request.contextPath}/static/icons/follow_add.png" width="96px;" height="96px;" style="margin: 0 152px;">
					<p style="padding: 20px 0; font-size: 22px; line-height: 26px; text-align: center;">회원님이 팔로우하는 사람</p>
					<p style="font-size: 14px; line-height: 18px; text-align: center;">회원님이 팔로우하는 사람들이 여기에 표시됩니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div style="padding: 40px 0;">
					<img src="${pageContext.request.contextPath}/static/icons/follow_add.png" width="96px;" height="96px;" style="margin: 0 152px;">
					<p style="padding: 20px 0; font-size: 22px; line-height: 26px; text-align: center;">팔로워</p>
					<p style="font-size: 14px; line-height: 18px; text-align: center;">회원님을 팔로우하는 모든 사람이 여기에 표시됩니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<ul class="follow-list-ul">
			<c:forEach items="${follows}" var="userVO">
				<div class="follow-userlist">
					<li class="follow-list-li">
						<div class="follow-one-user">
							<div class="follow-one-user-info">
								<div class="follow-user-img-space">
									<div class="follow-user-img-background" aria-disabled="true" role="button" tabindex="-1">
										<canvas class="follow-user-img-canvas" height="40" width="40" style="position: absolute; top: -5px; left: -5px; width: 40px; height: 40px;"></canvas>
										<a class="follow-user-img-link" href="/gram/${userVO.username}" tabindex="0" style="width: 30px; height: 30px; display: block;">
											<img alt="${userVO.username}님의 프로필 사진" class="follow-user-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">
										</a>
									</div>
								</div>
								<div class="follow-user-name-space">
									<div class="follow-username-space">
										<span class="follow-username">
											<a class="follow-username-link" title="${userVO.username}" href="/gram/${userVO.username}" tabindex="0">${userVO.username }</a>
										</span> 
									</div>
									<div class="follow-nickname ">${userVO.nickname }</div>
								</div>
							</div>
							<c:if test="${username ne userVO.username}">
								<div class="follow-btn-space">
									<c:choose>
										<c:when test="${userVO.following}">
											<button class="following-modal-btn-css following-modal-btn" type="button" data-user-num="${userNum}" data-follow-num="${userVO.userNum}">팔로잉</button>
											<button class="follow-modal-btn-css follow-modal-btn" type="button" data-user-num="${userNum}" data-follow-num="${userVO.userNum}" style="display: none;">팔로우</button>						
										</c:when>
										<c:otherwise>
											<button class="following-modal-btn-css following-modal-btn" type="button" data-user-num="${userNum}" data-follow-num="${userVO.userNum}" style="display: none;">팔로잉</button>
											<button class="follow-modal-btn-css follow-modal-btn" type="button" data-user-num="${userNum}" data-follow-num="${userVO.userNum}">팔로우</button>
										</c:otherwise>									
									</c:choose>
								</div>
							</c:if>
						</div>
					</li>
				</div>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/follow.js"></script>
<script>

	$(".following-modal-btn").on("click", function () {
		let followNum=$(this).attr("data-follow-num");
		let userNum=$(this).attr("data-user-num");
		console.log(userNum);
		if(follow(false, followNum, userNum)==0){
			$(this).hide();
			$(this).siblings(".follow-modal-btn").show();
		} 
	})
	
	$(".follow-modal-btn").on("click", function () {
		let followNum=$(this).attr("data-follow-num");
		let userNum=$(this).attr("data-user-num");
		if(follow(true, followNum, userNum)==1){
			$(this).hide();
			$(this).siblings(".following-modal-btn").show();
		}
	})
</script>
