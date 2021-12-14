package com.sist.b.post;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.b.user.UserVO;

@Repository
@Mapper
public interface PostRepository {
	
	//post upload
	public int setPostUpload(PostVO postVO)throws Exception;
	
	//post list
	public List<PostVO> getPostList(UserVO userVO)throws Exception;
	
	//user post
	public PostVO getUserPost(PostVO postVO)throws Exception;
	
	//post delete
	public int setDeletePost(PostVO postVO)throws Exception;
	
	//file upload
	public int setFilesInsert(PostFilesVO postFilesVO)throws Exception;
	
	public List<PostVO> getMyPost(PostVO postVO)throws Exception;

}
