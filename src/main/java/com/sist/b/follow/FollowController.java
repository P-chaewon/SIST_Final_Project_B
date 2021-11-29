package com.sist.b.follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.user.UserVO;

@Controller
@RequestMapping("/explore/**")
public class FollowController {

	@Autowired
	private FollowService followService;
	
	@GetMapping("people")
	public ModelAndView userList() throws Exception {
		List<UserVO> users = followService.userList();
		ModelAndView mv= new ModelAndView();
		mv.setViewName("follow/userList");
		mv.addObject("users", users);
		
		return mv;
	}
}
