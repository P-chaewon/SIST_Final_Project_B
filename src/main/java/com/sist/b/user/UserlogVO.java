package com.sist.b.user;

import java.sql.Date;

import lombok.Data;

@Data
public class UserlogVO {
	
	private Long userlogNum;
	private Long userNum;
	private Date loginDate;

}
