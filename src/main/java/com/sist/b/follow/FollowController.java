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

import com.sist.b.alarm.AlarmService;
import com.sist.b.alarm.AlarmVO;
import com.sist.b.user.UserService;
import com.sist.b.user.UserVO;

@Controller
@RequestMapping("/")
public class FollowController {

	@Autowired
	private FollowService followService;
	@Autowired
	private UserService userService;
	@Autowired
	private AlarmService alarmService;
	
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
	public ModelAndView follow(FollowVO followVO, HttpSession session) throws Exception {
		int result = followService.follow(followVO);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		if(result==1) {
			System.out.println("FOLLOW SUCCESS");
			// 알림 추가
			AlarmVO alarmVO = new AlarmVO();
			// 팔로우 알림 : 3
			alarmVO.setAlarmType(3);
			alarmVO.setFromUserNum(followVO.getUserNum());
			alarmVO.setToUserNum(followVO.getFollowNum());

			// 댓글 알림 insert
			result = alarmService.setInsert(alarmVO);
		}
		return mv;
	}
	
	@PostMapping("/friendships/unfollow")
	public ModelAndView unFollow(FollowVO followVO) throws Exception {
		int result  = followService.unFollow(followVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		if(result==1) {
			System.out.println("UNFOLLOW SUCCESS");			
		}
		return mv;
	}
	
	
	@GetMapping("/{username}/following")
	public ModelAndView myFollowingList(@PathVariable String username,UserVO userVO, HttpSession session) throws Exception {
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
		mv.addObject("type", "following");
		mv.addObject("follows", follows);
		
		return mv;
	}
	
	@GetMapping("/{username}/followers")
	public ModelAndView myFollowerList(@PathVariable String username,UserVO userVO, HttpSession session) throws Exception {
		userVO = userService.getSelectOne(username);
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
		mv.addObject("type", "followerg");
		return mv;
	}
	
}
