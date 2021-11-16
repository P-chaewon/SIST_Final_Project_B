package com.sist.b.ad;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdRepository {
	
	// 광고 list
	public List<AdVO> getAdList() throws Exception;
	
	// 광고 insert
	public int setAdInsert(AdVO adVO) throws Exception;

}
