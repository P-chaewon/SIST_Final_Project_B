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
	
	@GetMapping("/")
	public ModelAndView getList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PaymentsVO> ar = paymentsService.getList(pager);
		mv.addObject("pager", pager);
		mv.addObject("paymentsVOs", ar);
		mv.setViewName("admin/list");
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
