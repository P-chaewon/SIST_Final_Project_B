<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="temp/head.jsp"></c:import>

<title>HOME</title>

<link rel="stylesheet" href="./css/home.css">

</head>
<body>
	<!-- nav -->
		<nav>
			<div class="nav_container">
				
				<!-- logo 추가 -->
				<div class="nav_logo">
					<img class="logo_img" alt="logo" src="icons/instagram_logo.png">
				</div>
				
				<!-- 검색창 -->
				<input id="search" type="search" name="search" placeholder="검색" >
				
				<!-- icon -->
				<div class="nav_icon">
					<img alt="홈" src="icons/home.png">
					<img alt="DM" src="icons/dm.png">
					<img alt="post" src="icons/add.png">
					<img alt="탐색" src="icons/global.png">
					<img alt="알림" src="icons/bell.png">
					<img alt="마이페이지" src="icons/user.jpg" class="pic">
				
				</div>
			</div>
		</nav>
		
	<!-- main page -->
		<main>
			
			<!-- left feed area -->
			
			<div class="main_feed">
				
				<!-- post foreach, db 추가 -->
				
				<article>
					<!-- post header -img, nickname, more -->
					<header>
						<div class="post_profile">
							<img class="post_profile_img pic" alt="profile" src="images/post/sample_profile.jpg">
							<span class="nickname main_nickname point_span">cogus196</span>
						</div>
						<img class="icon_react icont_more" alt="more" src="icons/more.png">
					</header>
					<!--//header  -->
					
					<!-- post image -->
					<div class="post_image">
						<img alt="post" src="images/post/sample2.jpg">
					</div>
					<!-- post icon -->
					<div class="icons_react">
						<div class="icons_left">
							<img class="icon_react" alt="heart" src="icons/heart.png">
							<img class="icon_react" alt="speech" src="icons/bubble-chat.png">
							<img class="icon_react" alt="dm" src="icons/dm.png">
						</div>
						<img class="icon_react" alt="bookmark" src="icons/bookmark.png">
					</div>
					
					<!-- text  -->
					<div class="reaction">
			            <div class="liked_people">
			              <img class="pic" src="images/kittens 2.jpg" alt="profile">
			              <p><span class="point_span">ch196</span>님 <span class="point-span">외 12,751명</span>이 좋아합니다</p>
			            </div>
			            <div class="description">
			              <p><span class="point_span nickname">cogus196</span><span class="at_tag"> @danchu_e_o</span> 하단추</p>
			            </div>
			            
			            <!-- comments -->
			            <div class="comment_section">
			              <ul class="comments">
			                <li>
			                  <span><span class="point_span nickname">ch196</span>단추ㅠ</span>
			                  <img class="comment_heart" src="icons/heart.png" alt="하트">
			                </li>
			                <!-- input 값 여기에 추가 -->
			              </ul>
			              <div class="time_log">
			                <span>1일전</span>
			              </div>
			            </div>
			          </div>
			          <div class="hl"></div>
			          <div class="comment">
			          <!-- 이모지 추가 -->
			            <input id="input_comment" class="input_comment" type="text" placeholder="댓글 달기..." >
			            <button type="submit" class="submit_comment" disabled>게시</button>
			          </div>
					
				</article>
			
				<!--//post  -->
			
			</div>
			
		
			
			
			
		
			
		</main>
	

</body>
</html>