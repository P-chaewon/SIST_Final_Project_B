package com.sist.b.home;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.follow.FollowService;
import com.sist.b.post.PostService;
import com.sist.b.post.PostVO;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.user.UserService;

import com.sist.b.user.UserVO;

@Controller
public class HomeController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FollowService followService;

	
	@GetMapping("/")
	public ModelAndView getPostList(HttpSession session)throws Exception{
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		Long followCount = followService.followCount(userVO.getUserNum());
		
		ModelAndView mv = new ModelAndView();
		List<PostVO> ar = postService.getPostList();
		List<UserVO> users = null;
		//팔로우 한 사람이 있으면 home으로 없으면 userList로
		if(followCount==0) {
			userVO.setUserCount(20);
			users = followService.userList(userVO);
			mv.setViewName("follow/userList");
		} else {
			userVO.setUserCount(5);
			users = followService.userList(userVO);
			mv.addObject("postList", ar);
			mv.setViewName("home");			
		}
		mv.addObject("users", users);
		
		return mv;
	}
	
	@GetMapping("/explore")
	public ModelAndView getExploreList()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<PostVO> ar = postService.getPostList();
		
		mv.addObject("postList", ar);
		mv.setViewName("post/explore");
		
		return mv;
	
	}
	
	@GetMapping("/{username}")
	public ModelAndView getProfile(@PathVariable String username, HttpSession session) throws Exception {
		//파라미터 username으로 가져온 userVO
		UserVO userVO = userService.getSelectOne(username);
		Map<String, Long> count = new HashMap<String, Long>();
		Long followCount = followService.followCount(userVO.getUserNum());
		Long followerCount = followService.follwerCount(userVO.getUserNum());
		count.put("followCount", followCount);
		count.put("followerCount", followerCount);
		
		ModelAndView mv= new ModelAndView();
		//팔로우가 0이면 내가 팔로우 하고 있지 않은 사람
		//팔로우가 1이면 내가 팔로우 하고있는 사람
		int follow = 0;
		if(followService.userCheck(userVO, session)) {
			mv.setViewName("myProfile");
		} else {
			if(followService.followCheck(userVO, session)) {
				follow = 1;
			}
			mv.addObject("follow", follow);
			mv.setViewName("profile");
		}
		
		mv.addObject("count", count);
		mv.addObject("userVO", userVO);
		return mv;
	}

}
