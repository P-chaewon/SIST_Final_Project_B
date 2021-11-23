package com.sist.b.payments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
