package com.sist.b.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
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
	
	// edit page begin	
	@GetMapping("edit")
	public ModelAndView setUpdate(HttpSession session) throws Exception {
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		userVO = userService.getSelectOne(userVO.getUsername());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/edit");
		mv.addObject("userVO", userVO);
		return mv;
	}
	
	@PostMapping("edit")
	public ModelAndView setUpdate(UserVO userVO, ModelAndView mv) throws Exception{
		int result = userService.setUpdate(userVO);
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		//세션 등록
//		Authentication authentication=authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userVO.getUsername(), userVO.getPassword()));
//		SecurityContextHolder.getContext().setAuthentication(authentication);
		return mv;
	}
	
		
	@PostMapping("edit/fileUpdate")
	public ModelAndView setFileUpdate(UserVO userVO, MultipartFile file, HttpSession session) throws Exception {
		String fileName = userService.setFileUpdate(userVO, file, session);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", fileName);
		
		return mv;
	}
	
	@PostMapping("edit/fileDelete")
	public ModelAndView setFileDelete(UserVO userVO, HttpSession session) throws Exception {
		int result = userService.setFileDelte(userVO, session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@GetMapping("remove/permanent")
	public ModelAndView setDelete() throws Exception {
				
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/accountRemove");
		
		return mv;
	}
	
	@PostMapping("remove/permanent")
	public ModelAndView setDelete(UserVO userVO, HttpSession session) throws Exception {
		System.out.println(userVO.getPassword());
		System.out.println(userVO.getUsername());
		System.out.println("---------------------------");
		int result = userService.setDelete(userVO);
		System.out.println("Controller : "+result);
		ModelAndView mv = new ModelAndView();
		if(result>0) {
			mv.setViewName("redirect:/account/logout");
			System.out.println("삭제 성공");
		} else {
			mv.setViewName("user/accountRemove");
			mv.addObject("result", "회원 탈퇴에 실패하였습니다");
			System.out.println("삭제 실패");
		}
		return mv;
	}

	@GetMapping("remove/temporary")
	public String setDeleteTemporary() throws Exception {
		return "user/accountTemporary";
	}
	
	@GetMapping("password/change")
	public ModelAndView setPasswordUpdate(HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/pwChange");
		return mv;
	}
	
	@PostMapping("password/change")
	public ModelAndView setPasswordUpdate(UserVO userVO, ModelAndView mv) throws Exception{
		int result = userService.setPasswordUpdate(userVO);
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@PostMapping("password/check")
	public ModelAndView getPwCheck(HttpSession session, String pw) throws Exception {
		boolean check = userService.getPwCheck(session, pw);
		ModelAndView mv = new ModelAndView();
		int result = 1;
		if(!check) {
			result = 0;
		}
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@GetMapping("manage_access")
	public String access() throws Exception {
		return "user/access";
	}
	
	
	@GetMapping("push/setting")
	public String pushSetting() throws Exception {
		return "user/pushSetting";
	}
	
	
	@GetMapping("privacy_and_security")
	public String privacy() throws Exception {
		return "user/privacy";
	}
	
}
