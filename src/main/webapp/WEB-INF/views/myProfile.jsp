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
										<c:choose>
											<c:when test="${not empty userVO.fileName }">
												<img alt="${userVO.username}님의 프로필 사진" class="input-icon" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">
											</c:when>
											<c:otherwise>
												<img alt="${userVO.username}님의 프로필 사진" class="input-icon" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/icons/user.jpg">
											</c:otherwise>
										</c:choose>
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
										<span class="info-total">2,731</span>
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
						<a aria-selected="true" class="tab-entity tab-selected" role="tab" href="/kopc_adopt/" tabindex="0">
							<span class="tab-info">
								<img alt="" src="${pageContext.request.contextPath}/static/icons/grid.png" class="post-icon">
								<span class="tab-name">게시물</span>
							</span>
						</a>
						<a aria-selected="false" class="tab-entity" role="tab" href="/kopc_adopt/channel/" tabindex="0">
							<span class="tab-info">
								<img alt="" src="${pageContext.request.contextPath}/static/icons/bookmark.png" class="bookmark-icon">
								<span class="tab-name">저장됨</span>
							</span>
						</a>
					</div>
					<!-- 게시글 보여주는 곳 -->
					<div class="post-space">
						<article class="post-article">
							<div>
								<div style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
									<div class="post-one-row">
										<div class="one-post">
											<a href="/p/CW2nv6IJPFJ/" tabindex="0">
												<div class="post-img-space">
													<div class="post-image-div">
														<img alt="" class="post-img" crossorigin="anonymous" decoding="auto" src="${pageContext.request.contextPath}/static/images/profileHome/profile_home_postImg1.jpg" style="object-fit: cover;">
													</div>
													<div class="img-background"></div>
												</div>
											</a>
										</div>
										<div class="one-post">
											<a href="/p/CW2RkSWJM9C/" tabindex="0">
												<div class="post-img-space">
													<div class="post-image-div">
														<img alt="" class="post-img" crossorigin="anonymous" decoding="auto" src="${pageContext.request.contextPath}/static/images/profileHome/profile_home_postImg2.jpg" style="object-fit: cover;">
													</div>
													<div class="img-background"></div>
												</div>
											</a>
										</div>
										<div class="one-post one-last">
											<a href="/p/CW1ylvzPrTH/" tabindex="0">
												<div class="post-img-space">
													<div class="post-image-div">
														<img alt="" class="post-img" crossorigin="anonymous" decoding="auto" src="${pageContext.request.contextPath}/static/images/profileHome/profile_home_postImg3.jpg" style="object-fit: cover;">
													</div>
													<div class="img-background"></div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="_4emnV">
								<div class="qF0y9 Igw0E IwRSH YBx95 _4EzTm _9qQ0O ZUqME" data-visualcompletion="loading-state" style="height: 32px; width: 32px;">
									<svg aria-label="읽어들이는 중..." class="By4nA" viewBox="0 0 100 100">
									<rect fill="#555555" height="6" opacity="0" rx="3" ry="3" transform="rotate(-90 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.08333333333333333" rx="3" ry="3" transform="rotate(-60 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.16666666666666666" rx="3" ry="3" transform="rotate(-30 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.25" rx="3" ry="3" transform="rotate(0 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.3333333333333333" rx="3" ry="3" transform="rotate(30 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.4166666666666667" rx="3" ry="3" transform="rotate(60 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.5" rx="3" ry="3" transform="rotate(90 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.5833333333333334" rx="3" ry="3" transform="rotate(120 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.6666666666666666" rx="3" ry="3" transform="rotate(150 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.75" rx="3" ry="3" transform="rotate(180 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.8333333333333334" rx="3" ry="3" transform="rotate(210 50 50)" width="25" x="72" y="47"></rect>
									<rect fill="#555555" height="6" opacity="0.9166666666666666" rx="3" ry="3" transform="rotate(240 50 50)" width="25" x="72" y="47"></rect>
									</svg>
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