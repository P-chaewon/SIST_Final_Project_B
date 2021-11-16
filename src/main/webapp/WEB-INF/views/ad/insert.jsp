<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
</head>
<body>
	<h1>Insert Page</h1>
	<form:form modelAttribute="adVO" enctype="multipart/form-data">
		<form:textarea path="adContents"/>
		<input type="file">
		<form:input path="adURL"/>
		
		<button type="submit">Write</button>
	</form:form>
</body>
</html>