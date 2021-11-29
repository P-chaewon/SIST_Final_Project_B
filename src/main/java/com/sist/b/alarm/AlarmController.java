package com.sist.b.alarm;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.user.UserVO;

@Controller
@RequestMapping("/alarm/**")
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	
	@GetMapping("getList")
	public ModelAndView getList(ModelAndView mv, HttpSession session) throws Exception {
		AlarmVO alarmVO = new AlarmVO();
		// session에서 userNum 가져오기
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");		
		SecurityContextImpl sc =(SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		alarmVO.setToUserNum(userVO.getUserNum());
		// 사용자별 알림 조회
		List<AlarmVO> ar = alarmService.getList(alarmVO);
		
		mv.addObject("alarmVOs", ar);
		mv.setViewName("alarm/list");
		return mv;
	}
}
