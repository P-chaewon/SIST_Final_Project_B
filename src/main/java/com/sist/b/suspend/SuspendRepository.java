package com.sist.b.suspend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sist.b.util.Pager;

@Mapper
public interface SuspendRepository {
	
	// getList
	public List<SuspendVO> getList(Pager pager) throws Exception;
	// setInsert
	public int setInsert(SuspendVO suspendVO) throws Exception;
	// setDelete
	public int setDelete(SuspendVO suspendVO) throws Exception;
	// getTotalCount
	public Long getTotalCount() throws Exception;
}
