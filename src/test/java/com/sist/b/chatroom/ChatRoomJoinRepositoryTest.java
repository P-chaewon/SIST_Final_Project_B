package com.sist.b.chatroom;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.sist.b.chat.chatroom.ChatRoomJoinRepository;
import com.sist.b.user.UserVO;

@SpringBootTest
public class ChatRoomJoinRepositoryTest {

	@Autowired
	private ChatRoomJoinRepository chatRoomJoinRepository;
	
	@Test
	public void getChatRoomTest() throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUserNum(1L);
//		Long[] roomNumList = chatRoomJoinRepository.getChatRoom(userVO);
//		
//		for (Long roomNum : roomNumList) {
//			System.out.println(roomNum);
//		}
	}
	
}
