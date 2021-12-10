<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../static/css/admin/membership_update.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
		<h1 class="title">* 멤버십 수정</h1>
		<hr>
		<div class="d">
			<form action="./update" method="post" id="frm">
				<input type="hidden" value="${param.membershipNum}" id="membershipNum">
				<div class="mb">
					<span class="label">종류</span>
					<input name="membershipName" id="membershipName" type="text" placeholder="사용자에게 보여질 멤버십의 이름을 입력하세요." value="${membershipVO.membershipName}">
				</div>
				<div class="mb">
					<span class="label">금액</span>
					<input name="membershipAmount" id="membershipAmount" type="text" placeholder="원 단위를 제외한 숫자만 입력하세요." value="${membershipVO.membershipAmount}">
				</div>
			</form>
		</div>
		<div class="b">
			<button id="cancel">취소</button>
			<button id="next">수정</button>
		</div>
	</main>
	<script type="text/javascript" src="../../static/js/admin/membership_update.js"></script>
</body>
</html>