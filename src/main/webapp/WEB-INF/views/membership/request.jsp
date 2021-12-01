<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="../static/css/membership/request.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
		<h1 class="title">환불 요청</h1>
		<hr>
		<div class="d">환불 사유를 입력해주세요.</div>
		<div class="d">
			<form action="./request" method="post" id="frm">
				<input type="hidden" name="merchant_uid" value="${param.merchant_uid}">
				<textarea rows="" cols="" name="reason"></textarea>
			</form>
		</div>
		<div class="b">
			<button id="before">이전</button>
			<button id="next">제출</button>
		</div>
	</main>
	<script type="text/javascript" src="../static/js/membership/request.js"></script>
</body>
</html>