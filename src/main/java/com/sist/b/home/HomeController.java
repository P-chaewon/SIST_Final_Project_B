package com.sist.b.home;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.bookmark.BookmarkService;
import com.sist.b.bookmark.BookmarkVO;
import com.sist.b.likes.LikesService;
import com.sist.b.likes.LikesVO;
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
	private LikesService likesService;
	
	@Autowired
	private BookmarkService bookmarkService;
	
	@GetMapping("/")
	public ModelAndView getPostList(HttpSession session)throws Exception{
		
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO loginUserVO = (UserVO)authentication.getPrincipal();
		
		ModelAndView mv = new ModelAndView();
	
		List<PostVO> ar = postService.getPostList(loginUserVO);
			
		LikesVO likesVO = new LikesVO();
		
	
		mv.addObject("postList", ar);
		mv.setViewName("home");
		
		return mv;
	}
	
	@GetMapping("/explore")
	public ModelAndView getExploreList(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO loginUserVO = (UserVO)authentication.getPrincipal();
		
		List<PostVO> ar = postService.getPostList(loginUserVO);
		
		mv.addObject("postList", ar);
		mv.setViewName("post/explore");
		
		return mv;
	
	}
	
	

	@GetMapping("/{username}")
	public ModelAndView getProfile(@PathVariable String username, HttpSession session) throws Exception {
		//파라미터 username으로 가져온 userVO
		UserVO userVO = userService.getSelectOne(username);
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		ModelAndView mv= new ModelAndView();
		//로그인 되어 있는 유저의 정보를 가지고 있는 userVO
		UserVO loginUserVO = (UserVO)authentication.getPrincipal();
		if(userVO.getUsername().equals(loginUserVO.getUsername())) {
			mv.setViewName("myProfile");
		} else {			
			mv.setViewName("profile");
		}
		
		mv.addObject("userVO", userVO);
		return mv;
	}
	

	@ResponseBody
	@GetMapping("insertLikes.do")
	public PostVO setLikesInsert(@RequestParam Long no, LikesVO likesVO, HttpSession session)throws Exception {
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		UserVO userVO = (UserVO)authentication.getPrincipal();

	
		
		likesVO.setUserNum(userVO.getUserNum());
		likesVO.setPostNum(no);
	
		PostVO postVO = likesService.setLikesInsert(likesVO);
		
		return postVO;
		
	}
	
	@ResponseBody
	@GetMapping("deleteLikes.do")
	public PostVO setLikesDelete(@RequestParam Long no, LikesVO likesVO, HttpSession session)throws Exception {
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		UserVO userVO = (UserVO)authentication.getPrincipal();
		
		likesVO.setUserNum(userVO.getUserNum());
		likesVO.setPostNum(no);
	
		PostVO postVO = likesService.setLikesDelete(likesVO);
		
		return postVO;
		
	}
	
	
	
	@ResponseBody
	@GetMapping("insertBookmark.do")
	public int setBookmarkInsert(@RequestParam Long no, BookmarkVO bookmarkVO, HttpSession session)throws Exception {
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		UserVO userVO = (UserVO)authentication.getPrincipal();

	
		
		bookmarkVO.setUserNum(userVO.getUserNum());
		bookmarkVO.setPostNum(no);
	
		int result = bookmarkService.setBookmarkInsert(bookmarkVO);
		
		return result;
		
	}
	
	@ResponseBody
	@GetMapping("deleteBookmark.do")
	public int setBookmarkDelete(@RequestParam Long no, BookmarkVO bookmarkVO, HttpSession session)throws Exception {
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		UserVO userVO = (UserVO)authentication.getPrincipal();
		
		bookmarkVO.setUserNum(userVO.getUserNum());
		bookmarkVO.setPostNum(no);
	
		int result = bookmarkService.setBookmarkDelete(bookmarkVO);
		
		return result;
		
	}
	
	
}
