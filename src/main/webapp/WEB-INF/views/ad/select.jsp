<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html id="h">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

		<div class="modal">
			<div class="modal_content">
				<button type="button" id="delete" data-adNum="${adVO.adNum}"><h1>삭제</h1></button>
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
				<div id="d2" data-adNum="${adVO.adNum}"><h1 class="c" id="d2_del">삭제</h1></div>
				<div id="d3"><span class="c" id="d3_can">취소</span></div>
			</div>
		</div>

	</main>
	<script type="text/javascript" src="../static/js/ad/select.js"></script>
</body>
</html>