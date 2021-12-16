<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/post/explore.css">
</head>
<body>
	<div class="wrapper">
	<c:import url="../temp/nav.jsp"></c:import>
	<script type="text/javascript">
	$("#explore").attr("src", "${pageContext.request.contextPath}/static/icons/global-click.png");
</script>
	
	<section id="container">
	<div id="content">
	<div class="explore_list" >
	<div style="margin-top: 30px; margin-left: 5px;">
	<span style="color: #8E8E8E; font-size: 14px; font-weight: bold;">최근 게시물</span>
	</div>
	<ul id="exploreListArea">
		<c:forEach items="${postList}" var="list">
		
		<li>
			<!-- 이미지 케이스 -->
			<div class="pro_module">
				<div class="img_wrap">															
					
				<a href="./post/selectOne?postNum=${list.postNum}">
				<c:forEach items="${list.fileList }" var="fileVO" varStatus="status" begin="0" end="0">				
					
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