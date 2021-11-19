<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin_nav.css">
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
					<a href="${pageContext.request.contextPath}/admin/"><img alt="홈" src="${pageContext.request.contextPath}/static/icons/home.png"></a>
					<a href="${pageContext.request.contextPath}/admin/ad/create"><img alt="post" src="${pageContext.request.contextPath}/static/icons/add.png"></a>
					<a href="${pageContext.request.contextPath}/admin/payments"><img alt="payment" src="${pageContext.request.contextPath}/static/icons/payment.png"></a>
					<%-- <img alt="탐색" src="${pageContext.request.contextPath}/static/icons/global.png">
					<img alt="알림" src="${pageContext.request.contextPath}/static/icons/bell.png">
					<img alt="마이페이지" src="${pageContext.request.contextPath}/static/icons/user.jpg" class="pic"> --%>
				
				</div>
			</div>
		</nav>

</body>
</html>