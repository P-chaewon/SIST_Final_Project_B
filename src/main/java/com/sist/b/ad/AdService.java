package com.sist.b.ad;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdService {
	
	@Autowired
	private AdRepository adRepository;
	
	public List<AdVO> getList() throws Exception {
		return adRepository.getList();
	}
	
	public AdVO getOne(AdVO adVO) throws Exception {
		return adRepository.getOne(adVO);
	}
	
	public int setInsert(AdVO adVO, MultipartFile file) throws Exception {
		// file insert
		return adRepository.setInsert(adVO);
	}
}
