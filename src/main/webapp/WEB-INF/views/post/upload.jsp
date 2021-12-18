<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<c:import url="../temp/nav.jsp"></c:import>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/post/upload.css">
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
					
					<div class="post_profile">
					
							<img class="post_profile_img pic" style="height: 26px; width: 26px; margin-top: 12px; margin-left: 10px;" alt="profile"  src="${pageContext.request.contextPath}/static/icons/user.jpg">
						
							
						<span class="nickname main_nickname point_span"><sec:authentication property="principal.nickname" var="nickname"/>	${nickname}</span>
						
						</div>
	
						<textarea name="contents" class="contents" id="contents" rows="" cols="" placeholder="문구입력..."></textarea>
						
						<div>						
							<div id="result" class="result_txt"><span class="ui_inputLimitCount">0</span>/2,200</div>
							<img class="icon_react" alt="emoticon" style="cursor: pointer;" id="emoticon" src="${pageContext.request.contextPath}/static/icons/emoticon.png">
							
							<div id="icon_contents" style="display: none;">
							<div style="margin-left:5px; margin-bottom:8px; overflow-y: scroll; height: 168px; ">
								<br>
								<span class="emoji">&#128512;</span>
								<span class="emoji">&#128513;</span>
								<span class="emoji">&#128514;</span>
								<span class="emoji">&#128516;</span>
								<span class="emoji">&#128517;</span>
								<span class="emoji">&#128518;</span>
								<span class="emoji">&#128519;</span><br><br>
								<span class="emoji">&#128520;</span>
								<span class="emoji">&#128521;</span>
								<span class="emoji">&#128522;</span>
								<span class="emoji">&#128523;</span>
								<span class="emoji">&#128525;</span>
								<span class="emoji">&#128526;</span>
								<span class="emoji">&#128528;</span><br><br>
								<span class="emoji">&#128529;</span>
								<span class="emoji">&#128531;</span>
								<span class="emoji">&#128533;</span>
								<span class="emoji">&#128536;</span>
								<span class="emoji">&#128539;</span>
								<span class="emoji">&#128540;</span>
								<span class="emoji">&#128541;</span><br><br>
								<span class="emoji">&#128543;</span>
								<span class="emoji">&#128544;</span>
								<span class="emoji">&#128545;</span>
								<span class="emoji">&#128546;</span>
								<span class="emoji">&#128552;</span>
								<span class="emoji">&#128557;</span>
								<span class="emoji">&#128559;</span><br><br>
								<span class="emoji">&#128560;</span>
								<span class="emoji">&#128561;</span>
								<span class="emoji">&#128567;</span>
								<span class="emoji">&#128578;</span>
								<span class="emoji">&#128579;</span>
								<span class="emoji">&#128580;</span>
								<span class="emoji">&#128566;</span><br><br>
								<span class="emoji">&#128591;</span>
								<span class="emoji">&#128170;</span>
								<span class="emoji">&#128074;</span>
								<span class="emoji">&#128075;</span>
								<span class="emoji">&#128077;</span>
								<span class="emoji">&#128078;</span>
								<span class="emoji">&#128079;</span><br><br>
								<span class="emoji">&#128147;</span>
								<span class="emoji">&#128148;</span>
								<span class="emoji">&#128149;</span>
								<span class="emoji">&#128150;</span>
								<span class="emoji">&#128151;</span>
								<span class="emoji">&#128152;</span>
								<span class="emoji">&#128153;</span><br><br>
								<span class="emoji">&#128154;</span>
								<span class="emoji">&#128155;</span>
								<span class="emoji">&#128156;</span>
								<span class="emoji">&#128157;</span>
								<span class="emoji">&#128158;</span>
								<span class="emoji">&#128143;</span>
								<span class="emoji">&#128145;</span><br><br>
								<span class="emoji">&#128054;</span>
								<span class="emoji">&#128057;</span>
								<span class="emoji">&#128059;</span>
								<span class="emoji">&#128060;</span>
								<span class="emoji">&#128047;</span>
								<span class="emoji">&#128048;</span>
								<span class="emoji">&#128049;</span><br><br>
								<span class="emoji">&#128041;</span>
								<span class="emoji">&#128007;</span>
								<span class="emoji">&#128035;</span>
								<span class="emoji">&#128036;</span>
								<span class="emoji">&#128037;</span>
								<span class="emoji">&#128034;</span>
								<span class="emoji">&#128062;</span>
								
							
													
							
							</div>
							
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="tbl_td">
						<textarea class="tag" name="tag" rows="" cols="" placeholder="태그 추가" style="resize: none; color: #007AFF"></textarea>
						
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

