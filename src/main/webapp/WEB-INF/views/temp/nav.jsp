<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nav.css">
</head>
<body>
	<!-- nav -->
		<nav>
			<div class="nav_container">
				
				<!-- logo 추가 -->
				<div class="nav_logo">
					<img class="logo_img" alt="logo" src="${pageContext.request.contextPath}/static/icons/instagram_logo.png">
				</div>
				
				<!-- 검색창 -->
				<input id="search" type="search" name="search" placeholder="검색" >
				
				<!-- icon -->
				<div class="nav_icon">
					<img id="home" onclick="javascript:location.href='${pageContext.request.contextPath}'" alt="홈" src="${pageContext.request.contextPath}/static/icons/home.png">
					<img alt="DM" src="${pageContext.request.contextPath}/static/icons/dm.png">
					<img id="upload" onclick="javascript:location.href='${pageContext.request.contextPath}/post/upload'" alt="post" src="${pageContext.request.contextPath}/static/icons/add.png">
					<img alt="탐색" src="${pageContext.request.contextPath}/static/icons/global.png">
					<img alt="알림" src="${pageContext.request.contextPath}/static/icons/bell.png">
					<img alt="마이페이지" src="${pageContext.request.contextPath}/static/icons/user.jpg" class="pic">
				
				</div>
			</div>
		</nav>

</body>
</html>