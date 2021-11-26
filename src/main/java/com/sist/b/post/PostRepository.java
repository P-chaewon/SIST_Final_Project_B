package com.sist.b.post;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PostRepository {
	
	//post upload
	public int setPostUpload(PostVO postVO)throws Exception;
	
	//post list
	public List<PostVO> getPostList()throws Exception;
	
	//file upload
	public int setFilesInsert(PostFilesVO postFilesVO)throws Exception;

}
