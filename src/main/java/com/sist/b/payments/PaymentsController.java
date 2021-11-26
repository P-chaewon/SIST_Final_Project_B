package com.sist.b.payments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.refunds.RefundsService;
import com.sist.b.refunds.RefundsVO;
import com.sist.b.util.Pager;

@Controller
@RequestMapping("/admin/payments/**")
public class PaymentsController {
	
	@Autowired
	private PaymentsService paymentsService;
	@Autowired
	private RefundsService refundsService;
	
	@GetMapping("/")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PaymentsVO> ar = paymentsService.getList(pager);
		mv.addObject("pager", pager);
		mv.addObject("paymentsVOs", ar);
		mv.setViewName("admin/list");
		return mv;
	}
	
	@GetMapping("refunds")
	public ModelAndView getRefund(ModelAndView mv) throws Exception {
		List<RefundsVO> ar = refundsService.getList();
		mv.addObject("refundsVOs", ar);
		mv.setViewName("admin/refund");
		return mv;
	}
	
	@PostMapping("refunds")
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
	
	// ajax merchant_uid로 결제 정보 조회
	@GetMapping("selectInfo")
	public ModelAndView selectInfo(Long merchant_uid) throws Exception {
		ModelAndView mv = new ModelAndView();
		PaymentsVO paymentsVO = paymentsService.getOne(merchant_uid);
		mv.addObject("paymentsVO", paymentsVO);
		mv.setViewName("admin/selectResult");
		return mv;
	}
}
