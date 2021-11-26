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
<link rel="stylesheet" href="../static/css/admin/list.css">
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
					<td>${paymentsVO.userNum}</td>
					<td>${paymentsVO.membershipNum}</td>
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
		<script type="text/javascript" src="../static/js/admin/list.js"></script>
	</main>
</body>
</html>