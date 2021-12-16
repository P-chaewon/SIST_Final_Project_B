package com.sist.b.post;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.sist.b.post.util.PostFileManager;
import com.sist.b.user.UserVO;

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
			
			String fileName = fileManager.getUseServletContext("upload/post", multipartFile);
			
			PostFilesVO postFilesVO = new PostFilesVO();
			postFilesVO.setPostNum(postVO.getPostNum());			

			
			postFilesVO.setPostfileName(fileName);
			postFilesVO.setOriName(multipartFile.getOriginalFilename());
			
			result = postRepository.setFilesInsert(postFilesVO);
		
		}
		
		return result;
	}
	
	
	public List<PostVO> getPostList(UserVO userVO)throws Exception{
		return postRepository.getPostList(userVO);
	}
	
	public int setPostDelete(PostVO postVO)throws Exception{
		return postRepository.setDeletePost(postVO);
	}
	
	public PostVO getUserPost(PostVO postVO)throws Exception{
		return postRepository.getUserPost(postVO);
	}
	
	public List<PostVO> getMyPost(PostVO postVO)throws Exception{
		return postRepository.getMyPost(postVO);
	}
	
	public List<PostVO> getBookmarkList(PostVO postVO)throws Exception{
		return postRepository.getBookmarkList(postVO);
	}
	
	public Long getSearchTagCount(PostVO postVO)throws Exception{
		return postRepository.getSearchTagCount(postVO);
	}
	
	public List<PostVO> getTagList(PostVO postVO)throws Exception{
		return postRepository.getTagList(postVO);
	}
}
