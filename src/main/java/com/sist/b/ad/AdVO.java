package com.sist.b.ad;

import java.sql.Date;

import lombok.Data;

@Data
public class AdVO {
	private Long adNum;
	private String adContents;
	private Date adDate;
	private String adFileName;
	private String adURL;
}
