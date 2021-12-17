<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="chat-other-user-box">
	<div class="chat-other-user-space">
		<div class="receiver-area">
			<img class="receiverUserImg" src="${pageContext.request.contextPath}/static/upload/user/${receiverUserVO.fileName}">
			<p class="receiverIdText">${receiverUserVO.username}님</p>
			<button id="detailInfoBtn" class="detail-info-area">
				<img src="${pageContext.request.contextPath}/static/icons/info.png">
			</button>
		</div>
	</div>
</div>
<!-- chat-other-user-box end -->
	
<!-- 채팅 우측 하단 (채팅부분) -->
<div class="chat-container">

</div>

