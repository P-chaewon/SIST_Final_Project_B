package com.sist.b.payments;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentsRepository {
	
	// merchant_uid insert
	public int setInsert(PaymentsVO paymentsVO) throws Exception;
	
	// merchant_uid 기준으로 update
	public int setUpdate(PaymentsVO paymentsVO) throws Exception;
	
}
