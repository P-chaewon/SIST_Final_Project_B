package com.sist.b.ad;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface AdRepository {
	
	// ad list
	public List<AdVO> getList() throws Exception;
	// ad insert
	public int setInsert(AdVO adVO) throws Exception;
	// file insert
	
}
