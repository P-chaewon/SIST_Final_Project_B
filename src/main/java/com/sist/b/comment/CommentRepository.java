package com.sist.b.comment;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CommentRepository {
	
	public int setComment(CommentVO commentVO)throws Exception;
	
	public Long getCommentCount(CommentVO commentVO)throws Exception;
	
	public int setCommentDel(CommentVO commentVO)throws Exception;

}
