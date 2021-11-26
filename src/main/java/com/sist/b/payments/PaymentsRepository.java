package com.sist.b.payments;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sist.b.util.Pager;

@Mapper
public interface PaymentsRepository {
	
	// merchant_uid insert
	public int setInsert(PaymentsVO paymentsVO) throws Exception;
	
	// merchant_uid 기준으로 update
	public int setUpdate(PaymentsVO paymentsVO) throws Exception;
	
	// 모든 payments 내역
	public List<PaymentsVO> getList(Pager pager) throws Exception;
	
	// 사용자별 payments 내역
	public List<PaymentsVO> getListByUser(PaymentsVO paymentsVO) throws Exception;
	
	// merchant_uid로 payments 정보 조회
	public PaymentsVO getOne(Long merchant_uid) throws Exception;
	
	// 환불 가능한 payments 내역
	public List<PaymentsVO> getRefund(PaymentsVO paymentsVO) throws Exception;
	
	// 환불 대기 중으로 update
	public int setUpdateCk(Long merchant_uid) throws Exception;
	
	// 환불 완료로 update
	public int setUpdateCkDone(Long merchant_uid) throws Exception;
}
