package com.sist.b.suspend;

import java.sql.Date;

import lombok.Data;

@Data
public class SuspendVO {
	private Long suspendNum;
	private Long userNum;
	private Date suspendDate;
	private String suspendReason;
	
	// getList
	private String username;
}
