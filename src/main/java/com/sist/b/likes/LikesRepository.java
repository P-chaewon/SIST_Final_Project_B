package com.sist.b.likes;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.b.post.PostVO;
import com.sist.b.user.UserVO;

@Repository
@Mapper
public interface LikesRepository {
	
	public int setLikesInsert(LikesVO likesVO)throws Exception;
	
	public int setLikesUpdate(PostVO postVO)throws Exception;
	
	public int setLikesDelete(LikesVO likesVO)throws Exception;

	public int setLikesDown(PostVO postVO)throws Exception;
	
	public PostVO getLikesCount(PostVO postVO)throws Exception;
	
	public Long getLikesRead(LikesVO likesVO)throws Exception;
	
	public List<UserVO> getLikeUser(LikesVO likesVO)throws Exception;

}
