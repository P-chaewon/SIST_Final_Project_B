package com.sist.b.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sist.b.post.util.PostFileManager;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private PostFileManager fileManager;
	
	public int setPostUpload(PostVO postVO, MultipartFile [] files)throws Exception{
		
		int result = postRepository.setPostUpload(postVO);
		
		for(MultipartFile multipartFile:files) {
			
			if(multipartFile.getSize()==0L) {
				continue;
			}
			
			PostFilesVO postFilesVO = new PostFilesVO();
			postFilesVO.setPostNum(postVO.getPostNum());
			
			String fileName = fileManager.getUseServletContext("/upload/post/", multipartFile);
			
			postFilesVO.setFileName(fileName);
			postFilesVO.setOriName(multipartFile.getOriginalFilename());
			
			result = postRepository.setFilesInsert(postFilesVO);
		}
		
		return result;
	}
	
}
