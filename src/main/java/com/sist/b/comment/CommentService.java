package com.sist.b.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.post.PostVO;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;
	
	public int setComment(CommentVO commentVO)throws Exception{
		int result = commentRepository.setComment(commentVO);
		result = commentRepository.setRefUpdate(commentVO);
		
		return result;
	}

	public int setCommentDel(CommentVO commentVO)throws Exception{
		return commentRepository.setCommentDel(commentVO);
	}
	
	public int setReplyInsert(CommentVO commentVO)throws Exception{
		int result = commentRepository.setRefUpdate(commentVO);
		result = commentRepository.setReplyInsert(commentVO);
		
		return result;
	}
	

	
}
