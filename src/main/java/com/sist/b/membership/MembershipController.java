package com.sist.b.membership;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		
		// ----------------- insert 주석 처리 -----------------------
		int result = paymentsService.setInsert(paymentsVO);
		// -------------------------------------------------------
		
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
	
	@GetMapping("info")
	public ModelAndView getListByUser(ModelAndView mv, HttpSession session) throws Exception {
		// userNum 가져오기
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");		
		SecurityContextImpl sc =(SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		
		PaymentsVO paymentsVO = new PaymentsVO();
		paymentsVO.setUserNum(userVO.getUserNum());
		List<PaymentsVO> ar = paymentsService.getListByUser(paymentsVO);
		mv.addObject("paymentsVOs", ar);
		mv.setViewName("membership/info");
		return mv;
	}
	
	// ajax 멤버십 번호로 멤버십 이름 조회
	@GetMapping("selectName")
	public ModelAndView getOneName(ModelAndView mv, MembershipVO membershipVO) throws Exception {
		membershipVO = membershipService.getOne(membershipVO);
		mv.addObject("result", membershipVO.getMembershipName());
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("refund")
	public ModelAndView refund(ModelAndView mv, HttpSession session) throws Exception {
		// userVO 가져오기
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");		
		SecurityContextImpl sc =(SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		PaymentsVO paymentsVO = new PaymentsVO();
		// userNum 입력
		paymentsVO.setUserNum(userVO.getUserNum());
		
		// 현재 날짜 구하기
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date time = new Date();
		
		// java.util.Date -> java.sql.Date 
		String time1 = format1.format(time);
		java.sql.Date date =java.sql.Date.valueOf(time1);
		// System.out.println(date);
		// 현재 날짜 입력
		paymentsVO.setPaymentsDate(date);
		
		// 현재 시간 구하기
		SimpleDateFormat format2 = new SimpleDateFormat ( "HH:mm:ss");
		String time2 = format2.format(time);
		// System.out.println(time2);
		// 현재 시간 입력
		paymentsVO.setPaymentsTime(time2);
		
		// 환불 가능 리스트 조회
		List<PaymentsVO> ar = paymentsService.getRefund(paymentsVO);

		mv.addObject("refundVOs", ar);
		mv.setViewName("membership/refund");
		return mv;
	}
	
}
