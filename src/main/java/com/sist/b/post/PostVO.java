package com.sist.b.post;

import java.sql.Date;
import java.util.List;

import com.sist.b.user.UserVO;

import lombok.Data;

@Data
public class PostVO {
	
	private Long postNum;
	private Long userNum;
	private String contents;
	private String tag;
	private Date regDate;
	
	private UserVO userVO;
	
	private List<PostFilesVO> fileList;

}
