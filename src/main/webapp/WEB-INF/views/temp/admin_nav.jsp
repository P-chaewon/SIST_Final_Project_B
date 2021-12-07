<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<c:choose>
						<c:when test="${board eq 'ad'}">
							<img alt="광고" src="${pageContext.request.contextPath}/static/icons/ad-click.png">
						</c:when>
						<c:otherwise>
							<img alt="광고" src="${pageContext.request.contextPath}/static/icons/ad.png">
						</c:otherwise>
					</c:choose>
					</a>
					<!-- 멤버십 -->
					<a href="${pageContext.request.contextPath}/admin/membership">
					<c:choose>
						<c:when test="${board eq 'membership'}">
							<img alt="멤버십" src="${pageContext.request.contextPath}/static/icons/membership-click.png">
						</c:when>
						<c:otherwise>
							<img alt="멤버십" src="${pageContext.request.contextPath}/static/icons/membership.png">
						</c:otherwise>
					</c:choose>
					</a>
					<!-- 결제 -->
					<a href="${pageContext.request.contextPath}/admin/payments">
					<c:choose>
						<c:when test="${board eq 'payments'}">
							<img alt="결제" src="${pageContext.request.contextPath}/static/icons/payment-click.png">
						</c:when>
						<c:otherwise>
							<img alt="결제" src="${pageContext.request.contextPath}/static/icons/payment.png">
						</c:otherwise>
					</c:choose>
					</a>
					<!-- 신고 -->
					<a href="${pageContext.request.contextPath}/admin/report">
					<c:choose>
						<c:when test="${board eq 'report'}">
							<img alt="신고" src="${pageContext.request.contextPath}/static/icons/block-click.png">
						</c:when>
						<c:otherwise>
							<img alt="신고" src="${pageContext.request.contextPath}/static/icons/block.png">
						</c:otherwise>
					</c:choose>
					</a>
				</div>
			</div>
		</nav>

</body>
</html>