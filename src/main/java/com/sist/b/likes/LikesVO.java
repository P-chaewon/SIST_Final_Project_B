package com.sist.b.likes;

import java.util.List;

import com.sist.b.user.UserVO;

import lombok.Data;

@Data
public class LikesVO {

	private Long likesNum;
	private Long postNum;
	private Long userNum;
	
	private List<UserVO> likeUsers;
	
	private Long count;
	
}
