<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



  			<ul data-commentNum = "${comments.commentNum }" class="comments" style="margin-top: 5px;">
			                <li style="height: 17px;">
			                 <span class="point_span nickname" style="font-weight: bold;">${comments.writer}</span><span>${comments.commentContents}</span>
			<button class="commentDel" data-comment-del="${comments.commentNum}" style=" margin-left: 49px; width:30px; background-color:#fff; border-style: none;">삭제${comments.writer}</button>
			                </li>
			           
			</ul>
			
			<div class="description" id="comment_re">
				   <span class="sub" style="font-size: 12px; width: 60px;">${comments.regDate}</span> 
			       <span class="sub_span" id="re" style="cursor: pointer;">답글달기</span>
			 </div>
			 
			  <div class="comment_re" style="width: 500px; display:none; height:40px; margin-top:5px; border: 1px solid #DBDBDB;">
			          <!-- 이모지 추가 -->
			
			            <input id="input_comment_re" name="commentContents" style="width: 450px; padding: 0; margin-top:12px; margin-left: 5px;"  class="input_comment" type="text" placeholder="답글 달기..." >
		
			            <button type="button" class="submit_re" id="comment_re">게시</button>
			          
			          </div>

