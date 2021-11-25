package com.sist.b.payments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/payments/**")
public class PaymentsController {
	
	@Autowired
	private PaymentsService paymentsService;
	
	@GetMapping("/")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		List<PaymentsVO> ar = paymentsService.getList();
		mv.addObject("paymentsVOs", ar);
		mv.setViewName("payments/list");
		return mv;
	}
}
