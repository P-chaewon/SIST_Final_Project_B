<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../../static/css/ad/insert.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<c:import url="../temp/admin_nav.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<main class="wrapper">
		<form:form modelAttribute="adVO" enctype="multipart/form-data" cssClass="frm">
			<table class="tbl">
				<tr class="tbl_tr">
					<td class="tbl_td title" style="height:40px;" colspan="2">
						<div class="add"><h1>새 게시물 만들기</h1></div>
						<div class="write">공유하기</div>
					</td>
				</tr>
				<tr class="tbl_tr">
					<td class="tbl_td img_td" style="width:600px;" rowspan="2">
						<div id="img_icon">
							<div id="default_img">
								<img alt="gallery-2" src="${pageContext.request.contextPath}/static/icons/gallery-2.png">
								<div>사진을 선택하세요</div>
							</div>
							<img id="thumbnail">
						</div>
						<input type="file" accept="image/*" name="file" class="img_file" onchange='openFile(event)' hidden="hidden">
					</td>
					<td class="tbl_td" style="height:400px;">
						<form:textarea path="adContents" cssClass="contents" placeholder="문구 입력..."/>
					</td>
				</tr>
				<tr class="tbl_tr">
					<td class="tbl_td">
						<form:input path="adURL" placeholder="URL 추가" cssClass="url"/>
					</td>
				</tr>
			</table>
		</form:form>
	</main>
<script type="text/javascript" src="../../static/js/ad/insert.js"></script>
</body>
</html>