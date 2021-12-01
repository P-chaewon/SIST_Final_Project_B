package com.sist.b.post;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PostMapperTest {

	@Autowired
	private PostRepository postRepository;
	
	//@Test
	void test()throws Exception {
		PostVO postVO = new PostVO();
		postVO.setUserNum(2L);
		postVO.setContents("test");
		
		int result = postRepository.setPostUpload(postVO);
		
		assertNotEquals(0, result);
	}

	
	//@Test
		void filetest()throws Exception {
			PostFilesVO postFilesVO = new PostFilesVO();
			postFilesVO.setPostNum(9L);
			//postFilesVO.setFileName("test");
			postFilesVO.setOriName("test");
			
			int result = postRepository.setFilesInsert(postFilesVO);
			
			assertNotEquals(0, result);
		}
	
}
