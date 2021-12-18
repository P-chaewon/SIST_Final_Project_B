<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 검색결과없을 때 -->
<c:choose>
	<c:when test="${empty searchUserList and tag_count < 1}">
		
	<div class="emptySearchResult" data-usernum="${list.userNum}">
		<span>검색 결과가 없습니다.</span>
	</div>
	
	</c:when>

<!-- 검색결과 있을때 -->
<c:otherwise>

<!-- 검색어가 공백이 아닐 경우 -->
<c:if test="${not empty searchText }">
	<c:forEach items="${searchUserList}" var="list">
		<div class="searchResult" data-usernum="${list.userNum}">
			<div class="suImg">
			<a href="/gram/${list.username }">
				<img alt="유저이미지" src="${pageContext.request.contextPath}/static/upload/user/${list.fileName}">
			</a>
			</div>
			<div class="suInfo"  onclick="location.href='/gram/${list.username}'">
				<div class="suId">${list.username}</div>
				<div class="suNick">${list.nickname}</div>
			</div>
		</div>
		
	</c:forEach>
	<!-- tag 결과 1개이상일때 -->
	<c:if test="${tag_count > 0}">
			<div class="searchResult"  onclick="location.href='/gram/search/tag/${searchText}'">
			<div class="suImg">
				<img alt="해시"style="width:25px; height:25px; border: 1px solid  #8E8E8E; border-radius:50px; padding: 10px;" src="${pageContext.request.contextPath}/static/icons/hash.png">
			</div>
			<div class="suInfo">
				<div class="suId">#${searchText}</div>
				<div class="suNick" style="margin-top: 2px;">게시물 ${tag_count}</div>
			</div>
		</div>
	
	</c:if>

</c:if>


</c:otherwise>

</c:choose>

