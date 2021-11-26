package com.sist.b.refunds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefundsService {
	
	@Autowired
	public RefundsRepository refundsRepository;
	
	public int setInsert(RefundsVO refundsVO) throws Exception {
		return refundsRepository.setInsert(refundsVO);
	}
	
	public List<RefundsVO> getList() throws Exception {
		return refundsRepository.getList();
	}
	
	public int setDelete(Long merchant_uid) throws Exception {
		return refundsRepository.setDelete(merchant_uid);
	}
}
