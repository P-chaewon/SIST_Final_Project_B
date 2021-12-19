<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test="${empty searchUserList and tag_count < 1}">
		
	<div class="emptySearchResult" data-usernum="${list.userNum}">
		<span>검색 결과가 없습니다.</span>
	</div>
	
	</c:when>


<c:otherwise>

<c:if test="${not empty searchText }">
	<c:forEach items="${searchUserList}" var="list">
		<div class="search-searchResult" data-usernum="${list.userNum}">
			<div class="search-suImg">
			<a href="/gram/${list.username }">
				<img alt="유저이미지" src="${pageContext.request.contextPath}/static/upload/user/${list.fileName}">
			</a>
			</div>
			<div class="search-suInfo"  onclick="location.href='/gram/${list.username}'">
				<div class="search-suId">${list.username}</div>
				<div class="search-suNick">${list.nickname}</div>
			</div>
		</div>
		
	</c:forEach>

	<c:if test="${tag_count > 0}">
			<div class="search-searchResult"  onclick="location.href='/gram/search/tag/${searchText}'">
			<div class="search-suImg">
				<img alt="해시"style="width:25px; height:25px; border: 1px solid  #8E8E8E; border-radius:50px; padding: 10px;" src="${pageContext.request.contextPath}/static/icons/hash.png">
			</div>
			<div class="search-suInfo">
				<div class="search-suId">#${searchText}</div>
				<div class="search-suNick" style="margin-top: 2px;">게시물 ${tag_count}</div>
			</div>
		</div>
	
	</c:if>

</c:if>


</c:otherwise>

</c:choose>

