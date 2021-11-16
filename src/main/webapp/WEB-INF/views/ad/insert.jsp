<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Ad Insert</h1>
	<form:form modelAttribute="adVO" enctype="multipart/form-data">
		<form:textarea path="adContents"/>
		<input type="file" name="file">
		<form:input path="adURL"/>
	</form:form>
</body>
</html>