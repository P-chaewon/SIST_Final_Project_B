package com.sist.b.membership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MembershipService {
	
	@Autowired
	private MembershipRepository membershipRepository;
	
	public List<MembershipVO> getList() throws Exception {
		return membershipRepository.getList();
	}
	
	public MembershipVO getOne(MembershipVO membershipVO) throws Exception {
		return membershipRepository.getOne(membershipVO);
	}
	
	public int setInsert(MembershipVO membershipVO) throws Exception {
		return membershipRepository.setInsert(membershipVO);
	}
	
	public int setUpdate(MembershipVO membershipVO) throws Exception {
		return membershipRepository.setUpdate(membershipVO);
	}
	
	public int setDelete(MembershipVO membershipVO) throws Exception {
		return membershipRepository.setDelete(membershipVO);
	}
}
