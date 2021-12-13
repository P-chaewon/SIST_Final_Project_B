package com.sist.b.suspend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.user.UserRepository;
import com.sist.b.user.UserVO;

@Service
public class SuspendService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private SuspendRepository suspendRepository;
	
	public List<SuspendVO> getList() throws Exception {
		return suspendRepository.getList();
	}
	
	// block
	public int setAdminInsert(UserVO userVO) throws Exception {
		// enable 0 : 사용 불가
		int result = userRepository.setUnenabled(userVO);
		
		SuspendVO suspendVO = new SuspendVO();
		// 사용자 번호
		suspendVO.setUserNum(userVO.getUserNum());
		// 정지 이유
		suspendVO.setSuspendReason("관리자 권한으로 정지");
		return suspendRepository.setInsert(suspendVO);
	}
	
	// unblock
	public int setAdminDelete(UserVO userVO) throws Exception {
		// enable 1 : 사용 가능
		int result = userRepository.setEnabled(userVO);
		
		SuspendVO suspendVO = new SuspendVO();
		// 사용자 번호
		suspendVO.setUserNum(userVO.getUserNum());
		return suspendRepository.setDelete(suspendVO);
	}
}