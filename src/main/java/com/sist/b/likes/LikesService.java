package com.sist.b.likes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.post.PostVO;

@Service
public class LikesService {
	
	@Autowired
	private LikesRepository likesRepository;

	public PostVO setLikesInsert(LikesVO likesVO)throws Exception{
		
		PostVO postVO = new PostVO();
		postVO.setPostNum(likesVO.getPostNum());
		
		likesRepository.setLikesUpdate(postVO);
		
		int result = likesRepository.setLikesInsert(likesVO);
		
		if(result == 1) {
			postVO = likesRepository.getLikesCount(postVO);
		}
		
		
		return postVO;
	}
	
	public PostVO setLikesDelete(LikesVO likesVO)throws Exception{
		
		PostVO postVO = new PostVO();
		postVO.setPostNum(likesVO.getPostNum());
		
		likesRepository.setLikesDown(postVO);
		
		int result = likesRepository.setLikesDelete(likesVO);
		
		if(result == 1) {
			postVO = likesRepository.getLikesCount(postVO);
		}
		
		
		return postVO;
	}
	
	public Long getLikesRead(LikesVO likesVO)throws Exception{
		return likesRepository.getLikesRead(likesVO);
	}
	

}
