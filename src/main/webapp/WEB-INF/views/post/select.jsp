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
				
						<img class="icon_react icon_more" id="more" style="cursor: pointer; position:absolute; margin-left: 315px;" alt="more" src="${pageContext.request.contextPath}/static/icons/more.png">
						
					</div>
					
					<div class="contents_area">
						<div class="contents">
							<div class="box">
			            	<div class="description">
				              <span class="point_span nickname" style="font-weight: 600; float: left;">${postVO.userVO.username }</span><span style="float: left; margin-left: 10px;">${postVO.contents}
			            		<span class="tag" style="color: #00376b; cursor: pointer;"> ${postVO.tag }</span></span> 
			            	</div>
			            </div>
						</div>
						<div class="contents_comment">
						
						</div>
					
					</div>
					
					<div class="icons_react">
						<div class="icons_left">
							
							<c:choose>
						
							<c:when test="${empty postVO.likesVO.count}">
								<a idx ="${postVO.postNum}" class="heart-click heart_icon${postVO.postNum}"> 
									<img class="icon_react like_untouched" id="like" alt="heart" src="${pageContext.request.contextPath}/static/icons/heart.png">
								</a>
								
							</c:when>
							
							<c:otherwise>
								
								<a idx ="${postVO.postNum}" class="heart-click heart_icon${postVO.postNum}"> 
									<img class="icon_react like_touched" id="like" alt="heart" src="${pageContext.request.contextPath}/static/icons/heart-click.png">
								</a>
							</c:otherwise>
						
						</c:choose>
						
							<img class="icon_react" style="margin-left: 5px;" alt="speech" src="/gram/static/icons/bubble-chat.png">
						</div>
					
						<c:choose>
						
							<c:when test="${empty postVO.bookmarkVO.chk}">
								<a data-idx ="${postVO.postNum}" class="bookmark-click bookmark_icon${postVO.postNum}"> 
									
									<img class="icon_react bookmark_untouched" alt="bookmark" src="${pageContext.request.contextPath}/static/icons/bookmark.png">
								</a>
								
							</c:when>
							
							<c:otherwise>
								
								<a data-idx ="${postVO.postNum}" class="bookmark-click bookmark_icon${postVO.postNum}"> 
									
									<img class="icon_react bookmark_untouched" alt="bookmark" src="${pageContext.request.contextPath}/static/icons/bookmark-click.png">
								</a>
							</c:otherwise>
						
						</c:choose>
					
					
					</div>
					
					<div class="liked_people">
				     				  
			              <p id="count_text">총 <span class="point-span" id="m_likes${postVO.postNum }" style="font-weight: bold;">${postVO.likes}</span>명이 좋아합니다</p>

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
   	 
 	$(".heart-click").click(function() {

   	    // 게시물번호 idx로 전달받아 저장
   	    var no = $(this).attr('idx');
   	    console.log(no);

   	    // 빈하트를 눌렀을때
   	    if($(this).children('img').attr('class') == "icon_react like_untouched"){
   	        console.log("빈하트 클릭" + no);

   	        $.ajax({
   	            url : './insertLikes.do',
   	            type : 'get',
   	            data : {
   	                no : no,
   	            },
   	            success : function(postVO) {
   	               
   	            	let likes =postVO.likes;
   	            	
   	            	$('#m_likes'+no).text(likes);
   	            	
   	            
   	            },
   	            error : function() {
   	                alert('서버 에러');
   	            }
   	        });
   	        
   	        $(this).html("<img class='icon_react like_touched' id='like' alt='heart' src='${pageContext.request.contextPath}/static/icons/heart-click.png'>");

   	    // 꽉찬 하트를 눌렀을 때
   	    }else if($(this).children('img').attr('class') == "icon_react like_touched"){

   	        $.ajax({
   	            url : './deleteLikes.do',
   	            type : 'get',
   	            data : {
   	                no : no,
   	            },
   	            success : function(postVO) {
					
   	            	let likes =postVO.likes;
   	            
	   	            $('#m_likes'+no).text(likes);
   	            	
   	            },
   	            error : function() {
   	                alert('서버 에러');
   	            }
   	        });

   	        // 빈하트로 바꾸기
   	      
   	     $(this).html("<img class='icon_react like_untouched' id='like' alt='heart' src='${pageContext.request.contextPath}/static/icons/heart.png'>");
   	    }

   	});
   	
  	$(".bookmark-click").click(function() {

   	    // 게시물번호 idx로 전달받아 저장
   	    var no = $(this).data('idx');
   	    console.log(no);

   	    if($(this).children('img').attr('class') == "icon_react bookmark_untouched"){
   	        console.log("빈하트 클릭" + no);

   	        $.ajax({
   	            url : './insertBookmark.do',
   	            type : 'get',
   	            data : {
   	                no : no,
   	            },
   	            success : function(data) {
   	               
   	            	console.log("북마크 추가");
   	            
   	            },
   	            error : function() {
   	                alert('서버 에러');
   	            }
   	        });
   	        
   	        $(this).html("<img class='icon_react bookmark_touched' alt='bookmark' src='${pageContext.request.contextPath}/static/icons/bookmark-click.png'>");

   	    // 꽉찬 하트를 눌렀을 때
   	    }else if($(this).children('img').attr('class') == "icon_react bookmark_touched"){

   	        $.ajax({
   	            url : './deleteBookmark.do',
   	            type : 'get',
   	            data : {
   	                no : no,
   	            },
   	            success : function(data) {

   	            	console.log("북마크 삭제");
   	            	
   	            },
   	            error : function() {
   	                alert('서버 에러');
   	            }
   	        });

   	      
   	      
   	     $(this).html("<img class='icon_react bookmark_untouched' alt='bookmark' src='${pageContext.request.contextPath}/static/icons/bookmark.png'>");
   	    }



   	});
 	
 	
   	</script>  	 
</body>
</html>