package com.sist.b.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.alarm.AlarmService;
import com.sist.b.alarm.AlarmVO;
import com.sist.b.bookmark.BookmarkService;
import com.sist.b.bookmark.BookmarkVO;
import com.sist.b.follow.FollowService;
import com.sist.b.comment.CommentService;
import com.sist.b.comment.CommentVO;
import com.sist.b.likes.LikesService;
import com.sist.b.likes.LikesVO;
import com.sist.b.user.UserVO;

@Controller
@RequestMapping("/post/**")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private LikesService likesService;
	
	@Autowired
	private BookmarkService bookmarkService;
	
	@Autowired
	private FollowService followService;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private AlarmService alarmService;

	
	@GetMapping("upload")
	public String setPostUpload()throws Exception{
		return "post/upload";
	}
	
	@PostMapping("upload")
	public String setPostUpload(PostVO postVO, MultipartFile [] files, HttpSession session)throws Exception{
		
		
		  Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		  SecurityContextImpl sc = (SecurityContextImpl)object;
		  org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		  UserVO userVO = (UserVO)authentication.getPrincipal();
		 
		  postVO.setUserNum(userVO.getUserNum());
		  
		  String username = userVO.getUsername();
		  
		  int result = postService.setPostUpload(postVO, files);
		  
		  System.out.println(result);
		 
		System.out.println(files.length);
		
		for(MultipartFile multipartFile:files) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		return "redirect:../"+username;
	}
	
	@GetMapping("selectOne")
	public ModelAndView getUserPost(PostVO postVO, Long alarmNum, HttpSession session)throws Exception{

		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		UserVO userVO = (UserVO)authentication.getPrincipal();
		/* postVO.setUserVO(userVO); */
		postVO.setUserNum(userVO.getUserNum());
		
		/*
		 * map.put("userVO", userVO); map.put("postVO", postVO);
		 */
		postVO = postService.getUserPost(postVO);
		//follow가 0이면 내 팔로우가 아닌 사람이 쓴 글
		//follow가 1이면 내 팔로우가 쓴 글
		//follow가 2이면 내가 쓴 글
		int follow = 0;
		if(userVO.getUserNum()==postVO.getUserNum()) {
			System.out.println("내가 쓴 글");
			follow = 2;
		} else {
			if(followService.followCheck(postVO.getUserVO(), session)) {
				System.out.println("내 팔로우가 쓴 글");
				follow = 1;
			}
		}
		System.out.println(follow);
		
		// 알림 읽음 처리
		int result = alarmService.setUpdate(alarmNum);
		
		mv.addObject("follow", follow);
		mv.addObject("postVO", postVO);
		mv.setViewName("post/select");
	
		return mv;
	}
	
	@GetMapping("delete")
	public String setDelete(PostVO postVO, HttpSession session)throws Exception{
		
		  Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		  SecurityContextImpl sc = (SecurityContextImpl)object;
		  org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		  UserVO userVO = (UserVO)authentication.getPrincipal();
		  
		  String username = userVO.getUsername();
		
		int result = postService.setPostDelete(postVO);
		return "redirect:../../"+username;
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
		
		// 알림 추가
		AlarmVO alarmVO = new AlarmVO();
		// 좋아요 알림 : 1
		alarmVO.setAlarmType(1);
		alarmVO.setFromUserNum(userVO.getUserNum());

		// userNum 조회
		Long toUserNum = postService.getUserNum(no);

		alarmVO.setToUserNum(toUserNum);
		alarmVO.setTargetPostNum(no);

		// 좋아요 알림 insert
		int result = alarmService.setInsert(alarmVO);
				
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
	
	
	@PostMapping("comment")
	public ModelAndView setComment(@RequestParam Long postNum, CommentVO commentVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		  Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		  SecurityContextImpl sc = (SecurityContextImpl)object;
		  org.springframework.security.core.Authentication authentication =sc.getAuthentication(); 
		  UserVO userVO = (UserVO)authentication.getPrincipal();
		  
		commentVO.setUserNum(userVO.getUserNum());
		commentVO.setPostNum(postNum);
		int result = commentService.setComment(commentVO);
		
		// 알림 추가
		AlarmVO alarmVO = new AlarmVO();
		// 댓글 알림 : 2
		alarmVO.setAlarmType(2);
		alarmVO.setFromUserNum(userVO.getUserNum());

		// userNum 조회
		Long toUserNum = postService.getUserNum(postNum);

		alarmVO.setToUserNum(toUserNum);
		alarmVO.setTargetPostNum(postNum);

		// 댓글 알림 insert
		result = alarmService.setInsert(alarmVO);
		
		mv.setViewName("post/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@PostMapping("commentDel")
	public ModelAndView setCommentDel(CommentVO commentVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = commentService.setCommentDel(commentVO);
		mv.setViewName("post/ajaxResult");
		mv.addObject("result", result);
		return mv;
	}
	
	

	

	
}
