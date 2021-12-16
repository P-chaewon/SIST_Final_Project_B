<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./temp/head.jsp"></c:import>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/tag.css">
</head>
<body>
	<div class="wrapper">
<c:import url="./temp/nav.jsp"></c:import>
	
	<section id="container">
	
	<div id="content">
	<div style="margin-top: 60px;">
	

		<img alt="tag" style="width:75px; height:75px; border: 1px solid  #8E8E8E; border-radius:50px; padding: 10px;" src="${pageContext.request.contextPath}/static/icons/hash.png">
	
	
		<div style="margin-top: -81px; margin-left: 105px;">
		<span style="font-size: 35px; margin-left: 15px;">${word}</span><br><br>
		<span style="font-size: 18px; margin-left: 15px;">게시물 <span style="font-weight: bold;">${tag_cnt }</span></span>
	
		
		</div>
	
	</div>
	
	<div class="explore_list" style="margin-top: 70px;">
		<div style=" margin-left: 5px;">
			<span style="color: #8E8E8E; font-size: 17px; font-weight: bold;">최근 게시물</span>
		</div>
	<ul id="exploreListArea">
		<c:forEach items="${tag}" var="tags">
		
		<li>
			<!-- 이미지 케이스 -->
			<div class="pro_module">
				<div class="img_wrap">															
					
				<a href="../../post/selectOne?postNum=${tags.postNum}">
				<c:forEach items="${tags.fileList }" var="fileVO" varStatus="status" begin="0" end="0">				
					
					<img style="width: 300px; height: 232px; " src="${pageContext.request.contextPath}/static/upload/post/${fileVO.postfileName}" alt="test">	
				</c:forEach>
				
					
				</a>
				</div>
				
			</div>
		</li>		
	
		</c:forEach>

	
		</ul>
	</div>
	</div>
	</section>
	
	</div>
	
	
</body>
</html>