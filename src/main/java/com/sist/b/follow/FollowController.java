package com.sist.b.follow;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.user.UserService;
import com.sist.b.user.UserVO;

@Controller
@RequestMapping("/")
public class FollowController {

	@Autowired
	private FollowService followService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/friendships/people")
	public ModelAndView userList(UserVO userVO, HttpSession session) throws Exception {
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		userVO = (UserVO)authentication.getPrincipal();
		
		List<UserVO> users = followService.userList(userVO);
		ModelAndView mv= new ModelAndView();
		mv.setViewName("follow/userList");
		mv.addObject("users", users);
		
		return mv;
	}
	
	@PostMapping("/friendships/follow")
	public ModelAndView follow(FollowVO followVO) throws Exception {
		System.out.println(followVO.getUserNum());
		System.out.println(followVO.getFollowNum());
		int result = followService.follow(followVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@GetMapping("/{username}/following")
	public ModelAndView myFollowList(@PathVariable String username,UserVO userVO) throws Exception {
		userVO = userService.getSelectOne(username);
		System.out.println(userVO.getUserNum());
		List<UserVO> follows = followService.myFollowList(userVO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxFollowList");
		mv.addObject("follows", follows);
		
		return mv;
	}
	
	@GetMapping("/{username}/followers")
	public ModelAndView myFollowingList(@PathVariable String username,UserVO userVO) throws Exception {
		userVO = userService.getSelectOne(username);
		System.out.println(userVO.getUserNum());
		List<UserVO> follows = followService.myFollowerList(userVO);
		List<Long> followNums = followService.followNum(userVO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxFollowList");
		mv.addObject("follows", follows);
		mv.addObject("followNums", followNums);
		
		return mv;
	}
	
	
	
	
}
