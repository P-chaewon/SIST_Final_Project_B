package com.sist.b.post;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PostMapperTest {

	@Autowired
	private PostRepository postRepository;
	
	@Test
	void test()throws Exception {
		PostVO postVO = new PostVO();
		postVO.setUserNum(1L);
		postVO.setContents("test");
		
		int result = postRepository.setPostUpload(postVO);
		
		assertNotEquals(0, result);
	}

}
