<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 채팅 우측 상단 -->
<div class="chat-other-user-box">
	<div class="chat-other-user-space">
		test01
	</div>
</div>
<!--  chat-other-user-box end-->

<!-- 채팅 우측 하단 (채팅부분) -->
<div class="chat-contents-wrap">
	<div class="chat-contents-area">
		<div class="contents-row">
			<dlv class="r-row">
				chat message test
			</dlv>
		</div>
		
	</div>
</div>
<!-- chat-contents-wrap end -->

<div class="message-input-area">
	<div class="message-input-box">
		
		<!--  textarea 영역-->
		<div class="message-text-box">
			<textarea id="chatMessage" class="message-input-text" placeholder="메시지 입력..."></textarea>
		</div>
		<!--  textarea 영역 끝-->
		
		<div class="message-input-right-box">
			<button id="chatSend" class="message-submit-btn">보내기</button>
		</div>
	</div>
</div> 