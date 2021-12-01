package com.sist.b.post;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.user.UserVO;

@Controller
@RequestMapping("/post/**")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@GetMapping("upload")
	public String setPostUpload()throws Exception{
		return "post/upload";
	}
	
	@PostMapping("upload")
	public String setPostUpload(PostVO postVO, MultipartFile [] files, HttpSession session)throws Exception{
		
		
		  Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		  SecurityContextImpl sc = (SecurityContextImpl)object;
		 org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		 UserVO userVO = (UserVO)authentication.getPrincipal();
		 
		  postVO.setUserNum(userVO.getUserNum());
		  
		  int result = postService.setPostUpload(postVO, files);
		  
		  System.out.println(result);
		 
		System.out.println(files.length);
		
		for(MultipartFile multipartFile:files) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		return "redirect:../";
	}
	
	@GetMapping("selectOne")
	public ModelAndView getUserPost(PostVO postVO)throws Exception{
		
		
		ModelAndView mv = new ModelAndView();
		
		postVO = postService.getUserPost(postVO);
		
		mv.addObject("postVO", postVO);
		mv.setViewName("post/select");
		System.out.println(postVO.getPostNum());
		return mv;
	}
	
	

}
