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
					<!-- 광고 -->
					<a href="${pageContext.request.contextPath}/admin/home">
						<img alt="홈" src="${pageContext.request.contextPath}/static/icons/ad.png">
					</a>
					<!-- 멤버십 -->
					<a href="${pageContext.request.contextPath}/admin/membership">
						<img alt="홈" src="${pageContext.request.contextPath}/static/icons/membership.png">
					</a>
					<!-- 결제 -->
					<a href="${pageContext.request.contextPath}/admin/payments">
						<img alt="홈" src="${pageContext.request.contextPath}/static/icons/payment.png">
					</a>
					<!-- 신고 -->
					<a href="${pageContext.request.contextPath}/admin/">
						<img alt="홈" src="${pageContext.request.contextPath}/static/icons/block.png">
					</a>
				</div>
			</div>
		</nav>

</body>
</html>