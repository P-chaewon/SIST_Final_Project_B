package com.sist.b.chat;

import java.util.Date;

import lombok.Data;

@Data
public class ChatMessageVO {
	
	private Long messageNum;
	private Long roomNum;
	private Long userNum;
	private String contents;
	private Date sendDate;
	private Date readDate;
	
	private Long reciverNum;
	
}
