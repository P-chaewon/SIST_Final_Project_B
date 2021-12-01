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
	<c:import url="../temp/nav2.jsp"></c:import>
	<div class="wrapper">
	
	<section id="container">
	<div id="content">
	<div class="explore_list" >
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

	 <img class="top" alt="top" onclick="clickme()" src="${pageContext.request.contextPath}/static/icons/top.png">
		</ul>
	</div>
	</div>
	</section>
	
	</div>
	
	
	<script type="text/javascript">
	$(".img_wrap").mouseenter(function(){
		$(this).css("background-color", "red");
		
	};

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
 	   	
	
	</script>
</body>
</html>