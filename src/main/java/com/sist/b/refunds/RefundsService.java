package com.sist.b.refunds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefundsService {
	
	@Autowired
	public RefundsRepository refundsRepository;
	
	public int setInsert(RefundsVO refundsVO) throws Exception {
		return refundsRepository.setInsert(refundsVO);
	}
}
