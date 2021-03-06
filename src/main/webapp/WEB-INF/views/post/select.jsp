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
	<sec:authentication property="principal.username" var="username"/>
	<sec:authentication property="principal.userNum" var="userNum"/>
		
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
						<a href="/gram/${postVO.userVO.username}">
							<img class="post_profile_img pic" alt="profile" src="${pageContext.request.contextPath}/static/upload/user/${postVO.userVO.fileName}">
						</a>	
							<span class="nickname main_nickname point_span" style="margin-left: 5px; cursor: pointer;" onclick="location.href='/gram/${postVO.userVO.username}'">
						
							${postVO.userVO.username}</span>
						

						<c:choose>
							<c:when test="${follow eq 0 }">
								<span class="bullet">•</span>
								<button class="following" type="button" style="display: none;">팔로잉</button>
								<button class="follow" type="button">팔로우</button>
							</c:when>
							<c:when test="${follow eq 1 }">
								<span class="bullet">•</span>
								<button class="following" type="button">팔로잉</button>
								<button class="follow" type="button" style="display: none;">팔로우</button>
							</c:when>
						</c:choose>
						<img class="icon_react icon_more" id="more" style="cursor: pointer; position:absolute; margin-left: 315px;" alt="more" src="${pageContext.request.contextPath}/static/icons/more.png">
				
						<img class="icon_react icon_more" id="more" data-postNum="${postVO.postNum}" style="cursor: pointer; position:absolute; margin-left: 315px;" alt="more" src="${pageContext.request.contextPath}/static/icons/more.png">

					</div>
					
					<div class="contents_area">
						<div class="contents">
							<div class="box">
			            	<div class="description">
			            	<div style="height: 100%; margin-top: 5px;">
				              <span class="point_span nickname" style="font-weight: 600; float: left;">${postVO.userVO.username }</span><span style="float: left; margin-left: 10px; height: 80px;">${postVO.contents}
			            		<span class="tag_${postVO.postNum }" style="color: #00376b; cursor: pointer;"> </span>
			            		

			            	<script type="text/javascript">
			            	    var original = '${postVO.tag}';
			            		var url = '\'/gram/search/tag/';
			            		var pid = '${postVO.postNum}';
			            		var a = '';
			            		var arr = original.split(' '); // ,를 기준으로 나눔

			            		for (var i = 0; i < arr.length; i++) {
			            			a += '<span style="color:#007AFF;" onclick="location.href='
			            				+ url 
			            				+ arr[i].replace("#", "") 
			            				+ '\'' 
			            				+ '">'
			            				+ arr[i]
			            				+ ' </span>';
			            			}
			            		$(".tag_" + pid).html(a);
			            	    
			            	</script>
			            		
			            		</span> 
			            	
			            	</div>
			            	</div>
			            	
			        
			            	
			           <div class="comment_section"  id="commentList" data-board-num="${postVO.postNum }" style="height: 210px; border-top:0.5px solid #E2E2E2; overflow-y:scroll; ">
			         
			             <c:forEach items="${postVO.commentList}" var="commentList">
			             
			             <!-- comment 작성시 -->
			             <c:if test="${not empty commentList.commentContents }">
			             
			             <ul class="comments" style="margin-top: 15px;">
							                <li style="height: 17px;">
							                  <span class="point_span nickname" style="font-weight: bold; cursor: pointer;" onclick="location.href='/gram/${commentList.writer}'" >${commentList.writer}</span>
							                  <span style="margin-left: 5px;">${commentList.commentContents}</span>
							
							                </li>
							
							</ul>
							
							<div class="description" id="comment_reply" style="margin-top: 7px;">
								   <span class="sub" style="font-size: 12px; width: 60px; float: left;">${commentList.regDate}</span> 
							       <c:choose>
							       	<c:when test="${username eq commentList.writer}">
										<button class="commentDel" id="commentDel" data-comment-del="${commentList.commentNum}" style="margin-left:230px; border:1px solid #000000; font-size:12px; background-color:#fff;">삭제</button>
							       	</c:when>
							       	<c:otherwise>
							       		<button class="commentDel suspend" data-writer="${commentList.writer}" data-comment-del="${commentList.commentNum}" style="margin-left:230px; border:1px solid #000000; font-size:12px; background-color:#fff;">신고 </button>
							       	</c:otherwise>
							       </c:choose>
							 </div>
							 
			             
			             </c:if>

				  			
				</c:forEach>

			        </div>
			   
			
			            	
			            </div>
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
				     				  
			              <p id="count_text" style="cursor: pointer;" data-idx = "${postVO.postNum }"><span class="point-span" id="m_likes${postVO.postNum }" style="font-weight: bold;">${postVO.likes}</span>명이 좋아합니다</p>

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
	
		<div class="modal">
		<div class="modal_content">
			<c:choose>
			
			<c:when test="${userNum eq postVO.userNum }">
			<button type="button" id="delete">
				<h1>삭제</h1>		
			</button>
			</c:when>
			<c:otherwise>
			<button type="button" id="suspend">
				<h1>신고</h1>
			</button>
			
			</c:otherwise>
			</c:choose>
			<button type="button" id="cancel">취소</button>
		</div>
	</div>
	
	<div class="modal2">
		<div class="modal_content2">
			<div id="d1" style="height: 100px;">
			<c:choose>
			<c:when test="${userNum eq postVO.userNum }">
				<span class="c">
					<h1 id="z1_t1">게시물을 삭제할까요?</h1> 
					<span id="z1_t2">이 게시물을 삭제하시겠어요?</span>
				</span>	
			</c:when>
			<c:otherwise>
			<span class="c">
					<h1 id="d1_t1">게시물을 신고할까요?</h1> 
					<span id="d1_t2">이 게시물을 신고하시겠어요?</span>
				</span>
			</c:otherwise>
			</c:choose>
				
				
			</div>
			
			<c:choose>
			<c:when test="${userNum eq postVO.userNum }">
				<div id="z2">
				<h1 class="c" id="z2_del">삭제</h1>
			</div>	
			
			</c:when>
			<c:otherwise>
			<div id="d2">
				<h1 class="c" id="d2_del">신고</h1>
			</div>
			</c:otherwise>
			</c:choose>
			
			<div id="d3">
				<span class="c" id="d3_can" style="height: 50px;">취소</span>
			</div>
		</div>
	</div>
	
	
