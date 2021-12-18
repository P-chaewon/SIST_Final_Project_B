package com.sist.b.report;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ReportVO {
	private Long reportNum;
	private String reportType;
	private Long fromUserNum;
	private Long toUserNum;
	@NotBlank
	private String reason;
	
	// getList Join
	private String fromUserName;
	private String toUserName;
	private boolean enabled;
}
