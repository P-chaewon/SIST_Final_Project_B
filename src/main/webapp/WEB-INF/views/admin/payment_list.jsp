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
<link rel="stylesheet" href="../static/css/admin/payment_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
		<div class="b">
			<span class="title">결제내역</span>
			<form action="./payments" id="frm">
				<select name="status" id="status">
					<option class="s" value="default">상태</option>
					<option class="s" value="yes">결제완료</option>
					<option class="s" value="no">결제실패</option>
					<option class="s" value="wait">환불대기</option>
					<option class="s" value="done">환불완료</option>
				</select>
			</form>
		</div>
		<hr>
		<table>
			<tr>
				<td>사용자</td>
				<td>멤버십</td>
				<td>결제시각</td>
				<td>승인번호</td>
				<td>결제수단</td>
				<td>상태</td>
			</tr>
			<c:forEach items="${paymentsVOs}" var="paymentsVO">
				<tr>
					<td>${paymentsVO.userVO.username}</td>
					<td>${paymentsVO.membershipVO.membershipName}</td>
					<td>${paymentsVO.paymentsDate} ${paymentsVO.paymentsTime}</td>
					<td>
						<c:if test="${paymentsVO.paymentsCk eq 'n'}">
							<span class="tooltip">
								- <span class="tooltip-text">${paymentsVO.applyNum}</span>
							</span>
						</c:if>
						<c:if test="${paymentsVO.paymentsCk ne 'n'}">
							${paymentsVO.applyNum}
						</c:if>
					</td>
					<td>${paymentsVO.method}</td>
					<c:if test="${paymentsVO.paymentsCk eq 'y'}">
						<td>결제완료</td>
					</c:if>
					<c:if test="${paymentsVO.paymentsCk eq 'w'}">
						<td>환불대기</td>
					</c:if>
					<c:if test="${paymentsVO.paymentsCk eq 'n'}">
						<td>결제실패</td>
					</c:if>
					<c:if test="${paymentsVO.paymentsCk eq 'd'}">
						<td>환불완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<input id="st" type="hidden" value="${pager.status}">	
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
	
	<script type="text/javascript" src="../static/js/admin/list.js"></script>
	
</body>
</html>