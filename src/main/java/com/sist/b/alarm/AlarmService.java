package com.sist.b.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmService {
	
	@Autowired
	private AlarmRepository alarmRepository;
	
	public int setInsert(AlarmVO alarmVO) throws Exception {
		return alarmRepository.setInsert(alarmVO);
	}
	
	public List<AlarmVO> getList(AlarmVO alarmVO) throws Exception {
		return alarmRepository.getList(alarmVO);
	}
	
	public int setUpdate(AlarmVO alarmVO) throws Exception {
		return alarmRepository.setUpdate(alarmVO);
	}
	
	public int setDelete(AlarmVO alarmVO) throws Exception {
		return alarmRepository.setDelete(alarmVO);
	}
}
