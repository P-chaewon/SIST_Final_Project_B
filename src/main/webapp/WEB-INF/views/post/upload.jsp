<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/post/upload.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<c:import url="../temp/nav.jsp"></c:import>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
	$("#upload").attr("src", "${pageContext.request.contextPath}/static/icons/add-click.png");
</script>
	<main class="wrapper">
		<form class="frm" action="./upload" method="post" enctype="multipart/form-data" >
			<table class="tbl">
				<tr class="tbl_tr">
					<td class="title" style="height:40px;" colspan="2">
						<div class="add"><h1>새 게시물 만들기</h1></div>
						<div class="write">공유하기</div>
					</td>
				</tr>
				<tr>
					<td class="img_td" style="width:600px; " rowspan="2">
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
						<!-- <textarea path="adContents" cssClass="contents" placeholder="문구 입력..."/> -->
						<textarea name="contents" class="contents" rows="" cols="" placeholder="문구입력..."></textarea>
					</td>
				</tr>
				<tr>
					<td class="tbl_td">
						<input type="text" name="adURL" placeholder="URL 추가" Class="url"/>
					</td>
				</tr>
			</table>
		</form>
	</main>

<script type="text/javascript" src="../static/js/ad/insert.js"></script>
</body>
</html>>