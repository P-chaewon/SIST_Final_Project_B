package com.sist.b.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	
	@Autowired
	private ReportRepository reportRepository;
	
	public int setInsert(ReportVO reportVO) throws Exception {
		return reportRepository.setInsert(reportVO);
	}
	
	public List<ReportVO> getList() throws Exception {
		return reportRepository.getList();
	}
}
