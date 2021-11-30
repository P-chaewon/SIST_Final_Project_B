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
		<c:forEach items="${adVOs}" var="adVO">
		<div class="contents_block">
		<table>
			<tr>
				<td height="60px" class="profile_td">
					<img class="profile_img" alt="profile" src="../static/icons/user.jpg">
					<span class="profile_id">admin</span>
					<img class="more" alt="more" src="../static/icons/more.png" data-adNum="${adVO.adNum}">
				</td>
			</tr>
			<tr>
				<!-- 사진 -->
				<td height="614px">
					<img class="image" alt="${adVO.adFile.oriName}" src="../static/upload/ad/${adVO.adFile.fileName}">
				</td>
			</tr>
			<tr class="url_tr">
				<td height="45px" class="url_td">
					<span class="url">URL: ${adVO.adURL}</span>
				</td>
			</tr>
			<tr class="date_tr">
				<td class="date_td" height="20px">
					<span class="date">${adVO.adDate}</span>
				</td>
			</tr>
		</table>
		</div>
	</c:forEach>
	</main>

	<div class="modal">
		<div class="modal_content">
			<button type="button" id="delete">
				<h1>삭제</h1>
			</button>
			<button type="button" id="cancel">취소</button>
		</div>
	</div>

	<div class="modal2">
		<div class="modal_content2">
			<div id="d1">
				<span class="c">
					<h1 id="d1_t1">게시물을 삭제할까요?</h1> 
					<span id="d1_t2">이 게시물을 삭제하시겠어요?</span>
				</span>
			</div>
			<div id="d2">
				<h1 class="c" id="d2_del">삭제</h1>
			</div>
			<div id="d3">
				<span class="c" id="d3_can">취소</span>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../static/js/ad/list.js"></script>

<%-- 	<main class="wrapper">
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
					<td><a href="./ad/select?adNum=${adVO.adNum}">${adVO.adNum}</a></td>
					<td>${adVO.adContents}</td>
					<td>${adVO.adFile.oriName}</td>
					<td>${adVO.adDate}</td>
					<td>${adVO.adURL}</td>
				</tr>
			</c:forEach>
		</table>
	</main> --%>
	
</body>
</html>