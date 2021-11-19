package com.sist.b.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/account/**")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("signup")
	public String setSignup() throws Exception {
		return "user/signup";
	}
	
	@PostMapping("signup")
	public String setSignup(UserVO userVO) throws Exception {
		int result = userService.setSignup(userVO);
		return "redirect:/account/login";
	}

	@GetMapping("login")
	public String getLogin() throws Exception {
		return "user/login";
	}
	
	@GetMapping("idCheck")
	public ModelAndView getIdCheck(UserVO userVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		userVO = userService.getIdCheck(userVO);
		int idCheck = 0;
		if(userVO!=null) {
			idCheck = 1;
		}
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", idCheck);
		
		return mv;
	}
	
	@GetMapping("edit")
	public ModelAndView setUpdate(Long userNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = new UserVO();
		userVO = userService.getSelectOne(userNum);
		mv.setViewName("user/edit");
		mv.addObject("userVO", userVO);
		return mv;
	}
}
