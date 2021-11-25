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
	public void setPostUpload()throws Exception{
		
	}
	
	@PostMapping("upload")
	public String setPostUpload(PostVO postVO, MultipartFile [] files, HttpSession session)throws Exception{
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		org.springframework.security.core.Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		
		postVO.setUserNum(userVO.getUserNum());
		
		int result = postService.setPostUpload(postVO, files);
		
		System.out.println(result);
		return "redirect:../";
	}

}
