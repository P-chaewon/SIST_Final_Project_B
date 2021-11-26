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
						<td><input type="checkbox" name="merchant_uid" value="${refundsVO.merchant_uid}"></td>
					</tr>
					<tr>
						<td colspan="3" class="contents" id="c_${refundsVO.merchant_uid}"></td>
					</tr>
					</c:forEach>
				</c:if>
			</table>
		</form>
			<div class="b">
				<button id="done">환불완료</button>
			</div>
	</main>
	<script type="text/javascript" src="../../static/js/admin/refund.js"></script>
</body>
</html>