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
		<table>
			<tr>
				<td>membershipNum</td>
				<td>membershipName</td>
				<td>membershipAmount</td>
			</tr>
			<c:forEach items="${membershipVOs}" var="membershipVO">
				<tr>
					<td>${membershipVO.membershipNum}</td>
					<td>${membershipVO.membershipName}</td>
					<td>${membershipVO.membershipAmount}</td>
					<td><input type="radio" name="ck" class="ck" data-membership-num="${membershipVO.membershipNum}"></td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" id="next_btn">다음</button>
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