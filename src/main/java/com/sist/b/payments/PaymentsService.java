package com.sist.b.payments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.util.Pager;

@Service
public class PaymentsService {
	
	@Autowired
	private PaymentsRepository paymentsRepository;
	
	public int setInsert(PaymentsVO paymentsVO) throws Exception {
		return paymentsRepository.setInsert(paymentsVO);
	}
	
	public int setUpdate(PaymentsVO paymentsVO) throws Exception {
		return paymentsRepository.setUpdate(paymentsVO);
	}
	
	public List<PaymentsVO> getList(Pager pager) throws Exception {		
		return paymentsRepository.getList(pager);
	}
	
	public List<PaymentsVO> getListByUser(PaymentsVO paymentsVO) throws Exception {
		return paymentsRepository.getListByUser(paymentsVO);
	}
	
	public PaymentsVO getOne(Long merchant_uid) throws Exception {
		return paymentsRepository.getOne(merchant_uid);
	}
	
	public List<PaymentsVO> getRefund(PaymentsVO paymentsVO) throws Exception {
		return paymentsRepository.getRefund(paymentsVO);
	}
	
	public int setUpdateCk(Long merchant_uid) throws Exception {
		return paymentsRepository.setUpdateCk(merchant_uid);
	}
	
	public int setUpdateCkDone(Long merchant_uid) throws Exception {
		return paymentsRepository.setUpdateCkDone(merchant_uid);
	}
}
