<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list}" var="list">
	<div class="chat-user-list-box" data-roomNum="${list.roomNum}" data-userNum="${list.userNum}">
<!-- 	<div class="user-list-img">
			<div class="img-back"></div>
		</div> -->
		<div class="user-img">
			<img src="${pageContext.request.contextPath}/static/upload/user/${list.userVO.fileName}">
		</div>
		
		<div class="user-list-nick">
			<p class="user-id">${list.userVO.username}</p>
			<p>***</p>
		</div>
	</div>
	<!-- ${list.userNum}
	${list.exitDate}  -->
</c:forEach>