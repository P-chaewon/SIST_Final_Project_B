package com.sist.b.membership;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MembershipRepository {
	// getList
	public List<MembershipVO> getList() throws Exception;
	// getOne
	public MembershipVO getOne(MembershipVO membershipVO) throws Exception;
	// setInsert
	public int setInsert(MembershipVO membershipVO) throws Exception;
	// setUpdate
	public int setUpdate(MembershipVO membershipVO) throws Exception;
	// setDelete
	public int setDelete(MembershipVO membershipVO) throws Exception;
}
