/**
 * select.js
 */
 
$("#more").click(function(){
	$(".modal").fadeIn();
	// 스크롤 제한 on
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
});

$("#cancel").click(function(){
	$(".modal").fadeOut();
	// 스크롤 제한 off
	$('html, body').css({'overflow': 'auto', 'height': 'auto'});
});

$("#delete").click(function(){
	$(".modal2").fadeIn();
});

$("#d2").click(function(){
	adNum = (this).getAttribute("data-adNum");
	location.href = "./delete?adNum="+adNum;
});

$("#d3").click(function(){
	$(".modal").fadeOut();
	$(".modal2").fadeOut();
	// 스크롤 제한 off
	$('html, body').css({'overflow': 'auto', 'height': 'auto'});
});

