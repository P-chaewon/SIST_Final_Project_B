package com.sist.b.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.post.PostService;
import com.sist.b.post.PostVO;
import com.sist.b.user.UserVO;

@Controller
public class HomeController {
	
	@Autowired
	private PostService postService;
	
	
	@GetMapping("/")
	public ModelAndView getPostList(HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
	
		List<PostVO> ar = postService.getPostList();
		mv.addObject("postList", ar);
		mv.setViewName("home");
		
		return mv;
	}

}
