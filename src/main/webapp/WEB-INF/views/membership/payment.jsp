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
<link rel="stylesheet" type="text/css" href="../static/css/membership/payment.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<main class="wrapper">
		<h1 id="title">결제하기</h1>
		<hr>
		
		<h1 id="membershipName">${membershipVO.membershipName}</h1>
		<div id="membershipAmount">${membershipVO.membershipAmount}원</div>
		
		<table>
			<tr>
				<td class="t">수량</td>
				<td class="c">1개</td>
			</tr>
			<tr>
				<td class="t">할인금액</td>
				<td class="c">0원</td>
			</tr>
			<tr>
				<td class="t">할인적용금액</td>
				<td class="c">${membershipVO.membershipAmount}원</td>
			</tr>
		</table>
		<hr>
		
		<h1 id="buyerInfo">구매자 정보</h1>
		<div class="info">
			<div>구매자 이름</div>
			<input type="text" class="inp" id="name">
		</div>
		<div class="info">
			<div>연락처</div>
			<input type="text" class="inp" id="tel1"><span class="bar">-</span><input type="text" class="inp" id="tel2"><span class="bar">-</span><input type="text" class="inp" id="tel3">
		</div>
		<div class="info">
			<div>이메일</div>
			<input type="email" class="inp" id="email">
		</div>
		
		<input type="hidden" id="m1" value="${merchant_uid}">
		<input type="hidden" id="m2" value="${membershipVO.membershipName}">
		<input type="hidden" id="m3" value="${membershipVO.membershipAmount}">
		<input type="hidden" id="m4" value="${membershipVO.membershipNum}">
		<input type="hidden" id="m5" value="${userNum}">
		
		<div class="b">
			<a href="./list"><button id="cancel">취소하기</button></a>
			<button id="btn" class="payment">결제하기</button>
		</div>
	</main>
	
	<script type="text/javascript" src="../static/js/membership/payment.js"></script>
</body>
</html>