package com.sist.b.alarm;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
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
		List<AlarmVO> ar = alarmRepository.getList(alarmVO);
		LocalDate now = LocalDate.now();
		
		// n일 전 계산
		for (AlarmVO vo : ar) {
			String date = vo.getAlarmDate().toString();
			
			// DB 날짜
			LocalDate dBefore = LocalDate.parse(date, DateTimeFormatter.ISO_LOCAL_DATE);
			// 현재 날짜
			LocalDate dAfter = LocalDate.parse(now.toString(), DateTimeFormatter.ISO_LOCAL_DATE);
			// 날짜 계산
			long diff = ChronoUnit.DAYS.between(dBefore, dAfter);
			
			vo.setDiff(diff);
		}
		
		return ar;
	}
	
	public int setUpdate(Long alarmNum) throws Exception {
		return alarmRepository.setUpdate(alarmNum);
	}
	
	public int setDelete(AlarmVO alarmVO) throws Exception {
		return alarmRepository.setDelete(alarmVO);
	}
}
