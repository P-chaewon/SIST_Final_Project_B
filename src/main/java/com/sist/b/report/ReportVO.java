package com.sist.b.report;

import lombok.Data;

@Data
public class ReportVO {
	private Long reportNum;
	private String reportType;
	private Long fromUserNum;
	private Long toUserNum;
	private String reason;
	
	// getList Join
	private String fromUserName;
	private String toUserName;
}
