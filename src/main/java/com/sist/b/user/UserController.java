package com.sist.b.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "redirect:./login";
	}

	@GetMapping("login")
	public String getLogin() throws Exception {
		return "user/login";
	}
	
	@GetMapping("edit")
	public String setUpdate() throws Exception {
		return "user/edit";
	}
}
