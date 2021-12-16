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
				
					<div class="chat-basic-box">
						<div class="dm-img-box">
							<img alt="new message" src="${pageContext.request.contextPath}/static/icons/dm.png">
						</div>	
						<div class="dm-text1">
							내 메시지
						</div>
						<div class="dm-text2">
							친구에게 메시지를 보내보세요.
						</div>
						<div class="dm-button-box">
							<button class="newChatBtn">메시지 보내기</button>
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
</script>
<script src="${pageContext.request.contextPath}/static/js/chat/chat.js"></script>

</body>



</html>