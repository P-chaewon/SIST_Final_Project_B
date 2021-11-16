package com.sist.b.ad;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ad/**")
public class AdController {
	
	@Autowired
	private AdService adService;
	
	@GetMapping("list")
	public ModelAndView getAdList() throws Exception {
		ModelAndView mv = new ModelAndView();
		//List<AdVO> ar = adService.getAdList();
		//mv.addObject("adVOs", ar);
		mv.setViewName("ad/list");
		return mv;
	}
	
	@GetMapping("create")
	public String setAdInsert(@ModelAttribute AdVO adVO) throws Exception {
		return "ad/insert";
	}
	
	@PostMapping("create")
	public String setAdInsert(@Valid AdVO adVO, BindingResult bindingResult, MultipartFile file) throws Exception {
		if (bindingResult.hasErrors()) {
			return "ad/insert";
		}
		
		return "redirect:./list";
	}
	
}
