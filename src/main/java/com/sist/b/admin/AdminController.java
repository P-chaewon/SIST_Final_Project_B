package com.sist.b.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.ad.AdService;
import com.sist.b.ad.AdVO;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	@Autowired AdService adService;
	
	// ------------------ 광고 ------------------
	// selectList
	@GetMapping("/")
	public ModelAndView getAdList(ModelAndView mv) throws Exception {
		List<AdVO> ar = adService.getList();
		mv.addObject("adVOs", ar);
		mv.setViewName("ad/list");
		return mv;
	}
	
	// selectOne
	@GetMapping("ad/select")
	public ModelAndView getAdOne(ModelAndView mv, AdVO adVO) throws Exception {
		adVO = adService.getOne(adVO);
		mv.addObject("adVO", adVO);
		mv.setViewName("ad/select");
		return mv;
	}
	
	// insert : get
	@GetMapping("ad/create")
	public String setAdInsert(@ModelAttribute AdVO adVO) throws Exception {
		return "ad/insert";
	}
	
	// insert : post
	@PostMapping("ad/create")
	public String setAdInsert(@Valid AdVO adVO, BindingResult bindingResult, MultipartFile file) throws Exception {
		
		if(bindingResult.hasErrors()) {
			return "board/insert";
		}
		
		int result = adService.setInsert(adVO, file);
		return "redirect:../";
	}
	
	// delete
	@GetMapping("ad/delete")
	public String setDelete(AdVO adVO) throws Exception {
		adVO = adService.getOne(adVO);
		int result = adService.setDelete(adVO);
		return "redirect:../";
	}
}
