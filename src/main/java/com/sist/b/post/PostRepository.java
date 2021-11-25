package com.sist.b.post;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PostRepository {
	
	//post upload
	public int setPostUpload(PostVO postVO)throws Exception;
	
	//file upload
	public int setFilesInsert(PostFilesVO postFilesVO)throws Exception;

}
