package com.sist.b.bookmark;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.post.PostVO;

@Service
public class BookmarkService {
	
	@Autowired
	private BookmarkRepository bookmarkRepository;

	public int setBookmarkInsert(BookmarkVO bookmarkVO)throws Exception{
		
		PostVO postVO = new PostVO();
		postVO.setPostNum(bookmarkVO.getPostNum());
		
		int result = bookmarkRepository.setBookmarkInsert(bookmarkVO);
		
		return result;
	}
	
	public int setBookmarkDelete(BookmarkVO bookmarkVO)throws Exception{
		
		PostVO postVO = new PostVO();
		postVO.setPostNum(bookmarkVO.getPostNum());
		
		int result = bookmarkRepository.setBookmarkDelete(bookmarkVO);
		
		
		return result;
	}
	
	

}
