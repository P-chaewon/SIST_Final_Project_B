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
	<div id="react-root">
		<section class="profile-home-section">
			<div></div>
			<main class="profile-home-main" role="main">
				<div class="profile-homepage">
					<header class="profile-info-header">
						<div class="profile-img-space">
							<div class="profile-img-div" aria-disabled="true" role="button" tabindex="-1">
								<canvas class="profile-img-canvas" height="168" width="168" style="position: absolute; top: -9px; left: -9px; width: 168px; height: 168px;"></canvas>
								<span class="profile-img-span" role="link" tabindex="-1" style="width: 150px; height: 150px;">
									<c:choose>
										<c:when test="${not empty userVO.fileName }">
											<img alt="${userVO.username}님의 프로필 사진" class="profile-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}">
										</c:when>
										<c:otherwise>
											<img alt="${userVO.username}님의 프로필 사진" class="profile-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/icons/user.jpg">
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						<section class="profile-info-space">
							<div class="profile-name-btn">
								<h2 class="profile-username">${userVO.username }</h2>
								<div class="profile-btn-space">
									<div class="profile-btns">
										<div class="dm-btn-space">
											<button class="dm-btn" type="button">
												<div class="dm-btn-txt">메시지 보내기</div>
											</button>
										</div>
										<div class="follow-btn-space">
											<div class="follow-btns">
												<span class="follow-btns-span">
													<span class="unfollow-btn">
														<button class="unfollow-modal-btn">
															<div class="follow-icon-space" style="height: 28px;">
																<div class="follow-icon-background">
																	<img alt="" class="follow-icon"  src="${pageContext.request.contextPath}/static/icons/follow-check.png">
																</div>
															</div>
														</button>
													</span>
													<span class="arrow-btn-space">
														<button class="recommend-btn">
															<div class="recommend-icon-space">
																<div class="arrow-icon-background">
																	<img alt="" class="down-arrow-icon"  src="${pageContext.request.contextPath}/static/icons/arrow-down.png">
																	<img alt="" class="up-arrow-icon"  src="${pageContext.request.contextPath}/static/icons/arrow-up.png" style="display: none;">
																</div>
															</div>
														</button>
													</span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="more-info-space">
									<button class="more-info-btn" type="button">
										<div class="three-circle">
											<svg aria-label="옵션" class="circle-svg" color="#262626" fill="#262626" height="32" role="img" viewBox="0 0 24 24" width="32">
												<circle cx="12" cy="12" r="1.5"></circle>
												<circle cx="6.5" cy="12" r="1.5"></circle>
												<circle cx="17.5" cy="12" r="1.5"></circle>
											</svg>
										</div>
									</button>
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
									<a class="info-name" href="/kopc_adopt/followers/" tabindex="0">
										팔로워 
										<span class="info-total" title="33,304">
											33.3천
										</span>
									</a>
								</li>
								<li class="info-li">
									<a class="info-name" href="/gram/${userVO.username}/following" tabindex="0">
										팔로우 
										<span class="info-total">
											301
										</span>
									</a>
								</li>
							</ul>
							<div class="profile-etc-info">
								<h1 class="profile-nickname">${userVO.nickname}</h1>
								<br>
								<span>
									${userVO.introduction}
								</span> 
							<a author_id="7964166036" class="profile-website" href="${userVO.website }" page_id="profilePage" rel="me nofollow noopener noreferrer" target="_blank">${userVO.website }</a>
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
								<c:choose>
									<c:when test="${username eq userVO.username}">
										<img alt="" src="${pageContext.request.contextPath}/static/icons/bookmark.png" class="bookmark-icon">
										<span class="tab-name">북마크</span>
									</c:when>
									<c:otherwise>
										<img alt="" src="">
										<span class="tab-name">동영상</span>									
									</c:otherwise>
								</c:choose>
							</span>
						</a>
						<a aria-selected="false" class="tab-entity" role="tab" href="/kopc_adopt/tagged/" tabindex="0">
							<span class="tab-info">
								<svg aria-label="" class="_8-yf5" color="#8e8e8e" fill="#8e8e8e" height="12" role="img" viewBox="0 0 48 48" width="12">
									<path d="M41.5 5.5H30.4c-.5 0-1-.2-1.4-.6l-4-4c-.6-.6-1.5-.6-2.1 0l-4 4c-.4.4-.9.6-1.4.6h-11c-3.3 0-6 2.7-6 6v30c0 3.3 2.7 6 6 6h35c3.3 0 6-2.7 6-6v-30c0-3.3-2.7-6-6-6zm-29.4 39c-.6 0-1.1-.6-1-1.2.7-3.2 3.5-5.6 6.8-5.6h12c3.4 0 6.2 2.4 6.8 5.6.1.6-.4 1.2-1 1.2H12.1zm32.4-3c0 1.7-1.3 3-3 3h-.6c-.5 0-.9-.4-1-.9-.6-5-4.8-8.9-9.9-8.9H18c-5.1 0-9.4 3.9-9.9 8.9-.1.5-.5.9-1 .9h-.6c-1.7 0-3-1.3-3-3v-30c0-1.7 1.3-3 3-3h11.1c1.3 0 2.6-.5 3.5-1.5L24 4.1 26.9 7c.9.9 2.2 1.5 3.5 1.5h11.1c1.7 0 3 1.3 3 3v30zM24 12.5c-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6 9.6-4.3 9.6-9.6-4.3-9.6-9.6-9.6zm0 16.1c-3.6 0-6.6-2.9-6.6-6.6 0-3.6 2.9-6.6 6.6-6.6s6.6 2.9 6.6 6.6c0 3.6-3 6.6-6.6 6.6z"></path>
								</svg>
								<span class="tab-name">태그됨</span>
							</span>
						</a>
					</div>
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
	<div id="fb-root" class="fb_reset">
		<div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>
	<div class="_-rjm">
		<div class="tA2fc"></div>
	</div>
	<div class="_5qKD1">
		<div class="q5edG"></div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profile.js"></script>
</body>
</html>