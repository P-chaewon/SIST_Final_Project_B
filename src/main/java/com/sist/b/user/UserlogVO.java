package com.sist.b.user;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserlogVO {
	
	private Long userlogNum;
	private Long userNum;
	private Timestamp loginDate;
	private String loginIp;
	//0이면 로그아웃 상태, 1이면 로그인 상태
	private boolean loginCheck;

}
