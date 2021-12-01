package com.sist.b.chat.chatroom;

import org.apache.ibatis.annotations.Mapper;

import com.sist.b.user.UserVO;

@Mapper
public interface ChatRoomJoinRepository {
	
	// 채팅방 관계 만들어주기
	public int setChatRoomJoin(ChatRoomJoinVO chatRoomJoinVO) throws Exception;
	
	// 채팅방 개설
	public Long setNewChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	
	// getChatRoomNum으로 가져온 채팅방 번호로 같이 참여하고 있는 채팅방이 있는지 
	public int getChatRoom(ChatRoomJoinVO chatRoomJoinVO) throws Exception;
	
	// 유저가 속한 채팅방 번호 가져오기
	public Long[] getChatRoomNum(Long ChatUserNum) throws Exception;
}
