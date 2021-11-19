<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user.css" type="text/css">
</head>
<article class="PVkFi">
	<div class="C_9MP">
	<div class="LqNQc">
	<div class="M-jxE">
	<button class="IalUJ " title="프로필 사진 추가">
	<img alt="프로필 사진 추가" class="be6sR" src="">
	</button>
	<div>
	<form enctype="multipart/form-data" method="POST" role="presentation">
	<input accept="image/jpeg,image/png" class="tb_sK" type="file">
	</form>
	</div>
	</div>
	</div>
	<div class="XX1Wc">
	<h1 class="kHYQv " title="">${userVO.username}</h1>
	<button class="sqdOP yWX7d    y3zKF     " type="button">프로필 사진 바꾸기</button>
	<div>
	<form enctype="multipart/form-data" method="POST" role="presentation">
	<input accept="image/jpeg,image/png" class="tb_sK" type="file">
	</form>
	</div>
	</div>
	</div>
	<form class="kWXsT" method="POST">
	<div class="eE-OA">
	<aside class="sxIVS  ">
	<label for="pepName">닉네임</label>
	</aside>
	<div class="ada5V">
	<div class="               AC7dP        Igw0E     IwRSH      eGOV_         _4EzTm" style="width: 100%; max-width: 355px;">
	<input aria-required="false" id="pepName" placeholder="이름" type="text" class="JLJ-B zyHYP" value="${userVO.nickname}">
	<div class="             qF0y9          Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3 aGBdT" style="width: 100%; max-width: 355px;">
	<div class="             qF0y9          Igw0E     IwRSH      eGOV_         _4EzTm      MGdpg">
	<div class="_7UhW9  PIoXz       MMzan   _0PwGv         uL8Hv         ">사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="eE-OA">
	<aside class="sxIVS  ">
	<label for="pepUsername">사용자 이름</label>
	</aside>
	<div class="ada5V">
	<div class="               AC7dP        Igw0E     IwRSH      eGOV_         _4EzTm" style="width: 100%; max-width: 355px;">
	<input aria-required="true" id="pepUsername" placeholder="사용자 이름" type="text" class="JLJ-B zyHYP" value="${userVO.username}">
	<div class="             qF0y9          Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3   aGBdT" style="width: 100%; max-width: 355px;">
	<div class="_7UhW9  PIoXz       MMzan   _0PwGv         uL8Hv         ">
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="eE-OA">
	<aside class="sxIVS  ">
	<label for="pepWebsite">웹사이트</label>
	</aside>
	<div class="ada5V">
	<div class="               AC7dP        Igw0E     IwRSH      eGOV_         _4EzTm" style="width: 100%; max-width: 355px;">
	<input aria-required="false" id="pepWebsite" placeholder="웹사이트" type="text" class="JLJ-B zyHYP" value="${userVO.website}">
	</div>
	</div>
	</div>
	<div class="eE-OA">
	<aside class="sxIVS  ">
	<label for="pepBio">소개</label>
	</aside>
	<div class="ada5V">
	<textarea class="p7vTm" id="pepBio">${userVO.introduction}</textarea>
	</div>
	</div>
	<div class="eE-OA">
	<aside class="sxIVS  ">
	<label for="pepEmail">이메일</label>
	</aside>
	<div class="ada5V"><div class="               AC7dP        Igw0E     IwRSH      eGOV_         _4EzTm " style="width: 100%; max-width: 355px;">
	<input aria-required="false" id="pepEmail" placeholder="이메일" type="text" class="JLJ-B zyHYP" value="${userVO.email}">
	</div>
	</div>
	</div>
	<div class="eE-OA">
	<aside class="sxIVS  ">
	<label for="pepPhone Number">전화번호</label>
	</aside>
	<div class="ada5V">
	<div class="               AC7dP        Igw0E     IwRSH      eGOV_         _4EzTm " style="width: 100%; max-width: 355px;">
	<input aria-required="false" id="pepPhone Number" placeholder="전화번호" type="text" class="JLJ-B zyHYP" value="${userVO.phone}">
	</div>
	</div>
	</div>
	<div class="eE-OA">
	<aside class="sxIVS  tvweK">
	<label></label>
	</aside>
	<div class="ada5V">
	<div class="fi8zo">
	<button class="sqdOP  L3NKy   y3zKF     " type="button">제출</button>
	</div>
	</div>
	</div>
	</form>
	</article>

</body>
</html>