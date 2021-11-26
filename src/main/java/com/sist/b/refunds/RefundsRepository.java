package com.sist.b.refunds;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RefundsRepository {
	// refunds insert
	public int setInsert(RefundsVO refundsVO) throws Exception;
	
	// refunds list select
	public List<RefundsVO> getList() throws Exception;
	
	// refunds delete
	public int setDelete(Long merchant_uid) throws Exception;
}
