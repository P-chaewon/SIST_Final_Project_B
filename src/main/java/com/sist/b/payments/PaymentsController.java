package com.sist.b.payments;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/payments/**")
public class PaymentsController {
	
	@GetMapping("/")
	public String getList() throws Exception {
		return "payments/list";
	}
}
