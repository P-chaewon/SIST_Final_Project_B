<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="../static/css/membership/refund.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
		<h1 class="title">환불 요청</h1>
		<hr>
		<c:if test="${empty refundVOs}">
			<div>환불 가능한 내역이 없습니다.</div>
		</c:if>
		
		<c:if test="${not empty refundVOs}">
			<table>
				<tr>
					<td>결제일</td>
					<td>승인번호</td>
					<td>결제금액</td>
					<td>선택</td>
				</tr>
				<c:forEach items="${refundVOs}" var="refundVO">
					<tr>
						<td>${refundVO.paymentsDate} ${refundVO.paymentsTime}</td>
						<td>${refundVO.applyNum}</td>
						<td>${refundVO.amount}</td>
						<td><input type="radio" name="ck" class="check" value="${refundVO.merchant_uid}"></td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="b">
				<button id="cancel">취소</button>
				<button id="next">다음</button>
			</div>
		</c:if>
	</main>
	<script type="text/javascript" src="../static/js/membership/refund.js"></script>
</body>
</html>