package com.sist.b.payments;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentsRepository {
	
	// merchant_uid insert
	public int setInsert(PaymentsVO paymentsVO) throws Exception;
	
	// merchant_uid 기준으로 update
	public int setUpdate(PaymentsVO paymentsVO) throws Exception;
	
	// 모든 payments 내역
	public List<PaymentsVO> getList() throws Exception;
	
	// 사용자별 payments 내역
	public List<PaymentsVO> getListByUser(PaymentsVO paymentsVO) throws Exception;
	
	// 환불 가능한 payments 내역
	public List<PaymentsVO> getRefund(PaymentsVO paymentsVO) throws Exception;
	
	// 환불 대기 중으로 update
	public int setUpdateCk(Long merchant_uid) throws Exception;
}
