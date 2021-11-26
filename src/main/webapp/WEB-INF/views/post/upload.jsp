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
							<div class="multi_files" >
							<div id="multi_files" style="display:none;">
								<img id="multi_file" alt="multi_file" src="${pageContext.request.contextPath}/static/icons/gallery.png">
							</div>
							
							<div class="add_file_wrap" style="display:none; margin-top: 10px; margin-left:65px; height: 80px; width:400px; margin-bottom:10px; background-color: black; opacity: 0.8; border-radius: 10px;">	
							<div class="multipartFile_wrap" style="">
									<input type="file" id="img_file1" onchange="openFile(event)" class="img_file" name="files" data-num="1" multiple="multiple">
								<label for="img_file1"></label>
							</div>
									
							<ul class="add_img" style="margin-left: 5px;">
								<!-- #add_file change 이벤트 추가 li 영역 -->
							</ul>
					</div>		
			
							
							</div>
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
						<textarea class="tag" name="tag" rows="" cols="" placeholder="태그 추가" style="resize: none;"></textarea>
						
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


$("#default_img").click(function(){
	// file 클릭 이벤트
	$(".img_file").click();
});


var openFile = function(event) {
	var input = event.target;
	var reader = new FileReader();

	reader.onload = function() {
		var dataURL = reader.result;
		var output = document.getElementById('thumbnail');
		output.src = dataURL;
	};
	reader.readAsDataURL(input.files[0]);
};

$(".img_file").change(function(){
	if ($(this).val() == "") {
		$("#default_img").show();
		$("#thumbnail").hide();
	}
	else{
		$("#thumbnail").fadeIn(150);
		$("#thumbnail").css({"width":"474px", "height":"459px", "margin-top":"-1px"});
		$("#default_img").hide();
		$("#multi_files").show();
	}
});

$("#multi_files").click(function() {
	if($(".add_file_wrap").css('display') == 'none'){
		$('.add_file_wrap').show();
		$(this).css({"filter": "invert(100%)"});
	}else{
		$('.add_file_wrap').hide();
		$(this).css({"filter": "invert(0%)"});
	}
});

$('.add_file_wrap').on('click', 'li', function(){
	var src = $(this).children('img').attr("src");
	$("#thumbnail").attr("src", src);

});



$('.multipartFile_wrap').on('change', '.img_file', function(){
	const multipartFile_wrap = $(this).parent();
	const ul = multipartFile_wrap.siblings('ul');

	const label = $(this).siblings('label');
	label.addClass('hidden')
	
	if (ul.find('li').length < 4){
		addInput(multipartFile_wrap, $(this).data('num'));		
	}
	addLi(ul);
	
	setNum(multipartFile_wrap, ul);
	
	let lastLi = ul.find('li').last();
	readURL(this, lastLi.find('img'));	
	
});

function addInput(multipartFile_wrap, finalNum){
	finalNum++
	let Html
		="<input type='file' id='img_file"+finalNum+"' class='img_file' name='files' data-num='"+finalNum+"'>"
		+"<label for='img_file"+finalNum+"'></label>"
	multipartFile_wrap.append(Html);
}

function addLi(ul){
	let Html
		="<li>"
		+"<div class='dim_div'><span class='num hide'></span></div>"
		+"<img id='select_img' src=''>"
		+"<div class='btn_delete'></div>"
		+"</li>";	
	ul.append(Html);
}

function setNum(multipartFile_wrap, ul){
	let cnt = 1;
	multipartFile_wrap.find('.img_file').each(function(){
		$(this).data('num', cnt);
		$(this).attr('id', 'img_file' + cnt);
		$(this).next().attr('for', 'img_file' + cnt);
		cnt++;
		console.log($(this).data('num'));
	});
	console.log("==============");
	cnt = 1;
	ul.find('.num').each(function(){
		$(this).html(cnt++);
	});
}

function readURL(input, img_tag) {
	if (input.files && input.files[0]) {
		
		var reader = new FileReader();			
		reader.onload = function(e) {
			img_tag.attr('src', e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
	}		
}		

$('.add_file_wrap').on('click', '.btn_delete', function(e){
	  e.stopPropagation(); /* 부모 li 이벤트 방지 */
	  
	const ul = $(this).parents('ul');
	const li = $(this).parent('li');
	const multipartFile_wrap = ul.siblings('.multipartFile_wrap');
	
	var prev = $(this).parent().prev().children('img').attr("src");/* 삭제시 img 앞에 있는걸로 */
		
		$("#thumbnail").attr("src", prev);

	let delNum = li.find('.num').html();
	multipartFile_wrap.find('input').each(function(){
		if($(this).data('num') == delNum){
			$(this).next().remove();
			$(this).remove();
			return;
		}
	})
	
	li.remove();
	setNum(multipartFile_wrap, ul);
	
	let lastNum = Number(multipartFile_wrap.children('input').last().data('num'));
	if(ul.find('li').length == 4){
		addInput(multipartFile_wrap, lastNum);			
	}	
});

$(".write").click(function(){
	$(".frm").submit();
});


</script>
</body>
</html>