package com.sist.b.alarm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmRepository {
	// 알림 insert
	public int setInsert(AlarmVO alarmVO) throws Exception;
	// 사용자별 알림 select
	public List<AlarmVO> getList(AlarmVO alarmVO) throws Exception;
	// 알림 읽음 처리
	public int setUpdate(AlarmVO alarmVO) throws Exception;
	// 알림 삭제
	public int setDelete(AlarmVO alarmVO) throws Exception;
}
