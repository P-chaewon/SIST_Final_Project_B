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
<link rel="stylesheet" type="text/css" href="../static/css/membership/info.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
	<h1 class="title">결제 내역</h1>
	<div class="t1">* 환불 요청은 결제 후 24시간 이내에만 가능합니다.</div>
	<hr>
	<table>
		<tr>
			<td>멤버십</td>
			<td>결제일</td>
			<td>승인번호</td>
			<td>결제금액</td>
			<td>결제방법</td>
			<td>상태</td>
		</tr>
		<c:forEach items="${paymentsVOs}" var="paymentsVO" varStatus="i">
		<tr>
			<td id="td${i.index}" class="td">${paymentsVO.membershipNum}</td>
			<td>${paymentsVO.paymentsDate} ${paymentsVO.paymentsTime}</td>
			<td>${paymentsVO.applyNum}</td>
			<td>${paymentsVO.amount}</td>
			<td>${paymentsVO.method}</td>
			<td>
				<c:if test="${paymentsVO.paymentsCk eq 'y'}">
					결제완료
				</c:if>
				<c:if test="${paymentsVO.paymentsCk eq 'n'}">
					결제실패
				</c:if>
				<c:if test="${paymentsVO.paymentsCk eq 'w'}">
					환불대기
				</c:if>
				<c:if test="${paymentsVO.paymentsCk eq 'd'}">
					환불완료
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="b">
		<button id="refund">환불요청</button>
	</div>
	
	</main>
	<script type="text/javascript" src="../static/js/membership/info.js"></script>
</body>
</html>