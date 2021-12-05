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
<link rel="stylesheet" type="text/css" href="../static/css/ad/list.css">
</head>
<body>
	<main class="wrapper">
		<c:forEach items="${adVOs}" var="adVO">
		<div class="contents_block">
		<table>
			<tr>
				<td height="60px" class="profile_td">
					<img class="profile_img" alt="profile" src="../static/icons/user.jpg">
					<span class="profile_id">admin</span>
					<img class="more" alt="more" src="../static/icons/more.png" data-adNum="${adVO.adNum}">
				</td>
			</tr>
			<tr>
				<!-- 사진 -->
				<td height="614px">
					<img class="image" alt="${adVO.adFile.oriName}" src="../static/upload/ad/${adVO.adFile.fileName}">
				</td>
			</tr>
			<tr class="url_tr">
				<td height="45px" class="url_td">
					<span class="url">URL: ${adVO.adURL}</span>
				</td>
			</tr>
			<tr class="date_tr">
				<td class="date_td" height="20px">
					<span class="date">${adVO.adDate}</span>
				</td>
			</tr>
		</table>
		</div>
	</c:forEach>
	</main>

	<div class="modal">
		<div class="modal_content">
			<button type="button" id="delete">
				<h1>삭제</h1>
			</button>
			<button type="button" id="cancel">취소</button>
		</div>
	</div>

	<div class="modal2">
		<div class="modal_content2">
			<div id="d1">
				<span class="c">
					<h1 id="d1_t1">게시물을 삭제할까요?</h1> 
					<span id="d1_t2">이 게시물을 삭제하시겠어요?</span>
				</span>
			</div>
			<div id="d2">
				<h1 class="c" id="d2_del">삭제</h1>
			</div>
			<div id="d3">
				<span class="c" id="d3_can">취소</span>
			</div>
		</div>
	</div>
	
	
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
				<img class="s32" id="membership" alt="membership" src="/gram/static/icons/block.png">
				<span class="fw menu_title_title">신고</span>
			</div>
			<div class="detail">· 계정 정지하기</div>
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

	<script type="text/javascript" src="../static/js/ad/list.js"></script>	
</body>
</html>