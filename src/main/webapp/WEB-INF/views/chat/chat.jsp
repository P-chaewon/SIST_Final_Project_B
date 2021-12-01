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
							<img alt="new message" src="${pageContext.request.contextPath}/static/icons/write.png">
						</div>
					</div>
					<!-- 채팅 좌측 상단 부분 끝 -->
					<!-- 채팅 좌측 하단(채팅유저리스트) -->
					<div class="chat-user-list-area">
						
						<div class="chat-user-list-box">
							<div class="user-list-img">
								<div class="img-back"></div>
							</div>
							
							<div class="user-list-nick">
								test02
							</div>
						</div>
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
							<button>메시지 보내기</button>
						</div>
					</div>
				
				
				
				
				
					<!-- 채팅 우측 상단 -->
					<!-- <div class="chat-other-user-box">
						<div class="chat-other-user-space">
							test01
						</div>
					</div>
					//chat-other-user-box end
					
					채팅 우측 하단 (채팅부분)
					<div class="chat-contents-wrap">
						<div class="chat-contents-area">
							<div class="contents-row">
								<dlv class="r-row">
									chat message test
								</dlv>
							</div>
							
						</div>
					</div>
					//chat-contents-wrap end
					
					<div class="message-input-area">
						<div class="message-input-box">
							
							textarea 영역
							<div class="message-text-box">
								<textarea id="chatMessage" class="message-input-text" placeholder="메시지 입력..."></textarea>
							</div>
							//textarea 영역 끝
							
							<div class="message-input-right-box">
								<button id="chatSend" class="message-submit-btn">보내기</button>
							</div>
						</div>
					</div> -->
					
					
				</div> <!-- //chat-right-area end -->
			
			
			</div>
			<!-- //chat-box end -->
		</div>
		
	</div>
</div>


	<!--   
<div id="main-content" class="container">
  <div class="row">
    <div class="col-md-6">
      <form class="form-inline">
        <div class="form-group">
          <label for="connect">WebSocket connection:</label>
          <button id="connect" class="btn btn-default" type="submit">Connect</button>
          <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">Disconnect
          </button>
        </div>
      </form>
    </div>
    <div class="col-md-6">
      <form class="form-inline">
        <div class="form-group">
          <label for="name">What is your name?</label>
          <input type="text" id="name" class="form-control" placeholder="Your name here...">
        </div>
        <!-- <button id="send" class="btn btn-default" type="submit">Send</button> -->
      <!--   <div class="form-group">	
        	<label for="message">Input Message</label>
			<input type="text" id="chatMessage" class="form-control" placeholder="message.." />
			</div>
		<button id="chatSend" class="btn btn-default" type="button">Chat Send</button>
      </form>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <table id="conversation" class="table table-striped">
        <thead>
        <tr>
          <th>Greetings</th>
        </tr>
        </thead>
        <tbody id="greetings">
        </tbody>
      </table>
    </div>
  </div>
</div>
 -->

<script src="${pageContext.request.contextPath}/static/js/chat.js"></script>

</body>



</html>