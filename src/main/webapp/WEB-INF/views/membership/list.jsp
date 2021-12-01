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
<link rel="stylesheet" type="text/css" href="../static/css/membership/list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
	<h1 class="title">멤버십 가입</h1>
	<hr>
		<table>
			<tr>
				<td>종류</td>
				<td>금액</td>
				<td>선택</td>
			</tr>
			<c:forEach items="${membershipVOs}" var="membershipVO">
				<tr>
					<td>${membershipVO.membershipName}</td>
					<td>${membershipVO.membershipAmount}원</td>
					<td><input type="radio" name="ck" class="ck" data-membership-num="${membershipVO.membershipNum}"></td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="b">
			<a href="../"><button id="cancel">취소하기</button></a>
			<button id="next_btn" class="next">선택완료</button></a>
		</div>
	</main>
	
	<script type="text/javascript">
		let num = -1;
		
		$(".ck").click(function(){
			num = (this).getAttribute("data-membership-num");
		});
		
		$("#next_btn").click(function(){
			if (num < 0) {
				alert("멤버십을 선택하세요.");
			} else {
				location.href = "./payment?membershipNum="+num;
			}
		});
	</script>
</body>
</html>