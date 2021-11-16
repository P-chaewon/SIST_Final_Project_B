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
					<!-- header -img, nickname, more -->
					<header>
						<div class="post_profile">
							<img class="post_profile_img pic" alt="profile" src="images/kittens 2.jpg">
							<span class="nickname main_nickname point_span">cogus196</span>
						</div>
						<img class="icon_react icont_more" alt="more" src="icons/more.png">
					</header>
					<!--//header  -->
				
				</article>
			
				<!--//post  -->
			
			
			</div>
			
		
			
			
			
		
			
		</main>
	

</body>
</html>