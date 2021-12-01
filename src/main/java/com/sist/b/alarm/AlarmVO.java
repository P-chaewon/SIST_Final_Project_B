package com.sist.b.alarm;

import java.sql.Date;

import com.sist.b.user.UserVO;

import lombok.Data;

@Data
public class AlarmVO {
	private Long alarmNum;
	private Integer alarmType;
	private Long toUserNum;
	private Long fromUserNum;
	private Long targetPostNum;
	private boolean readCheck;
	private Date alarmDate;
	
	private UserVO userVO;
	private Long diff;
}
