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
						<sec:authentication property="principal.username" var="username"/>
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
			            	<div style="height: 50px;">
				              <span class="point_span nickname" style="font-weight: 600; float: left;">${postVO.userVO.username }</span><span style="float: left; margin-left: 10px;">${postVO.contents}
			            		<span class="tag" style="color: #00376b; cursor: pointer;"> ${postVO.tag }</span></span> 
			            	
			            	</div>
			        
		
					<div class="comment_section"  id="commentList" data-board-num="${postVO.postNum }" style="height: 260px; border-top:0.5px solid #E2E2E2; overflow-y:scroll; ">
			         
			             <c:forEach items="${postVO.commentList}" var="commentList">
			             
			          
			      

				  			<ul class="comments" style="margin-top: 15px;">
							                <li style="height: 17px;">
							                  <span class="point_span nickname" style="font-weight: bold;">${commentList.writer}</span><span style="margin-left: 5px;">${commentList.commentContents}</span>
							<button class="commentDel" data-comment-del="${commentList.commentNum}" style="margin-left:30px; font-size:12px; background-color:#fff; border-style: none;">삭제</button>
							                </li>
							                <!-- input 값 여기에 추가 -->
							</ul>
							
							<div class="description" id="comment_re" style="margin-top: 7px;">
								   <span class="sub" style="font-size: 12px; width: 60px; float: left;">${commentList.regDate}</span> 
							       <span class="sub_span" id="re" style="cursor: pointer; float: left; margin-left: 5px;">답글달기</span>
							 </div>
							 
							 
							 <div class="comment_re" style="width: 330px; display:none; height:40px; margin-top:5px; border: 1px solid #DBDBDB;">
							          <!-- 이모지 추가 -->
					
							            <input id="input_comment_re" name="commentContents" style="width: 270px; height:30px; margin-left: 5px;"  class="input_comment" type="text" placeholder="답글 달기..." >
						
							            <button type="button" class="submit_re" id="comment_re" disabled>게시</button>
							          
							          </div>
				</c:forEach>

			        </div>
			            	</div>
			            </div>
						</div>
					
					</div>
					
					<div class="icons_react">
						<div class="icons_left">
							<sec:authentication property="principal.username" var="username"/>
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
						
							<img class="icon_react" style="margin-left: 5px;" id="chat" alt="speech" src="/gram/static/icons/bubble-chat.png">
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
			                <span>${postVO.regDate }</span>
			           </div>
			           
			             <div class="comment">
			          <!-- 이모지 추가 -->
			          
			          <input type="hidden" class="form-control" name="writer" id="writer" value="${username}" placeholder="Enter Writer" readonly="readonly">
			
			            <input id="input_comment" name="commentContents" class="input_comment" type="text" placeholder="댓글 달기..." >
		
			            <button  type="button" class="submit_comment" id="comment" disabled>게시</button>
			          
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
 	
  	 
  	$(function() {
  	    $("#input_comment").on("keyup", function() {
  	        var flag = true;
  	        flag = $(this).val().length > 0 ? false : true;
  	        $(".submit_comment").attr("disabled", flag);
  	    });
  	});
  	
 	$(function() {
  	    $("#input_comment_re").on("keyup", function() {
  	        var flag = true;
  	        flag = $(this).val().length > 0 ? false : true;
  	        $(".submit_re").attr("disabled", flag);
  	    });
  	});
  
	//Del click event
	$("#commentList").on("click", ".commentDel", function() {
		let commentNum = $(this).attr("data-comment-del");
		console.log(commentNum);
		$.ajax({
			type: "POST",
			url : "./commentDel",
			data : {
				commentNum:commentNum
			},
			success: function(result) {
				result = result.trim();
				
				if(result>0){
					location.href="./selectOne?postNum=${postVO.postNum}"
					
				}else{
				
				}
				
			},
			error: function() {
				alert('삭제 실패');
			}
			
		});
	});
	
	$('#comment').click(function () {
		//작성자, 내용 콘솔 출력	

		let commentContents = $("#input_comment").val();
		let postNum = $("#commentList").attr("data-board-num");
		let writer =$("#writer").val();
		
		$.post('./comment', {postNum: postNum, writer:writer, commentContents:commentContents}, function(result) {
			console.log(result.trim());
			
			$("#input_comment").val('');
			location.href="./selectOne?postNum=${postVO.postNum}"
		} );
	});
	
	$(document).on("click", "#re", function() {
		if($(this).parent().next().css("display")=="none"){
			$(this).parent().next().show();
		}else{
			$(this).parent().next().hide();	
		}
	
	});
	
  $('#chat').click(function(){
	  $("#input_comment").focus();
  })

  	
 	
   	</script>  	 
</body>
</html>