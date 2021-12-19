<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${gbn == 'follow'}">
	<div class="followText">
		추천
	</div>
</c:if>

<c:forEach items="${searchUserList}" var="list">
	<div class="searchResult" data-usernum="${list.userNum}">
		<div class="suImg">
			<img alt="유저이미지" src="${pageContext.request.contextPath}/static/upload/user/${list.fileName}">
		</div>
		<div class="suInfo">
			<div class="suId">${list.username}</div>
			<div class="suNick">${list.nickname}</div>
		</div>
	</div>
</c:forEach>

