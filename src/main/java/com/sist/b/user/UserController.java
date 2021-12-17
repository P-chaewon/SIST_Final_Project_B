package com.sist.b.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView setSignup(UserVO userVO) throws Exception {
		int result = userService.setSignup(userVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		return mv;
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
		
		
		return mv;
	}
	
		
	@PostMapping("edit/fileUpdate")
	public ModelAndView setFileUpdate(UserVO userVO, MultipartFile file, HttpSession session) throws Exception {
		String fileName = userService.setFileUpdate(userVO, file, session);
		ModelAndView mv = new ModelAndView();
		System.out.println("fileName : "+fileName);
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
	
	@PostMapping("remove/temporary")
	public ModelAndView setDeleteTemporary(UserVO userVO) throws Exception {
		int result = userService.setUnenabled(userVO);
		ModelAndView mv = new ModelAndView();
		if(result>0) {
			mv.setViewName("redirect:/account/logout");
			System.out.println("비활성화 성공");
		} else {
			mv.setViewName("user/accountTemporary");
			mv.addObject("result", "계정 비활성화에 실패하였습니다");
			System.out.println("비활성화 실패");
		}
		
		return mv;
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
	
	@GetMapping("password/reset")
	public String pwReset() throws Exception {
		return "user/pwReset";
	}
	
	@PostMapping("password/reset")
	public ModelAndView pwReset(UserVO userVO, HttpSession session) throws Exception {
		userVO = userService.getSelectOne(userVO.getUsername());
		ModelAndView mv = new ModelAndView();
		if(userVO==null) {
			mv.setViewName("user/pwReset");
			mv.addObject("result", "사용자를 찾을 수 없습니다.");
		} else {
			String tempPw = userService.getTempPassword(8);
			userVO.setPassword(tempPw);
			int result = userService.setPasswordUpdate(userVO);
			
			String email = userVO.getEmail();
			String title = "[WithUs] "+userVO.getUsername()+" 님의 임시 비밀번호를 보냅니다.";
			String content = "";
			content += "<table border='0' width='440px' cellspacing='0' cellpadding='0' style='border-collapse:collapse; font-family:Helvetica Neue,Helvetica,Lucida Grande,tahoma,verdana,arial,sans-serif; margin: 0 auto;'>";
			content += "<tbody><tr>";
			content += "<td style='margin:10px 0 10px 0;color:#565a5c;font-size:20px'>[WithUs] 임시 비밀번호 메일입니다.</td></tr>";
			content += "<tr><td style='margin:10px 0 10px 0;color:#565a5c;font-size:18px'>";
			content += "<p>안녕하세요, "+ userVO.getUsername()+ " 님</p>";
			content += "<p>요청하신 임시 비밀번호는 다음과 같습니다.</p>";
			content += "</td></tr><tr>";
			content += "<td style='padding:10px;color:#565a5c;font-size:32px;font-weight:500;text-align:center;padding-bottom:25px'>"+tempPw+"</td></tr>";
			content += "<tr><td style='margin:10px 0 10px 0;color:#565a5c;font-size:18px'>";
			content += "<p>임시 비밀번호를 사용하여 로그인 하신 후 임시 비밀번호를 변경해주시길 바랍니다.</p>";
			content += "<p>감사합니다.</p></td>";
			content += "</tr></tbody></table>";
			
			userService.sendMail(email, title, content);
			
			mv.setViewName("redirect:../challenge");
			mv.addObject("email", userVO.getEmail());
		}
		return mv;
	}
	
		
	@GetMapping("mail")
	public ModelAndView mail(String email, String username, String authkey) throws Exception {
		ModelAndView mv = new ModelAndView();
		authkey = userService.getRandomNum();
		int result = userService.getAuthkey(username, authkey);
		String title = "[WithUs] "+username+" 님의 회원가입 인증번호를 보냅니다.";
		String content = "";
		content += "<table border='0' width='440px' cellspacing='0' cellpadding='0' style='border-collapse:collapse; font-family:Helvetica Neue,Helvetica,Lucida Grande,tahoma,verdana,arial,sans-serif; margin: 0 auto;'>";
		content += "<tbody><tr>";
		content += "<td style='margin:10px 0 10px 0;color:#565a5c;font-size:20px'>[WithUs] 가입 인증 메일입니다.</td></tr>";
		content += "<tr><td style='margin:10px 0 10px 0;color:#565a5c;font-size:18px'>";
		content += "<p>안녕하세요, "+ username+ " 님</p>";
		content += "<p>WithUs의 회원 가입을 진심으로 환영합니다.</p>";
		content += "<p></p>";
		content += "<p>아래의 인증번호를 입력하여 가입인증을 하시면 회원 가입이 완료됩니다.</p>";
		content += "</td></tr><tr>";
		content += "<td style='padding:10px;color:#565a5c;font-size:32px;font-weight:500;text-align:center;padding-bottom:25px'>"+authkey+"</td></tr>";
		content += "<tr><td style='margin:10px 0 10px 0;color:#565a5c;font-size:18px'>";
		content += "<p>WithUs를 이용해 주셔서 감사합니다.</p>";
		content += "<p>더 나은 서비스를 제공하기 위해 항상 최선을 다하겠습니다.</p></td>";
		content += "</tr></tbody></table>";
		
		userService.sendMail(email, title, content);
		mv.setViewName("user/mail");
		return mv;
	}
	
	@PostMapping("mail")
	public ModelAndView mail(String username, String authkey) throws Exception {
		ModelAndView mv = new ModelAndView();
		UserVO userVO = userService.getSelectOne(username);
		String result = "";
		if(!userVO.getAuthkey().equals(authkey)) {
			result = "인증번호가 일치하지 않습니다.";
		} else {
			System.out.println("AUTHKEY SUCCESS");
		}
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);

		return mv;
	}
	
	@GetMapping("clause")
	public ModelAndView clause() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/clause");
		
		return mv;
	}
	
	@PostMapping("clause")
	public ModelAndView clause(String username) throws Exception {
		UserVO userVO = userService.getSelectOne(username);
		int result = userService.setEnabled(userVO);
		if(result>0) {
			System.out.println("ENABLED SUCCESS");
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@GetMapping("challenge")
	public String pwResetMail() throws Exception {
		
		return "user/pwResetMail";
	}
	
	@GetMapping("activity")
	public ModelAndView activity(UserVO userVO, HttpSession session) throws Exception {
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		userVO = (UserVO)authentication.getPrincipal();
		
		List<UserlogVO> userlogs = userService.getUserlog(userVO);
		if(userlogs.size()>5) {
			userlogs.remove(userlogs.size()-1);
			UserlogVO userlogVO = userlogs.get(userlogs.size()-1);
			int result = userService.setLogDelete(userlogVO);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/loginActivity");
		mv.addObject("userlog", userlogs);
		return mv;
	}
	
}
