package com.sist.b.refunds;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RefundsRepository {
	// refunds insert
	public int setInsert(RefundsVO refundsVO) throws Exception;
}
