package com.sist.b.comment;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {

	private Long commentNum;
	private Long postNum;
	private Long userNum;
	private String commentContents;
	private Long ref;
	private Long step;
	private Long depth;
	private Date wDate;
	
}
