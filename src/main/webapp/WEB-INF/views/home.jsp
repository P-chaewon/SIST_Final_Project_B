<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="./temp/head.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>HOME</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">

</head>
<body>
	<c:import url="./temp/nav.jsp"></c:import>
		<script type="text/javascript">
			$("#home").attr("src", "${pageContext.request.contextPath}/static/icons/home-click.png");
		</script>
	
	<!-- main page -->
		<main>
			
			<!-- left feed area -->
			
			<div class="main_feed">
				
				<!-- post foreach, db 추가 -->
				
				<article>
					<!-- post header -img, nickname, more -->
					<header>
						<div class="post_profile">
							<img class="post_profile_img pic" alt="profile" src="${pageContext.request.contextPath}/static/images/post/sample_profile.jpg">
							<span class="nickname main_nickname point_span">cogus196</span>
						</div>
						<img class="icon_react icont_more" alt="more" src="${pageContext.request.contextPath}/static/icons/more.png">
					</header>
					<!--//header  -->
					
					<!-- post image -->
					<div class="post_image">
						<img alt="post" src="${pageContext.request.contextPath}/static/images/post/sample2.jpg">
					</div>
					<!-- post icon -->
					<div class="icons_react">
						<div class="icons_left">
							<img class="icon_react" alt="heart" src="${pageContext.request.contextPath}/static/icons/heart.png">
							<img class="icon_react" alt="speech" src="${pageContext.request.contextPath}/static/icons/bubble-chat.png">
						</div>
						<img class="icon_react" alt="bookmark" src="${pageContext.request.contextPath}/static/icons/bookmark.png">
					</div>
					
					<!-- text  -->
					<div class="reaction">
			            <div class="liked_people">
			              <img class="pic" src="${pageContext.request.contextPath}/static/images/kittens 2.jpg" alt="profile">
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
			                  <img class="comment_heart" src="${pageContext.request.contextPath}/static/icons/heart.png" alt="하트">
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
			
			<!--//left area -->
			
			<!-- right area -->
			
			<div class="right_contents">
				
				<div class="myProfile">
					<img class="pic" alt="myprofile" src="${pageContext.request.contextPath}/static/images/post/sample_profile.jpg">
					<div>
						<span class="nickname point_span">cogus196</span>
						<!-- span username 추가 -->
						<span class="sub_span">김채현</span>
					</div>
				</div>
			
				<!-- recommendation section -->
				<!-- 신규순 추천 -->
				<div class="section_recommend">
					<div class="recommend_title">
						<span class="sub-title">회원님을 위한 추천</span>
					</div>		
					
					<!-- recommend list -->
					<ul class="recoomend_list">
						<li><!-- foreach -->
							<div class="recommend_profile">
								<img class="post_profile_img" alt="profile_img" src="${pageContext.request.contextPath}/static/images/kittens 2.jpg">
								<div class="profile_text">
									<span class="nickname point_span">rlacogus</span>
									<span class="sub_span">채현</span>
								</div>
							</div>
						<span class="btn_follow">팔로우</span>
						</li>
					</ul>
				</div>
				
				<!-- footer 추가 -->
				
			</div>
			
		</main>
	
	
</body>
</html>