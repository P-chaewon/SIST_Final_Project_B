<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list}" var="list">
	<div class="chat-user-list-box" data-chat-roomNum="${list.roomNum}">
		<div class="user-list-img">
			<div class="img-back"></div>
		</div>
		
		<div class="user-list-nick">
			<p>${list.userVO.username}</p>
			<p>***</p>
		</div>
	</div>
	<!-- ${list.userNum}
	${list.exitDate}  -->
</c:forEach>