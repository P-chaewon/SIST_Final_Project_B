<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<c:import url="../temp/admin_nav.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="../static/css/admin/report_list.css">
</head>
<body>
	<main class="wrapper">
		<div class="t1">* 사유에 마우스를 올리면 신고 사유를 확인할 수 있습니다.</div>
		<table>
			<tr>
				<td>유형</td>
				<td>신고자</td>
				<td>피신고자</td>
				<td>사유</td>
			</tr>
			<c:forEach items="${reportVOs}" var="reportVO">
				<tr>
					<td>
						<c:if test="${reportVO.reportType eq 'comment'}">
							댓글
						</c:if>
						<c:if test="${reportVO.reportType eq 'post'}">
							게시물
						</c:if>
						<c:if test="${reportVO.reportType eq 'user'}">
							사용자
						</c:if>
					</td>
					<td>${reportVO.fromUserName}</td>
					<td>${reportVO.toUserName}</td>
					<td>
						<span class="tooltip">
							- <span class="tooltip-text">${reportVO.reason}</span>
						</span>
					</td>
				</tr>
			</c:forEach>
		</table>
	</main>
	
	<!-- 우측 고정바 -->
	<div id="profile_box">
		<img id="admin_img" alt="profile" src="/gram/static/icons/user.jpg">
		<div id="user">
			<h1 id="admin_username">admin</h1>
			<div id="nickname">관리자</div>
		</div>
		<div id="chg">전환</div>
		
		<h1 id="admin_menu">관리자 메뉴 바로가기</h1>
		<div id="menu_contents">
			<!-- 광고 -->
			<div class="menu_title">
				<img class="s32" id="ad" alt="ad" src="/gram/static/icons/ad.png">
				<span class="fw menu_title_title"><a href="/gram/admin/home">광고</a></span>
			</div>
			<div class="detail"><a href="/gram/admin/ad/create">· 광고 등록하기</a></div>
			
			<!-- 멤버십 -->
			<div class="menu_title">
				<img class="s32" id="membership" alt="membership" src="/gram/static/icons/membership.png">
				<span class="fw menu_title_title"><a href="/gram/admin/membership">멤버십</a></span>
			</div>
			<div class="detail" id="membership_insert"><a>· 멤버십 등록하기</a></div>
			
			<!-- 결제 -->
			<div class="menu_title">
				<img class="s32" id="membership" alt="membership" src="/gram/static/icons/payment.png">
				<span class="fw menu_title_title"><a href="/gram/admin/payments">결제</a></span>
			</div>
			<div class="detail"><a href="/gram/admin/payments/refunds">· 환불 처리하기</a></div>
		</div>
	</div>
	
	<!-- 우측 고정바 js -->
	<script type="text/javascript">
		var popupWidth = 500;
		var popupHeight = 350;
		
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);

		$("#membership_insert").click(function(){
			window.open('/gram/admin/membership/create', '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		});
	</script>
</body>
</html>