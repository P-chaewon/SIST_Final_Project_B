package com.sist.b.refunds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.payments.PaymentsService;

@Controller
@RequestMapping("/admin/payments/refunds/**")
public class RefundsController {
	
	@Autowired
	private RefundsService refundsService;
	@Autowired
	private PaymentsService paymentsService;
	
	@GetMapping("/")
	public ModelAndView getRefund(ModelAndView mv) throws Exception {
		List<RefundsVO> ar = refundsService.getList();
		mv.addObject("refundsVOs", ar);
		mv.setViewName("admin/refund");
		return mv;
	}
	
	@PostMapping("/")
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
}
