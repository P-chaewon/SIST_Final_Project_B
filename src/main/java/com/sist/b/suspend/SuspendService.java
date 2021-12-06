package com.sist.b.suspend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SuspendService {
	
	@Autowired
	private SuspendRepository suspendRepository;
	
	public List<SuspendVO> getList() throws Exception {
		return suspendRepository.getList();
	}
}
