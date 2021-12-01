<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<c:import url="../temp/nav.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/post/select.css">
</head>
<body>
	
	<main>
		
		<div class="user_post">
			<div class="post_img">
				<div class="post_image swiper mySwiper" style="height: 600px; ">
			
							
						<div class="swiper-wrapper">
						<c:forEach items="${postVO.fileList}" var="fileVO">
							
							<img class="post swiper-slide" alt="post" src="${pageContext.request.contextPath}/static/upload/post/${fileVO.postfileName}">
							
						</c:forEach>
							</div>
				
						<div class="swiper-button-next"></div>
      					<div class="swiper-button-prev"></div>
      					<div class="swiper-pagination"></div>		
					</div>
			
			
			</div>
			
			<div class="post_contents">
				<header class="head">
					<div class="post_profile">
							<img class="post_profile_img pic" alt="profile"  src="${pageContext.request.contextPath}/static/icons/user.jpg">
							<span class="nickname main_nickname point_span" style="margin-left: 5px;">
						
							${postVO.userVO.username}</span>
						
						<span class="bullet">•</span>
						<button class="following" type="button">팔로잉</button>
				
						<img class="icon_react icon_more" id="more" style="cursor: pointer; margin-left: 140px;" alt="more" src="${pageContext.request.contextPath}/static/icons/more.png">
						
					</div>
					
					<div class="contents_area">
						<div class="contents">
							<div class="box">
			            	<div class="description">
				              <span class="point_span nickname" style="font-weight: 600;">${postVO.userVO.username }</span> ${postVO.contents}
			            	
			            	</div>
			            </div>
						</div>
						<div class="contents_comment">
						
						</div>
					
					</div>
					
					<div class="icons_react">
						<div class="icons_left">
							<img class="icon_react" alt="heart" src="/gram/static/icons/heart.png">
							<img class="icon_react" style="margin-left: 5px;" alt="speech" src="/gram/static/icons/bubble-chat.png">
						</div>
						<img class="icon_react" alt="bookmark" src="/gram/static/icons/bookmark.png">
					</div>
					
					<div class="liked_people">
				              <img class="pic" src="/gram/static/images/kittens 2.jpg" alt="profile">
			          
			              <p><span class="point_span">ch196</span>님 <span class="point-span">외 12,751명</span>이 좋아합니다</p>
			            </div>
			            
			          <div class="time_log">
			                <span>1일전</span>
			           </div>
			           
			           <div class="comment">
			          <!-- 이모지 추가 -->
			            <input id="input_comment" class="input_comment" type="text" placeholder="댓글 달기...">
			            <button type="submit" class="submit_comment" style="margin-top: 20px;" disabled="">게시</button>
			          </div>  
					
				</header>
			
			</div>
		
		</div>
		
		

		
		
	</main>


 <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
    
   	 var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        effect: "fade",
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
 
      });
   	</script>  	 
</body>
</html>