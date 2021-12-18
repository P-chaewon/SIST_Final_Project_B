package com.sist.b.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.post.PostService;
import com.sist.b.post.PostVO;
import com.sist.b.user.UserService;

@Controller
@RequestMapping("/search/**")
public class SearchController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;
	
	
	@RequestMapping("/tag/{word}")
	public ModelAndView serachTag(@PathVariable("word") String word)throws Exception{
		ModelAndView mv = new ModelAndView();

		PostVO postVO = new PostVO();
		
		postVO.setTag(word+" ");
		
		Long tag_cnt = postService.getSearchTagCount(postVO);
		
		
		List<PostVO> tagList = postService.getTagList(postVO);
		
		mv.addObject("tag_cnt", tag_cnt);
		mv.addObject("tag", tagList);
		mv.addObject("word", word);
		mv.setViewName("tag");
		
		return mv;
	}

	
}
