<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nav3.css">
</head>
<body>
	<sec:authentication property="principal" var="userVO"/>
	<!-- nav -->
		<nav>
			<div class="nav_container">
				
				<!-- logo 추가 -->
				<div class="nav_logo">
					<a href="/gram">
					
					<img class="logo_img" alt="logo" style="width: 100px; height:80px; margin-top: 35px;"src="${pageContext.request.contextPath}/static/icons/WithUs-logo.png">
					</a>
				</div>
				
				<!-- 검색창 -->
				<input id="search" type="search" autocomplete="off" name="search" placeholder="검색" >
				
				<!-- icon -->
				<div class="nav_icon">

					<img id="home" class="icon" onclick="javascript:location.href='${pageContext.request.contextPath}'" alt="홈" src="${pageContext.request.contextPath}/static/icons/home.png">
					<img alt="DM" id="dm" class="icon" onclick="javascript:location.href='${pageContext.request.contextPath}/chat/inbox'" alt="dm" src="${pageContext.request.contextPath}/static/icons/dm.png">
					<img id="upload" class="icon" onclick="javascript:location.href='${pageContext.request.contextPath}/post/upload'" alt="post" src="${pageContext.request.contextPath}/static/icons/add.png">
					<img id="explore" class="icon" alt="탐색" onclick="javascript:location.href='${pageContext.request.contextPath}/explore'"  src="${pageContext.request.contextPath}/static/icons/global.png">

					<span class="alarm_img" style="margin-right: 20px; height: 24px;">
						<img id ="alarm" class="icon" alt="알림" src="${pageContext.request.contextPath}/static/icons/bell.png">
					</span>
					<div id="alarm_contents" hidden="hidden">
					</div>
					<div class="profile_border">
						<div class="profile_img">

							<img alt="마이페이지" class="icon pic" src="${pageContext.request.contextPath}/static/upload/user/${userVO.fileName}" >

						</div>
						<div class="nav_profile" id="" style="display: none;">
							<div class="list_space"></div>
							<div class="list_rhom"></div>
							<div class="nav_list">
								<a class="profile_list" href="/gram/${userVO.username }" tabindex="0">
									<div class="list_first">
										<div class="list_img">
											<img alt="" src="${pageContext.request.contextPath}/static/icons/user.png">
										</div>
										<div class="profile_name">
											<div class="profile_area">
												<div class="profile_link">
													<div class="nav_profile_text" >
														프로필
													</div>
												</div>
											</div>
										</div>
									</div>
								</a>
								<a class="profile_list" href="/gram/account/edit/" tabindex="0">
									<div class="list_middle">
										<div class="list_img">
											<img alt="" src="${pageContext.request.contextPath}/static/icons/settings.png">
										</div>
										<div class="profile_name">
											<div class="profile_area">
												<div class="profile_link">
													<div class="nav_profile_text" style="height: 28px; width: 170px;">
														설정
													</div>
												</div>
											</div>
										</div>
									</div>
								</a>
								<hr class="hr">
								<div class="profile_list" aria-disabled="false" role="button" tabindex="0">
									<div class="list_last">
										<a href="/gram/account/logout" class="profile_link">로그아웃</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		
		
<!-- 검색창 -->			
	<div class="search_modal" style="display: none;">
		<div class="search-modal-area">
			<div class="search-modal-header">
		
				<div class="newMessageLetter">
					<p> 검색 </p>
			</div>
			
			<div class="modal-close-area">
				<button class="modalCloseBtn">
					<img alt="modal close" src="${pageContext.request.contextPath}/static/icons/stroke-close.png">
				</button>
			</div>
		</div>
		
		<div class="search-modal-content">
			<div class="modalSearchArea">
				<div class="searchBox">
					<div class="searchUserName">
						<input id="searchText" type="text" autocomplete="off" placeholder="검색...">
					</div>
				</div>
			</div>
			
			<!-- 검색결과 -->
			<div id="modalSearchResultArea" class="modalSearchResultArea">

			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
		$(".profile_img").click(function () {
			$(".nav_profile").show();
			$(".profile_border").css("border", "solid 1px black");
		})
		
		$(".list_space").click(function () {
			$(".nav_profile").hide();
			$(".profile_border").css("border", "");
		})
	</script>
					
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/temp/nav.js"></script>

</body>
</html>