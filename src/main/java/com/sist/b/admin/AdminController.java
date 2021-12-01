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
import com.sist.b.membership.MembershipService;
import com.sist.b.membership.MembershipVO;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	@Autowired AdService adService;
	@Autowired MembershipService membershipService;
	
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
	
	// ------------------ 멤버십 ------------------
	// select
	@GetMapping("membership/list")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		List<MembershipVO> ar = membershipService.getList();
		mv.addObject("membershipVOs", ar);
		mv.setViewName("admin/membership_list");
		return mv;
	}
	
	// insert : get
	@GetMapping("membership/create")
	public String setInsert() throws Exception {
		return "admin/membership_insert";
	}
	
	// insert : post
	@PostMapping("membership/create")
	public ModelAndView setInsert(MembershipVO membershipVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = membershipService.setInsert(membershipVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	// update : get
	@GetMapping("membership/update")
	public ModelAndView setUpdate(ModelAndView mv, MembershipVO membershipVO) throws Exception {
		membershipVO = membershipService.getOne(membershipVO);
		mv.addObject("membershipVO", membershipVO);
		mv.setViewName("admin/membership_update");
		return mv;
	}
	
	// update : post
	@PostMapping("membership/update")
	public ModelAndView setUpdate(MembershipVO membershipVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = membershipService.setUpdate(membershipVO);		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// delete
	@GetMapping("membership/delete")
	public ModelAndView setDelete(MembershipVO membershipVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = membershipService.setDelete(membershipVO);		
		mv.setViewName("redirect:./list");
		return mv;
	}
}
