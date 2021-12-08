package com.sist.b.bookmark;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.b.post.PostVO;

@Repository
@Mapper
public interface BookmarkRepository {
	
	public int setBookmarkInsert(BookmarkVO bookmarkVO)throws Exception;

	public int setBookmarkDelete(BookmarkVO bookmarkVO)throws Exception;

	

}