$(document).on('click','.emoji', function(){
	var emo = $(this).html();
	$('#contents').append(emo);
	
})

$("#emoticon").click(function() {
	if($("#icon_contents").css('display') == 'none'){
		$('#icon_contents').css({"display": "block"});
	}else{
		$('#icon_contents').css({"display": "none"});
	}
});
</script>
</body>

<footer>
	<div class="footer-entire">
		<div class="footer-set-1">
			<div class="footer-contents">
				<div class="footer-object">
					<div class="object-name">Meta</div>
				</div>
				<div class="footer-object">
					<div class="object-name">소개</div>
				</div>
				<div class="footer-object">
					<div class="object-name">블로그</div>
				</div>
				<div class="footer-object">
					<div class="object-name">채용 정보</div>
				</div>
				<div class="footer-object">
					<div class="object-name">도움말</div>
				</div>
				<div class="footer-object">
					<div class="object-name">API</div>
				</div>
				<div class="footer-object">
					<div class="object-name">개인정보처리방침</div>
				</div>
				<div class="footer-object">
					<div class="object-name">약관</div>
				</div>
				<div class="footer-object">
					<div class="object-name">인기 계정</div>
				</div>
				<div class="footer-object">
					<div class="object-name">해시태그</div>
				</div>
				<div class="footer-object">
					<div class="object-name">위치</div>
				</div>
				<div class="footer-object">
					<div class="object-name">WithUs Lite</div>
				</div>
			</div>
			</div>
			
			<div class="footer-set-2">
				<div class="footer-setting">
					<span class="settings">
						<div class="language">
							<span>한국어</span>
							<div class="select-language-area">
								<span style="display: inline-block; transform: rotate(180deg);">
									<svg aria-label="아래쪽 V자형 아이콘" class="downarrow-icon" color="#8e8e8e" fill="#8e8e8e" height="12" role="img" viewBox="0 0 48 48" width="12">
										<path d="M40 33.5c-.4 0-.8-.1-1.1-.4L24 18.1l-14.9 15c-.6.6-1.5.6-2.1 0s-.6-1.5 0-2.1l16-16c.6-.6 1.5-.6 2.1 0l16 16c.6.6.6 1.5 0 2.1-.3.3-.7.4-1.1.4z"></path>
									</svg>
								</span>
							</div>
						</div>
						<select aria-label="표시 언어 변경" class="language-change">
							<option value="af">Afrikaans</option>
							<option value="cs">Čeština</option>
							<option value="da">Dansk</option>
							<option value="de">Deutsch</option>
							<option value="el">Ελληνικά</option>
							<option value="en">English</option>
							<option value="en-gb">English (UK)</option>
							<option value="es">Español (España)</option>
							<option value="es-la">Español</option>
							<option value="fi">Suomi</option>
							<option value="fr">Français</option>
							<option value="id">Bahasa Indonesia</option>
							<option value="it">Italiano</option>
							<option value="ja">日本語</option>
							<option value="ko">한국어</option>
							<option value="ms">Bahasa Melayu</option>
							<option value="nb">Norsk</option>
							<option value="nl">Nederlands</option>
							<option value="pl">Polski</option>
							<option value="pt-br">Português (Brasil)</option>
							<option value="pt">Português (Portugal)</option>
							<option value="ru">Русский</option>
							<option value="sv">Svenska</option>
							<option value="th">ภาษาไทย</option>
							<option value="tl">Filipino</option>
							<option value="tr">Türkçe</option>
							<option value="zh-cn">中文(简体)</option>
							<option value="zh-tw">中文(台灣)</option>
							<option value="bn">বাংলা</option>
							<option value="gu">ગુજરાતી</option>
							<option value="hi">हिन्दी</option>
							<option value="hr">Hrvatski</option>
							<option value="hu">Magyar</option>
							<option value="kn">ಕನ್ನಡ</option>
							<option value="ml">മലയാളം</option>
							<option value="mr">मराठी</option>
							<option value="ne">नेपाली</option>
							<option value="pa">ਪੰਜਾਬੀ</option>
							<option value="si">සිංහල</option>
							<option value="sk">Slovenčina</option>
							<option value="ta">தமிழ்</option>
							<option value="te">తెలుగు</option>
							<option value="vi">Tiếng Việt</option>
							<option value="zh-hk">中文(香港)</option>
							<option value="bg">Български</option>
							<option value="fr-ca">Français (Canada)</option>
							<option value="ro">Română</option>
							<option value="sr">Српски</option>
							<option value="uk">Українська</option>
						</select>
					</span>
				</div>
				<div class="sns-company">
					<div class="company-info">© 2021 WithUs from Meta</div>
				</div>
			</div>
		</div>
</footer>
</html>