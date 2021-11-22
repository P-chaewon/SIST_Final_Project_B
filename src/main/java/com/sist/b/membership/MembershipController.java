package com.sist.b.membership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/membership/**")
public class MembershipController {
	
	@Autowired
	private MembershipService membershipService;
	
	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		List<MembershipVO> ar = membershipService.getList();
		mv.addObject("membershipVOs", ar);
		mv.setViewName("membership/list");
		return mv;
	}
	
	@GetMapping("payment")
	public ModelAndView getOne(MembershipVO membershipVO, ModelAndView mv) throws Exception {
		membershipVO = membershipService.getOne(membershipVO);
		mv.addObject("membershipVO", membershipVO);
		mv.setViewName("membership/payment");
		return mv;
	}
}
