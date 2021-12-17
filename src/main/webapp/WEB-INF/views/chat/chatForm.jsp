<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gram | chatting</title>

<c:import url="../temp/head.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"> </script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/chat.css">
</head>





<body>





<div class="chat-wrap">
	<div class="chat-container">
	
		<c:import url="../temp/nav.jsp"></c:import>
		
		<div class="chat-area">
			<!-- chat-box -->
			<div class="chat-box">
				<!-- chat-left-area (왼) start -->
				<div class="chat-left-area">
					<!-- 채팅 좌측 상단 부분 -->
					<div class="chat-user-box">
						<div></div>
						<!-- 아이디 -->
						<div class="chat-id-area">
							${userVO.username}
						</div>
						<!-- 작성아이콘 -->
						<div class="chat-write-area">
							<button class="newChatBtn">
								<img alt="new message" src="${pageContext.request.contextPath}/static/icons/write.png">
							</button>
						</div>
					</div>
					<!-- 채팅 좌측 상단 부분 끝 -->
					<!-- 채팅 좌측 하단(채팅유저리스트) -->
					<div id="chatUserList" class="chat-user-list-area">
						
						
					</div>
					<!-- 채팅 좌측 하단 끝 -->
				</div>
				<!-- //chat-left-area end -->
			
				<!-- content -->
				<div class="chat-right-area">
					<!-- 채팅 우측 상단 -->
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
					
					<div class="chat-contents-wrap">
						<div id="chatContentsArea" class="chat-contents-area">
							
							
						</div>
					</div>
					</div>
					<!-- chat-contents-wrap end -->
					
					<div class="message-input-area">
						<div class="message-input-box">
							
							<!-- textarea 영역 -->
							<div class="message-text-box">
								<textarea id="chatMessage" class="message-input-text" placeholder="메시지 입력..."></textarea>
							</div>
							<!-- textarea 영역 끝 -->
							
							<div class="message-input-right-box">
								<button id="chatSend" class="message-submit-btn">보내기</button>
							</div>
						</div>
					</div>
					
				
					
				</div> <!-- //chat-right-area end -->
			
			
			</div>
			<!-- //chat-box end -->
		</div>
		
	</div>
</div>


<!-- --------------------------- modal --------------------------- -->

<c:import url="./newChatModal.jsp"></c:import>
<!-- --------------------------- modal end --------------------------- -->

<script type="text/javascript">
	$("#dm").attr("src", "${pageContext.request.contextPath}/static/icons/dm-click.png");

	let userNum = '${userVO.userNum}';
	let receiverNum = '${receiverNum}';
	let roomNum = '${roomNum}';
</script>

<script src="${pageContext.request.contextPath}/static/js/chat/chatForm.js"></script>

</body>



</html>