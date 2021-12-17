package com.sist.b.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;
	
	public int setComment(CommentVO commentVO)throws Exception{
		
		return commentRepository.setComment(commentVO);
	}

	public int setCommentDel(CommentVO commentVO)throws Exception{
		return commentRepository.setCommentDel(commentVO);
	}
	
	public Long getUserNum(String writer) throws Exception {
		return commentRepository.getUserNum(writer);
	}
	
}
