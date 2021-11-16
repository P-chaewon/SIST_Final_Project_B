package com.sist.b.ad;

import lombok.Data;

@Data
public class AdVO {
	private Long adNum;
	private String adContents;
	private Data adDate;
	private String adFileName;
	private String adURL;
}
