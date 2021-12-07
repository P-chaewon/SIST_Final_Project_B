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
<link rel="stylesheet" href="../../static/css/admin/refund.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
		<h1 class="title">환불 요청</h1>
		<hr>
		<form id="frm" action="./refunds" method="post">
			<table>
				<colgroup>
					<col style="width: 15%">
					<col style="width: 75%">
					<col style="width: 10%">
				</colgroup>
				
				<tr>
					<td>결제번호</td>
					<td>환불사유</td>
					<td>선택</td>
				</tr>
				
				<c:if test="${empty refundsVOs}">
					<tr>
						<td>-</td>
						<td>환불 요청 건이 없습니다.</td>
						<td></td>
					</tr>
				</c:if>
				
				<c:if test="${not empty refundsVOs}">
					<c:forEach items="${refundsVOs}" var="refundsVO">
					<tr class="t" data-merchant-uid="${refundsVO.merchant_uid}">
						<td class="uid" data-merchant-uid="${refundsVO.merchant_uid}">
								${refundsVO.merchant_uid}
						</td>
						<td>${refundsVO.reason}</td>
						<td><input type="checkbox" name="merchant_uid" class="ck_box" value="${refundsVO.merchant_uid}"></td>
					</tr>
					<tr>
						<td colspan="3" class="contents" id="c_${refundsVO.merchant_uid}"></td>
					</tr>
					</c:forEach>
				</c:if>
			</table>
		</form>
			<div class="b">
				<button type="button" id="done">환불완료</button>
			</div>
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
			
			<!-- 계정 -->
			<div class="menu_title">
				<img class="s32" id="membership" alt="report" src="/gram/static/icons/block.png">
				<span class="fw menu_title_title"><a href="/gram/admin/report">신고</a></span>
			</div>
			<div class="detail"><a href="/gram/admin/suspend">· 정지 해제하기</a></div>
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
	
	<script type="text/javascript" src="../../static/js/admin/refund.js"></script>
</body>
</html>