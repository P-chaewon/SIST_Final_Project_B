package com.sist.b.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sist.b.util.Pager;

@Mapper
public interface ReportRepository {
	
	// setInsert
	public int setInsert(ReportVO reportVO) throws Exception;
	
	// getList
	public List<ReportVO> getList(Pager pager) throws Exception;
	
	// getTotalCount
	public Long getTotalCount() throws Exception;
}
