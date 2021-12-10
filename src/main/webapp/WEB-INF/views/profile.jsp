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
	<c:import url="./temp/nav2.jsp"></c:import>
	<sec:authentication property="principal.username" var="username"/>
	<sec:authentication property="principal.userNum" var="userNum"/>
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
										<c:choose>
											<c:when test="${follow eq 1}">
												<div class="dm-fol-btn-space">
													<button class="dm-btn" type="button">
														<div class="dm-btn-txt">메시지 보내기</div>
													</button>
												</div>
												<div class="follow-btn-space">
													<div class="follow-btns">
														<span class="follow-btns-span">
															<span class="unfollow-btn-space">
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
											</c:when>
											<c:otherwise>
												<div class="follow-btn-space">
													<div class="follow-btns">
														<span class="follow-btns-span">
															<span class="unfollow-btn-space">
																<button class="fol-btn" type="button"  data-user-num="${userNum}" data-follow-num="${userVO.userNum}">
																	<div class="fol-btn-txt">팔로우</div>
																</button>
															</span>
															<span class="arrow-btn-space">
																<button class="fol-recommend-btn">
																	<div class="recommend-icon-space">
																		<div class="arrow-icon-background">
																			<img alt="" class="down-arrow-icon"  src="${pageContext.request.contextPath}/static/icons/arrow-down-white.png">
																			<img alt="" class="up-arrow-icon"  src="${pageContext.request.contextPath}/static/icons/arrow-up-white.png" style="display: none;">
																		</div>
																	</div>
																</button>
															</span>
														</span>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
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
									<span class="info-name follower" data-user-name="${userVO.username }" style="cursor: pointer;">
										팔로워 
										<span class="info-total" title="33,304">
											${count.followerCount}
										</span>
									</span>
								</li>
								<li class="info-li">
									<span class="info-name following" data-user-name="${userVO.username }" style="cursor: pointer;">
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
	<div class="unfollow-modal-container" role="presentation" style="display: none;">
		<div class="unfollow-modal" role="dialog">
			<div class="unfollow-modal-contents">
				<div class="unfollow-modal-space">
					<div class="unfollow-modal-img-space">
						<div class="unfollow-modal-img-div">
							<div class="unfollow-modal-img">
								<c:choose>
									<c:when test="${not empty userVO.fileName }">
										<img alt="${userVO.username}님의 프로필 사진" class="unfol-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}" style="height: 90px; width: 90px;">
									</c:when>
									<c:otherwise>
										<img alt="${userVO.username}님의 프로필 사진" class="unfol-img" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="${pageContext.request.contextPath}/static/icons/user.jpg" style="height: 90px; width: 90px;">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="unfollow-modal-txt-space">
						<div class="unfollow-modal-txt-div">
							<div class="unfollow-modal-check">
								<div class="unfollow-modal-check-txt">
									@${userVO.username}님의 팔로우를 취소하시겠어요?
								</div>
							</div>
						</div>
					</div>
					<div class="unfollow-modal-button-space">
						<button class="unfollow-modal-unfollow-btn" tabindex="0" data-user-num="${userNum}" data-follow-num="${userVO.userNum}">팔로우 취소</button>
						<button class="unfollow-modal-cancel-btn modal-close" tabindex="0">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 사용자 신고 모달 -->
	<div class="report_modal">
		<div class="report_modal_content">
			<button type="button" id="report">
				<h1>사용자 신고</h1>
			</button>
			<button type="button" id="cancel">취소</button>
		</div>
	</div>
	
	<div class="modal2">
		<div class="modal_content2">
			<div id="d1">
				<h1 class="d1_c">신고</h1>
				<img class="modal_img" id="img_cancel" alt="cancel" src="${pageContext.request.contextPath}/static/icons/cancel.png">
			</div>
			<div id="d2">
				<h1 id="d2_c">이 계정을 신고하는 이유는 무엇인가요?</h1>
			</div>
			<div id="d3">
				<form id="report_frm" method="post">
					<input hidden="hidden" name="reportType" value="user">
					<input type="hidden" name="toUserNum" value="${userVO.userNum}">
					<input type="hidden" name="fromUserNum" value="${fromUserNum}">
					<textarea rows="" cols="" name="reason"></textarea>
				</form>
				<h1 id="submit_btn">제출</h1>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(".three-circle").click(function(){
			$(".report_modal").fadeIn();
			$('html, body').css({'overflow': 'hidden', 'height': '100%'});
		});
		
		$("#cancel").click(function(){
			$(".report_modal").fadeOut();
			$('html, body').css({'overflow': 'auto', 'height': 'auto'});
		})
		
		$("#report").click(function(){
			$(".modal2").fadeIn();
		});
		
		$("#img_cancel").click(function(){
			$(".report_modal").fadeOut();
			$(".modal2").fadeOut();
			$('html, body').css({'overflow': 'auto', 'height': 'auto'});
		});
		
		$("#submit_btn").click(function(){
			var result = confirm("신고 접수하시겠습니까?");
			if (result) {
				$("#report_frm").submit();	
			}
		});
	</script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/profile.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/follow.js"></script>
	<script type="text/javascript">
		 $(".fol-btn").click(function () {
			let followNum=${userVO.userNum};
			let userNum=${userNum};
			if(follow(true, followNum, userNum)==1){
				location.reload(true);	
			}
		})

	
		$(".unfollow-modal-unfollow-btn").click(function(){	
			let followNum=${userVO.userNum};
			let userNum=${userNum};
			if(follow(false, followNum, userNum)==0){
				location.reload(true);	
			}
		})
		

	
	</script>
</body>
</html>