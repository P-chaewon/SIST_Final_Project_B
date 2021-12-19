<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- --------------------------- modal --------------------------- -->

<div class="modal">
	<div class="modal-area">
		<div class="modal-header">
			<div class="modal-close-area">
				<button class="modalCloseBtn">
					<img alt="modal close" src="${pageContext.request.contextPath}/static/icons/stroke-close.png">
				</button>
			</div>
			<div class="newMessageLetter">
				<p> 새로운 메시지 </p>
			</div>
		</div>
		
		<div class="modal-content">
		
			<div class="modalSearchArea">
				<div class="searchBox">
					<div class="receiverLetter">
						<p>받는 사람:</p>
					</div>
					<div class="searchUserName">
						<input id="searchText" autocomplete="off" type="text" placeholder="검색...">
					</div>
				</div>
			</div>
			
			<!-- 검색결과 -->
			<div id="modalSearchResultArea" class="modalSearchResultArea">

			</div>
		</div>
	</div>
</div>
<!-- --------------------------- modal end --------------------------- -->

