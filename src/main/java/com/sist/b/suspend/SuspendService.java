package com.sist.b.suspend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.report.ReportRepository;
import com.sist.b.user.UserRepository;
import com.sist.b.user.UserVO;
import com.sist.b.util.Pager;

@Service
public class SuspendService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private SuspendRepository suspendRepository;
	@Autowired
	private ReportRepository reportRepository;
	
	public List<SuspendVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		
		// 1. 총 글의 개수 DB에서 조회
		Long totalCount = suspendRepository.getTotalCount();
		pager.makeNum(totalCount);
		
		return suspendRepository.getList(pager);
	}
	
	// cron block
	public int setCronInsert(UserVO userVO) throws Exception {
		// enable 0 : 사용 불가
		int result = userRepository.setUnenabled(userVO);

		SuspendVO suspendVO = new SuspendVO();
		// 사용자 번호
		suspendVO.setUserNum(userVO.getUserNum());
		// 정지 이유
		suspendVO.setSuspendReason("자동 정지: 신고 횟수 초과");
		return suspendRepository.setInsert(suspendVO);
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
		// report 삭제
		int result = reportRepository.setDelete(userVO);
		
		// enable 1 : 사용 가능
		result = userRepository.setEnabled(userVO);
		
		SuspendVO suspendVO = new SuspendVO();
		// 사용자 번호
		suspendVO.setUserNum(userVO.getUserNum());
		return suspendRepository.setDelete(suspendVO);
	}
}
