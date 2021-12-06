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
import com.sist.b.payments.PaymentsService;
import com.sist.b.payments.PaymentsVO;
import com.sist.b.report.ReportService;
import com.sist.b.report.ReportVO;
import com.sist.b.suspend.SuspendService;
import com.sist.b.suspend.SuspendVO;
import com.sist.b.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	@Autowired 
	private AdService adService;
	@Autowired 
	private MembershipService membershipService;
	@Autowired
	private PaymentsService paymentsService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private SuspendService suspendService;
	
	// ------------------ 광고 (ad) ------------------
	// selectList
	@GetMapping("home")
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
	
	// ------------------ 멤버십 (membership) ------------------
	// select
	@GetMapping("membership")
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
		mv.setViewName("redirect:../membership");
		return mv;
	}
	
	// ------------------ 결제 (payments) ------------------
	// getList
	@GetMapping("payments")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PaymentsVO> ar = paymentsService.getList(pager);
		mv.addObject("pager", pager);
		mv.addObject("paymentsVOs", ar);
		mv.setViewName("admin/payment_list");
		return mv;
	}
	
	// getOne
	@GetMapping("payments/selectInfo")
	public ModelAndView selectInfo(Long merchant_uid) throws Exception {
		ModelAndView mv = new ModelAndView();
		PaymentsVO paymentsVO = paymentsService.getOne(merchant_uid);
		mv.addObject("paymentsVO", paymentsVO);
		mv.setViewName("admin/selectResult");
		return mv;
	}
	
	// ------------------ 신고 (report) ------------------
	// getList
	@GetMapping("report")
	public ModelAndView getReportList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ReportVO> ar = reportService.getList();
		mv.addObject("reportVOs", ar);
		mv.setViewName("admin/report_list");
		return mv;
	}
	
	// ------------------ 정지 (suspend) ------------------
	// getList
	@GetMapping("suspend")
	public ModelAndView getSuspendList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<SuspendVO> ar = suspendService.getList();
		mv.addObject("suspendVOs", ar);
		mv.setViewName("admin/suspend_list");
		return mv;
	}
	
}
