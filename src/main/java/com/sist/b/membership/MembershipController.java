package com.sist.b.membership;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.payments.PaymentsService;
import com.sist.b.payments.PaymentsVO;
import com.sist.b.user.UserVO;

@Controller
@RequestMapping("/membership/**")
public class MembershipController {
	
	@Autowired
	private MembershipService membershipService;
	@Autowired
	private PaymentsService paymentsService;
	
	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		List<MembershipVO> ar = membershipService.getList();
		mv.addObject("membershipVOs", ar);
		mv.setViewName("membership/list");
		return mv;
	}
	
	@GetMapping("payment")
	public ModelAndView getOne(MembershipVO membershipVO, ModelAndView mv, HttpSession session) throws Exception {
		membershipVO = membershipService.getOne(membershipVO);
		// paymentsVO 생성
		PaymentsVO paymentsVO = new PaymentsVO();
		// insert : merchant_uid 생성
		int result = paymentsService.setInsert(paymentsVO);
		// merchant_uid 가져오기
		Long merchant_uid = paymentsVO.getMerchant_uid();
		
		// userNum 가져오기
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");		
		SecurityContextImpl sc =(SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();

		mv.addObject("userNum", userVO.getUserNum());
		mv.addObject("merchant_uid", merchant_uid);
		mv.addObject("membershipVO", membershipVO);
		mv.setViewName("membership/payment");
		return mv;
	}
	
	@GetMapping("placeorder.do")
	public ModelAndView placeOrder(PaymentsVO paymentsVO, ModelAndView mv) throws Exception {
		int updateResult = paymentsService.setUpdate(paymentsVO);
		String result = null;
		// DB 업데이트 실패
		if (updateResult < 0) {
			result = "n";
		// DB 업데이트 성공
		} else {
			result = "y";
		}
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		return mv;
	}
}
