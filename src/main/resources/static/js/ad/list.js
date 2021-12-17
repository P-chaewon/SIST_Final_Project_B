/**
 * select.js
 */
 
var adNum = 0;
 
$(".more").click(function(){
	$(".modal").fadeIn();
	// 스크롤 제한 on
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	adNum = (this).getAttribute('data-adNum');
});

$("#cancel").click(function(){
	$(".modal").fadeOut();
	// 스크롤 제한 off
	$('html, body').css({'overflow': 'initial', 'height': 'auto'});
});

$("#delete").click(function(){
	$(".modal2").fadeIn();
});

$("#d2").click(function(){
	location.href = "./ad/delete?adNum="+adNum;
});

$("#d3").click(function(){
	$(".modal").fadeOut();
	$(".modal2").fadeOut();
	// 스크롤 제한 off
	$('html, body').css({'overflow': 'initial', 'height': 'auto'});
});

