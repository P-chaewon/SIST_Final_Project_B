package com.sist.b.likes;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.sist.b.post.PostVO;

@SpringBootTest
class LikesMapperTest {

	@Autowired
	private LikesRepository likesRepository;
	
	@Test
	void test()throws Exception {
		LikesVO likesVO = new LikesVO();
		
		
		likesVO.setPostNum(23L);
		likesVO.setUserNum(3L);
		
		int result = likesRepository.setLikesInsert(likesVO);
		
		
		assertNotEquals(0, result);
	}

	
	
}
