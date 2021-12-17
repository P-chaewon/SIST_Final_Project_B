<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./temp/head.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/profile.css">
</head>
<body class="" style="">
	<sec:authentication property="principal.username" var="username"/>
	<c:import url="./temp/nav2.jsp"></c:import>
	<script type="text/javascript">
		$(".profile_border").css("border", "1px solid black");
	</script>
	<div id="react-root">
		<section class="profile-home-section">
			<div></div>
			<main class="profile-home-main" role="main">
				<div class="profile-homepage">
					<header class="profile-info-header">
						<div class="profile-img-space">
							<div class="profile-edit-space">
								<div class="profile-edit">
									<button class="icon-btn" title="프로필 사진 추가" data-user-fileName="${userVO.fileName }">
										<img alt="${userVO.username}님의 프로필 사진" class="input-icon" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">
									</button>
									<div>
										<form enctype="multipart/form-data" action="./edit/fileUpdate" method="POST" role="presentation" class="profile-form">
											<input accept="image/jpeg,image/png" class="profile-photo" type="file" name="file" id="file">
										</form>
									</div>
								</div>
							</div>
						</div>
						<section class="profile-info-space">
							<div class="profile-name-btn">
								<h2 class="profile-username">${userVO.username }</h2>
								<div class="profile-btn-space">
									<div class="profile-btns">
										<div class="edit-btn-space">
											<button class="edit-btn" type="button">
												<div class="edit-btn-txt">프로필 편집</div>
											</button>
										</div>
									</div>
								</div>
							</div>
							<ul class="info-ul">
								<li class="info-li">
									<span class="info-name">
										게시물 
										<span class="info-total">${postcount }</span>
									</span>
								</li>
								<li class="info-li">
									<span class="info-name follower" tabindex="0" data-user-name="${userVO.username }" style="cursor: pointer;">
										팔로워 
										<span class="info-total">
											${count.followerCount }
										</span>
									</span>
								</li>
								<li class="info-li">
									<span class="info-name following" tabindex="0" data-user-name="${userVO.username }" style="cursor: pointer;">
										팔로우 
										<span class="info-total">
											${count.followCount }
										</span>
									</span>
								</li>
							</ul>
							<div class="profile-etc-info">
								<h1 class="profile-nickname">${userVO.nickname}</h1>
								<br>
								<span style="white-space: pre-line;">
									${userVO.introduction}
								</span> 
							<a author_id="7964166036" class="profile-website" href="https://${userVO.website }" page_id="profilePage" rel="me nofollow noopener noreferrer" target="_blank">${userVO.website }</a>
							</div>
						</section>
					</header>
					<div class="profile-tablist" role="tablist">
						<a aria-selected="true" class="tab-entity tab-selected" id="post" role="tab" tabindex="0">
							<span class="tab-info">
								<img alt="" src="${pageContext.request.contextPath}/static/icons/grid.png" class="post-icon">
								<span class="tab-name">게시물</span>
							</span>
						</a>
						<a aria-selected="false" class="tab-entity" id="bookmark" role="tab" tabindex="0">
							<span class="tab-info">
								<img alt="" src="${pageContext.request.contextPath}/static/icons/bookmark.png" class="bookmark-icon">
								<span class="tab-name">저장됨</span>
							</span>
						</a>
					</div>
					
					<!-- 게시글 보여주는 곳 -->
					
				
					<div class="post-space" style="display: block;width: 935px;" id="view_post">
						<article class="post-article">
							<div>
								<div style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
									<div class="post-one-row">
									
					<c:choose>
						<c:when test="${empty postlist}">
							<div class="one-post">
										<div class="post-img-space">
											<div class="post-image-div">
												<img alt="" class="post-img" src="${pageContext.request.contextPath}/static/images/profileHome/no_post.jpg" style="object-fit: cover;">	
											</div>
										<div class="img-background"></div>
										</div>	
								</div>
											<div class="one-post">
												<div class="post-img-space" style="background-color: #fafafa;">
													<div style="text-align: center; margin-top: 52px;">
														<span style="font-weight: bold; font-size: 20px;">소중한 순간을 </span>
														<span style="font-weight: bold; font-size: 20px; margin-top: 3px;"> 포착하여 공유해보세요.</span>
													<span style="font-size: 15px; margin-top: 20px;">첫 게시물을 공유해보세요.</span>
													</div>
													<img alt="" style="width: 70px; height: 70px; margin-left: 111px; margin-top: 10px;" src="${pageContext.request.contextPath}/static/icons/instant-camera.png">
													<button class="blue-btn-small update-btn" onclick="location.href='./post/upload' "style="margin: 0 auto; margin-top: 10px;" type="button">게시물 공유</button>
												</div>
										</div>
							</c:when>
							<c:otherwise>									
									<c:forEach items="${postlist}" var="list">
										<div class="one-post">
										
											<a href="./post/selectOne?postNum=${list.postNum}" tabindex="0">
												<div class="post-img-space">
													<div class="post-image-div">
													<c:forEach items="${list.fileList }" var="fileVO" varStatus="status" begin="0" end="0">		
														<img alt="" class="post-img" crossorigin="anonymous" decoding="auto" src="${pageContext.request.contextPath}/static/upload/post/${fileVO.postfileName}" style="object-fit: cover;">
														</c:forEach>
													</div>
													<div class="img-background"></div>
												</div>
											</a>
										</div>
									</c:forEach>
							</c:otherwise>
							</c:choose>						
								</div>
							</div>
							</div>
						</article>
					</div>	
					
					<!-- bookmark -->
					
						<div class="post-space" id="view_bookmark" style="display: none;width: 935px;">
							<article class="post-article">
								<div>
									<div style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">	
									<div class="post-one-row">
									<span style="font-size: 10px; margin-left: -1px; color:#8e8e8e;">저장한 내용은 회원님만 볼 수 있습니다</span>	
						<c:choose>
							<c:when test="${empty bookmarkList}">
							<div class="one-post" style="margin-left: -35px;">
									<div class="post-img-space" style="background-color: #fafafa; margin-top: 20px;">
									<img alt="" style="width: 70px; height: 70px; margin-left: 111px; margin-top: 30px;" src="${pageContext.request.contextPath}/static/icons/mybookmark.png">
										<div style="text-align: center; margin-top: 10px;">
										<span style="font-weight: bold; font-size: 30px; margin-bottom: 20px;">저장 </span>
												<span style="font-size: 15px; margin-top: 5px;">다시 보고 싶은 사진과 게시물을 저장하세요.</span>
												<span style="font-size: 15px; margin-top: 5px;">저장해도 다른 사람에게 알림이 전송되지 않으며,</span>
												<span style="font-size: 15px; margin-top: 5px;">저장된 콘텐츠는 회원님만 볼 수 있습니다.</span>
										</div>			
									</div>
								</div>
							</c:when>
						<c:otherwise>
								<c:forEach items="${bookmarkList}" var="marklist">
										<div class="one-post" style="margin-top: 30px;">
											<a href="./post/selectOne?postNum=${marklist.postNum}" tabindex="0">
												<div class="post-img-space">
													<div class="post-image-div">
													<c:forEach items="${marklist.fileList }" var="fileVO" varStatus="status" begin="0" end="0">		
														<img alt="" class="post-img" crossorigin="anonymous" decoding="auto" src="${pageContext.request.contextPath}/static/upload/post/${fileVO.postfileName}" style="object-fit: cover;">
														</c:forEach>
													</div>
													<div class="img-background"></div>
												</div>
											</a>
										</div>
									</c:forEach>
						</c:otherwise>
						</c:choose>
									</div>
								</div>
							</div>
						</article>
					</div>	
				</div>
			</main>
			<c:import url="./temp/footer.jsp"></c:import>
		</section>
	</div>
	<div class="update-message-space">
		<div class="update-ease-out">
			<div class="update-message">
				<div class="update-text-space">
					<p class="update-text"></p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-container" role="presentation" style="display: none;">
		<div class="modal" role="dialog">
			<div class="modal-content">
				<div class="madal-space">
					<div class="modal-header">
						<h3 class="modal-header-text">프로필 사진 바꾸기</h3>
					</div>
					<div class="modal-body">
						<button class="modal-btn photo-upload " tabindex="0">사진 업로드</button>
						<button class="modal-btn photo-delete " tabindex="0">현재 사진 삭제</button>
						<button class="modal-btn cancel" tabindex="0">취소</button>
						<form enctype="multipart/form-data" action="./edit/fileUpdate" method="POST" role="presentation" class="profile-form">
							<input accept="image/jpeg,image/png" class="profile-photo" type="file" name="file" id="file">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="following-modal-container" role="presentation" style="display: none;" >
		<div aria-label="팔로잉" class="follow-modal" role="dialog">
			<div class="follow-modal-contents">
				<div>
					<div class="follow-modal-header">
						<div class="follow-modal-blank"></div>
						<h1 class="follow-modal-name">팔로잉</h1>
						<div class="follow-modal-close-space">
							<button class="follow-modal-close-btn" type="button">
								<div class="follow-modal-close">
									<span class="follow-modal-close-txt">&times;</span>
								</div>
							</button>
						</div>
					</div>
				</div>
				<div class="follow-modal-list">
					
				</div>
			</div>
		</div>
	</div>
	<div class="follower-modal-container" role="presentation" style="display: none;" >
		<div aria-label="팔로잉" class="follow-modal" role="dialog">
			<div class="follow-modal-contents">
				<div>
					<div class="follow-modal-header">
						<div class="follow-modal-blank"></div>
						<h1 class="follow-modal-name">팔로워</h1>
						<div class="follow-modal-close-space">
							<button class="follow-modal-close-btn" type="button">
								<div class="follow-modal-close">
									<span class="follow-modal-close-txt">&times;</span>
								</div>
							</button>
						</div>
					</div>
				</div>
				<div class="follower-modal-list">
					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profileEdit.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profile.js"></script>
</body>
</html>