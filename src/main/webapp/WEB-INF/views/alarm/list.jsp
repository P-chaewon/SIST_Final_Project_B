<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${alarmVOs}" var="alarmVO">
	<div class="c">
		<!-- 좋아요 알림 -->
		<c:if test="${alarmVO.fromUserNum eq 1}">
			<img class="profile" alt="프로필 사진" />
			<span class="text">${alarmVO.userVO.nickname}님이 회원님의 게시물을 좋아합니다.</span>
			<c:choose>
				<c:when test="${alarmVO.diff eq 0}">
					<span class="text day">오늘</span>
				</c:when>
				<c:otherwise><span class="text day">${alarmVO.diff}일</span></c:otherwise>
			</c:choose>
		</c:if>
		
		<!-- 댓글 알림 -->
		<c:if test="${alarmVO.fromUserNum eq 2}">
			<img class="profile" alt="프로필 사진" />
			<span class="text">${alarmVO.userVO.nickname}님이 댓글을 남겼습니다.</span>
			<c:choose>
				<c:when test="${alarmVO.diff eq 0}">
					<span class="text day">오늘</span>
				</c:when>
				<c:otherwise><span class="text day">${alarmVO.diff}일</span></c:otherwise>
			</c:choose>
		</c:if>
		
		<!-- 팔로우 알림 -->
		<c:if test="${alarmVO.fromUserNum eq 3}">
			<img class="profile" alt="프로필 사진" />
			<span class="text">${alarmVO.userVO.nickname}님이 회원님을 팔로우하기 시작했습니다.</span>
			<c:choose>
				<c:when test="${alarmVO.diff eq 0}">
					<span class="text day">오늘</span>
				</c:when>
				<c:otherwise><span class="text day">${alarmVO.diff}일</span></c:otherwise>
			</c:choose>
		</c:if>
	</div>
</c:forEach>