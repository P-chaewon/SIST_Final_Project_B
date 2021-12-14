package com.sist.b.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.user.UserVO;
import com.sist.b.util.Pager;

@Service
public class ReportService {
	
	@Autowired
	private ReportRepository reportRepository;
	
	public int setInsert(ReportVO reportVO) throws Exception {
		return reportRepository.setInsert(reportVO);
	}
	
	public List<ReportVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		
		// 1. 총 글의 개수 DB에서 조회
		Long totalCount = reportRepository.getTotalCount();
		pager.makeNum(totalCount);
		
		return reportRepository.getList(pager);
	}
	
	public List<Long> getReportCount() throws Exception {
		return reportRepository.getReportCount();
	}
	
	public int setDelete(UserVO userVO) throws Exception {
		return reportRepository.setDelete(userVO);
	}
}
