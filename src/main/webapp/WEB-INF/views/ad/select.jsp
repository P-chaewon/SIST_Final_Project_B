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
<link rel="stylesheet" type="text/css" href="../static/css/ad/select.css">
</head>
<body>
	<main class="wrapper">
		<table>
			<tr>
				<td height="60px" id="profile_td">
					<img id="profile_img" alt="profile" src="../static/icons/user.jpg">
					<span id="profile_id">admin</span>
					<img id="more" alt="more" src="../static/icons/more.png">
				</td>
			</tr>
			<tr>
				<td height="614px">${adVO.adFileName}</td>
			</tr>
			<tr id="url_tr">
				<td height="45px" id="url_td">
					<span id="url">URL: ${adVO.adURL}</span>
				</td>
			</tr>
			<tr id="date_tr">
				<td id="date_td" height="20px">
					<span id="date">${adVO.adDate}</span>
				</td>
			</tr>
		</table>
	</main>
</body>
</html>