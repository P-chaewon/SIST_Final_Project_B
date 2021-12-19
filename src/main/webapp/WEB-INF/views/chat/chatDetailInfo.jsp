<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="chat-other-user-box2">
	<div class="chat-other-user-space">
		<div class="receiver-area">
			<p class="receiverIdText">상세 정보</p>
			<button id="detailInfoClickedBtn" class="detail-info-area">
				<img src="${pageContext.request.contextPath}/static/icons/info-click.png">
			</button>
		</div>
	</div>
</div>
<!-- chat-other-user-box end -->
	
<!-- 채팅 우측 하단 (채팅부분) -->
<div class="info-container">
	<div class="info-member-con">
		<div class="info-member-area"> 
			<div class="infoText"><p>멤버</p></div> 
			<div id="goProfile" class="user-link-area">
				<div class="user-img">
					<img src="${pageContext.request.contextPath}/static/upload/user/${receiverUserVO.fileName}">
				</div>
				<div class="user-list-nick">
					<p class="user-id">${receiverUserVO.username}</p>
					<p class="user-nick">${receiverUserVO.nickname}</p>
				</div>
			</div>
		</div>
		
	</div>
	<div class="info-menu-con">
		<div class="info-btn-area">
			<button class="chatRemoveModalBtn"> 채팅 삭제 </button>
		</div>
	</div>
</div>



<!-- 채팅 삭제 모달 -->
<div class="remove-modal">
	<div class="modal-area">
		<div class="modal-header">
			<div>
				<div class="mh1"> 채팅을 삭제하시겠어요? </div>
				<div class="mh2"> 삭제하면 회원님의 받은 메시지함에서 채팅이 삭제됩니다. <br>다른 사람의 받은 메시지함에는 계속 표시됩니다. </div>
			</div>
		</div>
		
		<div class="modal-content">
			<div class="modal-remove-area">
				<button id="chatRemoveBtn" class="chat-remove-btn">삭제</button>
			</div>
			<div class="modal-cancel-area">
				<button id="chatRemoveCancelBtn">취소</button>
			</div>
			
		</div>
	</div>
</div>


<script type="text/javascript">
	$("#detailInfoClickedBtn").click(function() {
		goChatRoom(roomNum, '${receiverUserVO.userNum}', '${receiverUserVO.username}');
	});
	
	$("#goProfile").click(function() {
		location.href="/gram/${receiverUserVO.username}";
	})
</script>