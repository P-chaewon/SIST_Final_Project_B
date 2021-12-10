package com.sist.b.chat.chatroom;

import java.util.Date;

import com.sist.b.user.UserVO;

import lombok.Data;

@Data
public class ChatRoomJoinVO {

	private Long joinNum;
	private Long userNum;
	private Long roomNum;
	private Date exitDate;
	
	private UserVO userVO;
	
}
