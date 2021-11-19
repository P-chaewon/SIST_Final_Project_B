<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> index </title>

<c:import url="temp/head.jsp"></c:import>

<style>
	img {width: 20px; height: 20px;}
</style>

</head>
<body>

	<h1>index page</h1>
	<div>
		<p> 안녕하세요! </p>
	</div>
	<br>
	<textarea rows="5" cols="10"> </textarea>
	<a href="./account/logout">로그아웃</a>
	<a href="./account/edit">수정하기</a>

	
</body>
</html>