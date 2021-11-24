<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>환불</h1>
	<c:if test="${empty refundVOs}">
		<div>환불 가능한 내역이 없습니다.</div>
	</c:if>
	
	<c:if test="${not empty refundVOs}">
		<c:forEach items="${refundVOs}" var="refundVO">
			${refundVO.paymentsDate} ${refundVO.paymentsTime}
		</c:forEach>
	</c:if>
</body>
</html>