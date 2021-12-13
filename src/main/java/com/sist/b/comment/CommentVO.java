package com.sist.b.comment;



import java.sql.Date;

import com.sist.b.user.UserVO;

import lombok.Data;

@Data
public class CommentVO {

	private Long commentNum;
	private Long postNum;
	private Long userNum;
	private String writer;
	private String commentContents;
	private Long ref;
	private Long step;
	private Long depth;
	private Date regDate;
	
	private UserVO userVO;
	
}
