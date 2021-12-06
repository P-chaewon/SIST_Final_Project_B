package com.sist.b.likes;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.b.post.PostVO;

@Repository
@Mapper
public interface LikesRepository {
	
	public int setLikesInsert(LikesVO likesVO)throws Exception;
	
	public int setLikesUpdate(PostVO postVO)throws Exception;
	
	public int setLikesDelete(LikesVO likesVO)throws Exception;

	public int setLikesDown(PostVO postVO)throws Exception;
	
	public PostVO getLikesCount(PostVO postVO)throws Exception;

}
