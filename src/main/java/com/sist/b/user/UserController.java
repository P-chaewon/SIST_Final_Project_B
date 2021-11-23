package com.sist.b.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/account/**")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private AuthenticationManager authenticationManager;
	
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
	public String setUpdate() throws Exception {
		return "user/edit";
	}
	
	@PostMapping("edit")
	public ModelAndView setUpdate(UserVO userVO, ModelAndView mv) throws Exception{
		int result = userService.setUpdate(userVO);
		String msg="";
		if(result==1) {
			msg="프로필이 저장되었습니다.";
		}
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", msg);
		
		//세션 등록
		Authentication authentication=authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userVO.getUsername(), userVO.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return mv;
	}
	
		
	@PostMapping("edit/fileUpdate")
	public ModelAndView setFileUpdate(UserVO userVO, MultipartFile file, HttpSession session) throws Exception {
		int result = userService.setFileUpdate(userVO, file, session);
		ModelAndView mv = new ModelAndView();
		String msg = "profile fail";
		if(result == 1) {
			msg = "profile pass";
		}
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", msg);
		
		return mv;
	}
}
