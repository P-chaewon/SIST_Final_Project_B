package com.sist.b.post;

import java.sql.Date;

import lombok.Data;

@Data
public class PostVO {
	
	private Long postNum;
	private Long userNum;
	private String contents;
	private String tag;
	private Date regDate;

}
