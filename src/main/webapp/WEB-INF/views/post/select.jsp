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
		<main class="wrapper">
		
			<table class="tbl">
				
				<tr>
					<td class="img_td" >
					
						<div class="post_image swiper mySwiper">
			
							
							<div class="swiper-wrapper">
						
							
						<img class="post swiper-slide" alt="post" src="${pageContext.request.contextPath}/static/icons/user.jpg">
							<%-- <img class="post swiper-slide" alt="post" src="${pageContext.request.contextPath}/static/upload/post/${boardVO.fileList.fileName}"> --%>
						
							</div>
				
							<div class="swiper-button-next"></div>
      						<div class="swiper-button-prev"></div>
      						<div class="swiper-pagination"></div>		
						</div>
							
					</td>
					<td class="tbl_td" style="height:300px;">
					
					<div class="post_profile">
					
							<img class="post_profile_img pic" style="height: 26px; width: 26px; margin-top: 12px; margin-left: 10px;" alt="profile"  src="${pageContext.request.contextPath}/static/icons/user.jpg">
						
							
						<span class="nickname main_nickname point_span"><sec:authentication property="principal.nickname" var="nickname"/>	${nickname}</span>
						
						</div>
						<textarea name="contents" class="contents" rows="" cols="" placeholder="문구입력..."></textarea>
						
						<div>						
							<div id="result" class="result_txt"><span class="ui_inputLimitCount">0</span>/2,200</div>
							<img class="icon_react" alt="emoticon" src="${pageContext.request.contextPath}/static/icons/emoticon.png">
						</div>
					</td>
				
				<tr>
					<td class="tbl_td">
						<textarea class="tag" name="tag" rows="" cols="" placeholder="태그 추가" style="resize: none;"></textarea>
						
					</td>
				</tr>
			</table>
		
		

		
		
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