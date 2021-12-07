package com.sist.b.suspend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SuspendRepository {
	
	// getList
	public List<SuspendVO> getList() throws Exception;
	// setInsert
	public int setInsert(SuspendVO suspendVO) throws Exception;
	// setDelete
	public int setDelete(SuspendVO suspendVO) throws Exception;
}
