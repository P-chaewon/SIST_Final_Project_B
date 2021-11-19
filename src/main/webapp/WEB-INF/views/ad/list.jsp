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
<link rel="stylesheet" type="text/css" href="../static/css/ad/list.css">
</head>
<body>
	<main class="wrapper">
		<table>
			<tr>
				<td>Num</td>
				<td>Contents</td>
				<td>FileName</td>
				<td>Date</td>
				<td>URL</td>
			</tr>
			<c:forEach items="${adVOs}" var="adVO">
				<tr>
					<td><a href="./select?adNum=${adVO.adNum}">${adVO.adNum}</a></td>
					<td>${adVO.adContents}</td>
					<td>${adVO.adFile.oriName}</td>
					<td>${adVO.adDate}</td>
					<td>${adVO.adURL}</td>
				</tr>
			</c:forEach>
		</table>
	</main>
	
</body>
</html>