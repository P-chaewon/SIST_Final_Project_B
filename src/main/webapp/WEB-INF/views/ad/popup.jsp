<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/popup.css">
</head>
<body>
	<h4 id="popup_title">지금 멤버십에 가입하고 광고를 제거해보세요!</h4>
	
	<div class="img_div">
		<a href="#"><img id="popup_img" alt="${adVO.adFile.oriName}" src="${pageContext.request.contextPath}/static/upload/ad/${adVO.adFile.fileName}"></a>
	</div>
	
	<div id="popup_contents">
		${adVO.adContents}
	</div>
</body>

<script type="text/javascript">
	$("#popup_title").click(function(){
		self.close();
		opener.location.href = "/gram/membership/list";
	});
	
	$("#popup_img").click(function(){
		self.close();
		var win = window.open("${adVO.adURL}");
	});
</script>

</html>