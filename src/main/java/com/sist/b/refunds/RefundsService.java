package com.sist.b.refunds;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.util.Pager;

@Service
public class RefundsService {
	
	@Autowired
	public RefundsRepository refundsRepository;
	
	public int setInsert(RefundsVO refundsVO) throws Exception {
		return refundsRepository.setInsert(refundsVO);
	}
	
	public List<RefundsVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		
		// 1. 총 글의 개수 DB에서 조회
		Long totalCount = refundsRepository.getTotalCount(pager);
		pager.makeNum(totalCount);
		return refundsRepository.getList(pager);
	}
	
	public int setDelete(Long merchant_uid) throws Exception {
		return refundsRepository.setDelete(merchant_uid);
	}
}
