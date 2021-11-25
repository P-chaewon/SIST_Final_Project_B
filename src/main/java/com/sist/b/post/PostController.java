package com.sist.b.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/post/**")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@GetMapping("upload")
	public void setPostUpload()throws Exception{
		
	}
	
	@PostMapping("upload")
	public String setPostUpload(PostVO postVO, MultipartFile [] files)throws Exception{
		
		int result = postService.setPostUpload(postVO, files);
		
		System.out.println(result);
		return "redirect:./index";
	}

}
