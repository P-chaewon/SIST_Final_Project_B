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
							<!-- multi file -->
							<div class="multi_files" style="display: none;">
							<div style="position: absolute; right: 12px; bottom: 6px; background-color: black; opacity: 0.8; width: 32px; height: 32px; border-radius: 50%; text-align: center;">
								<img id="multi_file" alt="multi_file" src="${pageContext.request.contextPath}/static/icons/gallery.png">
							</div>
							</div>
						<input type="file" accept="image/*" name="file" class="img_file" onchange='openFile(event)' hidden="hidden">
					</td>
					<td class="tbl_td" style="height:300px;">
						<textarea name="contents" class="contents" rows="" cols="" placeholder="문구입력..."></textarea>
						
						<div>						
							<div id="result" class="result_txt"><span class="ui_inputLimitCount">0</span>/2,200</div>
							<img class="icon_react" alt="emoticon" src="${pageContext.request.contextPath}/static/icons/emoticon.png">
						</div>
					</td>
				</tr>
				<tr>
					<td class="tbl_td">
						<input type="text" name="tag" placeholder="태그 추가" Class="tag"/>
					</td>
				</tr>
			</table>
		</form>
	</main>


<script type="text/javascript" src="../static/js/post/upload.js"></script>

<script type="text/javascript">
$(document).ready(function() {

    $('.contents').on('keyup', function() {
        $('#result').html($(this).val().length+ '/ 2,200');
        if($(this).val().length > 2200) {
            $(this).val($(this).val().substring(0, 2200));
            $('#result').html("2,200 / 2,200");
        }
    });
});

</script>
</body>
</html>