<!-- 댓글 신고 모달 -->
	<div class="report_modal">
		<div class="report_modal_content">
			<button type="button" id="comment_suspend">
				<h1>신고</h1>
			</button>
			<button type="button" id="suspend_cancel">취소</button>
		</div>
	</div>

	<div class="report_modal2">
		<div class="report_modal_content2">
			<div id="d1">
				<h1 class="d1_c">신고</h1>
				<img class="modal_img" id="img_cancel" alt="cancel"
					src="${pageContext.request.contextPath}/static/icons/cancel.png">
			</div>
			<div id="d2">
				<h1 id="d2_c">이 댓글을 신고하는 이유는 무엇인가요?</h1>
			</div>
			<div id="d3">
				<form id="report_frm" method="post">
					<input hidden="hidden" name="reportType" value="comment"> 
					<input id="toUserNum" type="hidden" name="toUserNum" value="0">
					<input type="hidden" name="fromUserNum" value="${userNum}">
					<input type="hidden" name="postNum" value="${param.postNum}">
					<textarea id="reason" rows="" cols="" name="reason"></textarea>
				</form>
				<h1 id="submit_btn">제출</h1>
			</div>
		</div>
	</div>

<!-- 좋아요 리스트 -->
		<div class="like-modal-container" role="presentation" style="display: none;" >
		<div aria-label="좋아요" class="like-modal" role="dialog">
			<div class="like-modal-contents">
				<div>
					<div class="like-modal-header">
						<h1 class="like-modal-name">좋아요</h1>
						<div class="like-modal-close" style="cursor: pointer;">
							<span class="like-modal-close-txt">&times;</span>
						</div>
					</div>
				</div>
				<div class="like-modal-list">
					
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/follow.js"></script>
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
 	
  	$(document).on('click', "#count_text",function() {
   	    // 게시물번호 idx로 전달받아 저장
   	    var no = $(this).data('idx');
   	    console.log(no);
   	
   	        $.ajax({
   	            url : '../getLikeUser.do',
   	            type : 'get',
   	            data : {
   	                no : no,
   	            },
   	            success : function(result) {
   	         	result = result.trim();
   				$(".like-modal-list").html(result);
   				$(".like-modal-container").show();
   				console.log(result);
   	            
   	            },
   	            error : function() {
   	                alert('서버 에러');
   	            }
   	        });
   	});
   	
   	$(".like-modal-close-txt").click(function(){
   		$(".like-modal-container").hide();
   		location.reload(true);
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
 	

  	$(".following").click(function () {
  		let followNum=${postVO.userNum}
  		let userNum=${userNum}
  		if(follow(false, followNum, userNum)==0){
  			$(this).hide();
  			$(this).siblings(".follow").show();
  		}
	})
	
	$(".follow").click(function () {
		let followNum=${postVO.userNum}
  		let userNum=${userNum}
		if(follow(true, followNum, userNum)==1){
			$(this).hide();
			$(this).siblings(".following").show();
		}
	})

  	 
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
  	
 
 	
	$(document).on("click", "#reply", function() {
		if($(this).parent().next().css("display")=="none"){
			$(this).parent().next().show();
		}else{
			$(this).parent().next().hide();	
		}
	
	}); 
  
	//Del click event
	$("#commentList").on("click", "#commentDel", function() {
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
	

  $('#chat').click(function(){
	  $("#input_comment").focus();
  })

  
  /* 모달- 신고, 삭제 */
  	 var postNum = 0;
  	 
  	$(document).on("click", "#more",function(){
  		$(".modal").fadeIn();
  		// 스크롤 제한 on
  		$('html, body').css({'overflow': 'hidden', 'height': '100%'});
  		postNum = (this).getAttribute('data-postNum');
  	});

  	$("#cancel").click(function(){
  		$(".modal").fadeOut();
  		// 스크롤 제한 off
  		$('html, body').css({'overflow': 'auto', 'height': 'auto'});
  	});

  	$("#delete").click(function(){
  		$(".modal2").fadeIn();
  	});

  	$("#z2").click(function(){
  		location.href = "./post/delete?postNum="+postNum;
  	});

  	$("#d3").click(function(){
  		$(".modal").fadeOut();
  		$(".modal2").fadeOut();
  		// 스크롤 제한 off
  		$('html, body').css({'overflow': 'auto', 'height': 'auto'});
  	});
  	
  	
  	/* 신고 버튼 */
  	$(".suspend").click(function(){
  		writer = (this).getAttribute('data-writer');
  		
  		$(".report_modal").fadeIn();
  		// 스크롤 제한 on
  		$('html, body').css({'overflow': 'hidden', 'height': '100%'});
  		postNum = (this).getAttribute('data-postNum');
  	});
  	
  	$("#suspend_cancel").click(function(){
  		$(".report_modal").fadeOut();
  		// 스크롤 제한 off
  		$('html, body').css({'overflow': 'auto', 'height': 'auto'});
  	});
  	
  	$("#comment_suspend").click(function(){
  		$(".report_modal2").fadeIn();
  	});
  	
  	$("#img_cancel").click(function(){
  		$(".report_modal").fadeOut();
  		$(".report_modal2").fadeOut();
  		// 스크롤 제한 off
  		$('html, body').css({'overflow': 'auto', 'height': 'auto'});
  	});
  	
  	$("#submit_btn").click(function(){
		var result = confirm("신고 접수하시겠습니까?");
		if (result) {
			if ($("#reason").val().length != 0) {
				$.ajax({
	   	            url : './getToUserNum.do',
	   	            type : 'get',
	   	            data : {
	   	            	writer : writer,
	   	            },
	   	            success : function(userNum) {
	   	            	$("#toUserNum").val(userNum);
	   	            	$("#report_frm").submit();
	   	            },
	   	            error : function() {
	   	                alert('서버 에러');
	   	            }
	   	        });	
			} else {
				alert("신고 이유를 입력해주세요.");	
			}
		}
	});
  	
	/* 수정 */
  	  	$(document).on("click", "suspend",function(){
  		$(".modal2").fadeIn();
  		// 스크롤 제한 on
  		$('html, body').css({'overflow': 'hidden', 'height': '100%'});
  		commentNum = (this).getAttribute('data-commentNum');
  	});

  	$("#cancel").click(function(){
  		$(".modal").fadeOut();
  		// 스크롤 제한 off
  		$('html, body').css({'overflow': 'auto', 'height': 'auto'});
  	});

  	$("#delete").click(function(){
  		$(".modal2").fadeIn();
  	});

  
  	$("#d3").click(function(){
  		$(".modal").fadeOut();
  		$(".modal2").fadeOut();
  		// 스크롤 제한 off
  		$('html, body').css({'overflow': 'auto', 'height': 'auto'});
  	});
  	
 	
   	</script>  	 
</body>
</html>