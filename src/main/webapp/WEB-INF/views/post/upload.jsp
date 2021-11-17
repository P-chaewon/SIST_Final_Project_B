<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/head.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/nav.jsp"></c:import>



<script type="text/javascript">
	$("#post_upload").attr("src", "${pageContext.request.contextPath}/static/icons/add-click.png");
</script>
</body>
</html>