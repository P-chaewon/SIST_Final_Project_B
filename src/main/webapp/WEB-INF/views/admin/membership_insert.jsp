<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../static/css/admin/membership_insert.css">
</head>
<body>
	<main class="wrapper">
		<h1 class="title">* 멤버십 등록</h1>
		<hr>
		<div class="d">
			<form action="./create" method="post" id="frm">
				<div class="mb">
					<span class="label">종류</span>
					<input name="membershipName" id="membershipName" type="text" placeholder="사용자에게 보여질 멤버십의 이름을 입력하세요.">
				</div>
				<div class="mb">
					<span class="label">금액</span>
					<input name="membershipAmount" id="membershipAmount" type="text" placeholder="원 단위를 제외한 숫자만 입력하세요.">
				</div>
			</form>
		</div>
		<div class="b">
			<button id="cancel">취소</button>
			<button id="next">등록</button>
		</div>
	</main>
	
	<script type="text/javascript" src="../../static/js/admin/membership_insert.js"></script>
</body>
</html>