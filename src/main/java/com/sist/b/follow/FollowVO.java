package com.sist.b.follow;

import java.sql.Date;

import lombok.Data;

@Data
public class FollowVO {
	
	//팔로우 당한 사람
	private Long followNum;
	//팔로우한 사람
	private Long userNum;
	private Date followDate;

}
