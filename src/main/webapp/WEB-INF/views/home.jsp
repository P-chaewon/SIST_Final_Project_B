<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   

<!DOCTYPE html>
<html>
<head>
<title>HOME</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
<c:import url="./temp/head.jsp"></c:import>



</head>
<body>

   
	<c:import url="./temp/nav2.jsp"></c:import>
		<script type="text/javascript">
			$("#home").attr("src", "${pageContext.request.contextPath}/static/icons/home-click.png");
		</script>
	
	<!-- main page -->
		<main>
			
			<!-- left feed area -->
			
			<div class="main_feed">
				
				<!-- post foreach, db 추가 -->
				
				<c:forEach items="${postList}" var="list">
				<article style="   border: 1px solid #DBDBDB; margin-bottom: 60px;">
					<!-- post header -img, nickname, more -->
					<header>
						<div class="post_profile">
							<img class="post_profile_img pic" alt="profile"  src="${pageContext.request.contextPath}/static/icons/user.jpg">
							<span class="nickname main_nickname point_span">
								
							${list.userVO.nickname}</span>
						
						<a href="./post/selectOne?postNum=${list.postNum}">
						<img class="icon_react icon_more" id="more" style="margin-left: 450px; cursor: pointer;" alt="more" src="${pageContext.request.contextPath}/static/icons/more.png">
						</a>
						</div>
					</header>
					<!--//header  -->
					
					
					
					<!-- post image -->
					<div class="post_image swiper mySwiper" style="margin-left: -1px; width: 613px;">
			
							
						<div class="swiper-wrapper">
						<c:forEach items="${list.fileList}" var="fileVO">
							
							<img class="post swiper-slide" alt="post" src="${pageContext.request.contextPath}/static/upload/post/${fileVO.postfileName}">
							
						</c:forEach>
							</div>
				
						<div class="swiper-button-next"></div>
      					<div class="swiper-button-prev"></div>
      					<div class="swiper-pagination"></div>		
					</div>

					
					<!-- post icon -->
					<div class="icons_react">
						<div class="icons_left">
							<img class="icon_react like touched" id="like" alt="heart" src="${pageContext.request.contextPath}/static/icons/heart.png">
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
			            <div class="box">
			            	<div class="description">
				              <span class="point_span nickname" style="font-weight: 600;">cogus196</span> ${list.contents }
			            		<span class="tag">${list.tag }</span>
			            	</div>
			            </div>
			            
			            <!-- comments -->
			            <div class="comment_section">
			              <ul class="comments">
			                <li>
			                  <span><span class="point_span nickname">ch196</span>단추ㅠ</span>
			                </li>
			                <!-- input 값 여기에 추가 -->
			              </ul>
			              <div class="time_log">
			                <span>${list.regDate}</span>
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
			
				</c:forEach>
			
				<!--//post  -->
			</div>
			
			<!--//left area -->
			
			<!-- right area -->
			
			<div class="right_contents">
				
				<div class="myProfile">
					<img class="pic" alt="myprofile" src="${pageContext.request.contextPath}/static/icons/user.jpg">
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
				
				 <footer>
		          <p class="insta-sccript">
		            <a href="https://about.instagram.com/" class="link">소개</a> ∙ 
		            <a href="https://help.instagram.com/" class="link">도움말</a> ∙ 
		            <a href="https://about.instagram.com/blog/" class="link">홍보 센터</a> ∙ 
		            <a href="https://developers.facebook.com/docs/instagram" class="link">API</a> ∙ 
		            <a href="https://about.instagram.com/about-us/careers" class="link">채용 정보</a> ∙<br> 
		            <a href="https://help.instagram.com/519522125107875" class="link">개인정보처리방침</a> ∙ 
		            <a href="https://help.instagram.com/581066165581870" class="link">약관</a> ∙ 
		            <a href="https://www.instagram.com/explore/locations/" class="link">위치</a> ∙ 
		            <a href="https://www.instagram.com/directory/profiles/" class="link">인기계정</a> ∙ 
		            <a href="https://www.instagram.com/directory/hashtags/" class="link">해시태그</a>
		            <br><br>
		            © 2020 INSTAGRAM FROM FACEBOOK
		          </p>
		        </footer>
		        
		        <!-- 상단 이동 -->
		        
		        <img class="top" alt="top" onclick="clickme()" src="${pageContext.request.contextPath}/static/icons/top.png">
			</div>
			
			
			
		</main>

 <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript">
    
    $('.box').each(function(){
        var content = $(this).children('.description');
        var content_txt = content.text();
        var content_txt_short = content_txt.substring(0,100)+"...";
        var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

        
        $(this).append(btn_more);
        
        if(content_txt.length >= 100){
            content.html(content_txt_short)
            
        }else{
            btn_more.hide()
        }
        
        btn_more.click(toggle_content);
      

        function toggle_content(){
            if($(this).hasClass('short')){
                // 접기 상태
                $(this).html('더보기');
                content.html(content_txt_short)
                $(this).removeClass('short');
            }else{
                // 더보기 상태
                $(this).html('접기');
                content.html(content_txt);
                $(this).addClass('short');

            }
        }
    });
    
   	function clickme() {
   	  window.scrollTo({top:0, left:0, behavior:'smooth'});
   	}
   	
   	$( window ).scroll( function() {
   		if ( $( this ).scrollTop() > 200 ) {
   			$( '.top' ).fadeIn("fast");
   		} else {
   			$( '.top' ).fadeOut("fast");
   		}
   	} );
   	
   	
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
   	 
   	 
   	 $(document).on("click", "#like", function(){
   		 
   		 
   		$(this).attr("src", "${pageContext.request.contextPath}/static/icons/heart-click.png");
   	 });
   	 
   	 
 </script>




</body>
</html>