package com.sist.b.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportRepository {
	
	// setInsert
	public int setInsert(ReportVO reportVO) throws Exception;
	
	// getList
	public List<ReportVO> getList() throws Exception;
}
