<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${alarmVOs}" var="alarmVO">
	<div class="nav_c">
		<!-- 좋아요 알림 -->
		<c:if test="${alarmVO.alarmType eq 1}">
			<!-- 프로필 사진 -->
			<c:choose>
				<c:when test="${empty alarmVO.userVO.fileName}">
					<img class="profile" alt="프로필 사진" src="${pageContext.request.contextPath}/static/icons/user.jpg" />
				</c:when>
				<c:otherwise>
					<img class="profile" alt="프로필 사진" src="${pageContext.request.contextPath}/static/upload/user/${alarmVO.userVO.fileName}" />
				</c:otherwise>
			</c:choose>
			<span class="text">
				<a href="/gram/${alarmVO.userVO.username}?alarmNum=${alarmVO.alarmNum}">${alarmVO.userVO.username}님이 회원님의 게시물을 좋아합니다.</a>
			</span>
			<c:choose>
				<c:when test="${alarmVO.diff eq 0}">
					<span class="text day">오늘</span>
				</c:when>
				<c:otherwise><span class="text day">${alarmVO.diff}일</span></c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${alarmVO.readCheck eq false}">
					<div class="text blue_circle"></div>
				</c:when>
			</c:choose>
		</c:if>
		
		<!-- 댓글 알림 -->
		<c:if test="${alarmVO.alarmType eq 2}">
			<!-- 프로필 사진 -->
			<c:choose>
				<c:when test="${empty alarmVO.userVO.fileName}">
					<img class="profile" alt="프로필 사진" src="${pageContext.request.contextPath}/static/icons/user.jpg" />
				</c:when>
				<c:otherwise>
					<img class="profile" alt="프로필 사진" src="${pageContext.request.contextPath}/static/upload/user/${alarmVO.userVO.fileName}" />
				</c:otherwise>
			</c:choose>
			
			<span class="text">
				<a href="/gram/post/selectOne?postNum=${alarmVO.targetPostNum}&alarmNum=${alarmVO.alarmNum}">${alarmVO.userVO.username}님이 댓글을 남겼습니다.</a>
			</span>
			<c:choose>
				<c:when test="${alarmVO.diff eq 0}">
					<span class="text day">오늘</span>
				</c:when>
				<c:otherwise><span class="text day">${alarmVO.diff}일</span></c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${alarmVO.readCheck eq false}">
					<div class="text blue_circle"></div>
				</c:when>
			</c:choose>
		</c:if>
		
		<!-- 팔로우 알림 -->
		<c:if test="${alarmVO.alarmType eq 3}">
		<!-- 프로필 사진 -->
			<c:choose>
				<c:when test="${empty alarmVO.userVO.fileName}">
					<img class="profile" alt="프로필 사진" src="${pageContext.request.contextPath}/static/icons/user.jpg" />
				</c:when>
				<c:otherwise>
					<img class="profile" alt="프로필 사진" src="${pageContext.request.contextPath}/static/upload/user/${alarmVO.userVO.fileName}" />
				</c:otherwise>
			</c:choose>
			<span class="text">
				<a href="/gram/${alarmVO.userVO.username}?alarmNum=${alarmVO.alarmNum}">${alarmVO.userVO.username}님이 회원님을 팔로우하기 시작했습니다.</a>
			</span>
			<c:choose>
				<c:when test="${alarmVO.diff eq 0}">
					<span class="text day">오늘</span>
				</c:when>
				<c:otherwise><span class="text day">${alarmVO.diff}일</span></c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${alarmVO.readCheck eq false}">
					<div class="text blue_circle"></div>
				</c:when>
			</c:choose>
		</c:if>
	</div>
</c:forEach>