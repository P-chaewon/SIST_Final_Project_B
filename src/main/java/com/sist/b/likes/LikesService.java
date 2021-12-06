package com.sist.b.likes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikesService {
	
	@Autowired
	private LikesRepository likesRepository;

	public int setLikesInsert(LikesVO likesVO)throws Exception{
		
		return likesRepository.setLikesInsert(likesVO);
	}
	
	public int setLikesDelete(LikesVO likesVO)throws Exception{
		
		return likesRepository.setLikesDelete(likesVO);
	}
	
	public Long getLikesCount(LikesVO likesVO)throws Exception{
		return likesRepository.getLikesCount(likesVO);
	}
}
