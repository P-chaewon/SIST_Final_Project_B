package com.sist.b.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.user.UserService;
import com.sist.b.user.UserVO;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String getIndex()throws Exception{
		return "home";
	}
	
	@GetMapping("/{username}")
	public ModelAndView getProfile(@PathVariable String username) throws Exception {
		UserVO userVO = userService.getSelectOne(username);
		ModelAndView mv= new ModelAndView();
		mv.setViewName("profile");
		mv.addObject("userVO", userVO);
		return mv;
	}

}
