package com.sist.b.ad;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdService {
	
	@Autowired
	private AdRepository adRepository;
	
	public List<AdVO> getAdList() throws Exception {
		return adRepository.getAdList();
	}
	
	public int setAdInsert(AdVO adVO) throws Exception {
		return adRepository.setAdInsert(adVO);
	}
}
