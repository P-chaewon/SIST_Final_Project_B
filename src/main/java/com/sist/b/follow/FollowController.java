package com.sist.b.follow;

import java.util.Collections;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
		userVO.setUserCount(20);
		List<UserVO> users = followService.userList(userVO);
		ModelAndView mv= new ModelAndView();
		mv.setViewName("follow/userList");
		mv.addObject("users", users);
		mv.addObject("recommend", "recommend");
		return mv;
	}
	
	@PostMapping("/friendships/follow")
	@ResponseBody
	public ModelAndView follow(FollowVO followVO) throws Exception {
		int result = followService.follow(followVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		if(result==1) {
			System.out.println("FOLLOW SUCCESS");			
		}
		return mv;
	}
	
	@PostMapping("/friendships/unfollow")
	@ResponseBody
	public ModelAndView unFollow(FollowVO followVO) throws Exception {
		int result  = followService.unFollow(followVO);
		System.out.println("UNFOLLOW SUCCESS");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		return mv;
	}
	
	
	@GetMapping("/{username}/following")
	public ModelAndView myFollowList(@PathVariable String username,UserVO userVO, HttpSession session) throws Exception {
		userVO = userService.getSelectOne(username);
		List<UserVO> follows = followService.myFollowList(userVO);
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO loginUserVO = (UserVO)authentication.getPrincipal();
		List<UserVO> myfollows = followService.myFollowList(loginUserVO);
		for(UserVO follow : follows) {
			for(UserVO myfollow : myfollows) {
				if(follow.getUserNum()==myfollow.getUserNum()) {
					follow.setFollowing(true);
				}
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("follow/ajaxFollowList");
		mv.addObject("follows", follows);
		
		return mv;
	}
	
	@GetMapping("/{username}/followers")
	public ModelAndView myFollowingList(@PathVariable String username,UserVO userVO, HttpSession session) throws Exception {
		userVO = userService.getSelectOne(username);
		System.out.println(userVO.getUserNum());
		List<UserVO> follows = followService.myFollowerList(userVO);
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO loginUserVO = (UserVO)authentication.getPrincipal();
		//나의 팔로우 리스트
		List<UserVO> myfollows = followService.myFollowList(loginUserVO);
		
		for(UserVO follow : follows) {
			for(UserVO myfollow : myfollows) {
				if(follow.getUserNum()==myfollow.getUserNum()) {
					follow.setFollowing(true);
				}
			}
		}
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("follow/ajaxFollowList");
		mv.addObject("follows", follows);
		
		return mv;
	}
	
	
	
	
}
