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
import com.sist.b.refunds.RefundsService;
import com.sist.b.refunds.RefundsVO;
import com.sist.b.report.ReportService;
import com.sist.b.report.ReportVO;
import com.sist.b.suspend.SuspendService;
import com.sist.b.suspend.SuspendVO;
import com.sist.b.user.UserService;
import com.sist.b.user.UserVO;
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
	private RefundsService refundsService;
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
		mv.addObject("board", "ad");
		mv.setViewName("ad/list");
		return mv;
	}
	
	// selectOne
	@GetMapping("ad/select")
	public ModelAndView getAdOne(ModelAndView mv, AdVO adVO) throws Exception {
		adVO = adService.getOne(adVO);
		mv.addObject("adVO", adVO);
		mv.addObject("board", "ad");
		mv.setViewName("ad/select");
		return mv;
	}
	
	// insert : get
	@GetMapping("ad/create")
	public ModelAndView setAdInsert(@ModelAttribute AdVO adVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "ad");
		mv.setViewName("ad/insert");
		return mv;
	}
	
	// insert : post
	@PostMapping("ad/create")
	public String setAdInsert(@Valid AdVO adVO, BindingResult bindingResult, MultipartFile file) throws Exception {
		
		if(bindingResult.hasErrors()) {
			return "board/insert";
		}
		
		int result = adService.setInsert(adVO, file);
		return "redirect:../home";
	}
	
	// delete
	@GetMapping("ad/delete")
	public String setDelete(AdVO adVO) throws Exception {
		adVO = adService.getOne(adVO);
		int result = adService.setDelete(adVO);
		return "redirect:../home";
	}
	
	// ------------------ 멤버십 (membership) ------------------
	// select
	@GetMapping("membership")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		List<MembershipVO> ar = membershipService.getList();
		mv.addObject("membershipVOs", ar);
		mv.addObject("board", "membership");
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
	
	// ------------------ 결제 (payments), 환불 (refunds) ------------------
	// getList
	@GetMapping("payments")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PaymentsVO> ar = paymentsService.getList(pager);
		mv.addObject("pager", pager);
		mv.addObject("paymentsVOs", ar);
		mv.addObject("board", "payments");
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
	
	// refunds : get
	@GetMapping("payments/refunds")
	public ModelAndView getRefund(ModelAndView mv) throws Exception {
		List<RefundsVO> ar = refundsService.getList();
		mv.addObject("refundsVOs", ar);
		mv.addObject("board", "payments");
		mv.setViewName("admin/refund");
		return mv;
	}
	
	// refunds : post
	@PostMapping("payments/refunds")
	public ModelAndView getRefund(Long [] merchant_uid) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		for (Long uid:merchant_uid) {
			// refunds 테이블에서 삭제
			int result = refundsService.setDelete(uid);
			// payments 테이블 업데이트 (w -> d)
			result = paymentsService.setUpdateCkDone(uid);
		}
		
		mv.setViewName("redirect:./refunds");
		return mv;
	}
	
	// ------------------ 신고 (report), 정지 (suspend) ------------------
	// report : getList
	@GetMapping("report")
	public ModelAndView getReportList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ReportVO> ar = reportService.getList();
		mv.addObject("reportVOs", ar);
		mv.addObject("board", "report");
		mv.setViewName("admin/report_list");
		return mv;
	}
	
	// block : 관리지 권한으로 차단
	@PostMapping("report")
	public ModelAndView setUnenabled(UserVO userVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 관리자 정지
		int result = suspendService.setAdminInsert(userVO);
		mv.setViewName("redirect:./report");
		return mv;
	}
	
	// suspend : getList
	@GetMapping("suspend")
	public ModelAndView getSuspendList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<SuspendVO> ar = suspendService.getList();
		mv.addObject("suspendVOs", ar);
		mv.addObject("board", "report");
		mv.setViewName("admin/suspend_list");
		return mv;
	}
	
	// unblock
	@PostMapping("suspend")
	public ModelAndView setEnabled(UserVO userVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		// suspend delete
		int result = suspendService.setAdminDelete(userVO);		
		mv.setViewName("redirect:./suspend");
		return mv;
	}
}
