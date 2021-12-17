package com.sist.b.report;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/report/**")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@GetMapping("post")
	public ModelAndView postReport(ReportVO reportVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 글 신고
		reportVO.setReportType("post");
		// 
		
		int result = reportService.setInsert(reportVO);
		mv.setViewName("redirect:./");
		return mv;
	}
}
