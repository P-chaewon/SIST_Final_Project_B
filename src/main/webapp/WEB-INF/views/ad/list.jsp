<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
</head>
<body>
	<h1>Ad List</h1>
	
	<main>
	
	</main>
	
	<table>
		<tr>
			<td>Num</td>
			<td>Contents</td>
			<td>Date</td>
			<td>FileName</td>
			<td>URL</td>
		</tr>
		<c:forEach items="${adVOs}" var="adVO">
			<td>${adVO.adNum}</td>
			<td>${adVO.adContents}</td>
			<td>${adVO.adDate}</td>
			<td>${adVO.adFileName}</td>
			<td>${adVO.adURL}</td>
		</c:forEach>
	</table>
</body>
</html>