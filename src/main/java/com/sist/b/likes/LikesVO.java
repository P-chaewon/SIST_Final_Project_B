package com.sist.b.likes;

import com.sist.b.user.UserVO;

import lombok.Data;

@Data
public class LikesVO {

	private Long likesNum;
	private Long postNum;
	private Long userNum;
	
	private UserVO userVO;
	
	private Long count;
	
}
