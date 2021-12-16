package com.sist.b.chat.chatroom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.chat.ChatMessageVO;
import com.sist.b.user.UserRepository;
import com.sist.b.user.UserVO;

@Service
public class ChatRoomJoinService {

	@Autowired
	private ChatRoomJoinRepository chatRoomJoinRepository;

	@Autowired
	private UserRepository userRepository;
	
	
	/*
	 * getChatMessage
	 * 채팅 메시지 불러오기
	 */
	public List<ChatMessageVO> getChatMessage(ChatMessageVO chatMessageVO) throws Exception {
		return chatRoomJoinRepository.getChatMessage(chatMessageVO);
	}
	
	
	/*
	 * setChatMessage
	 * 채팅 메시지 저장
	 */
	public int setChatMessage(ChatMessageVO chatMessageVO) throws Exception {
		return chatRoomJoinRepository.setChatMessage(chatMessageVO);
	}
	
	
	
	
	
	/*
	 * getChatUserList
	 * 나와 채팅에 참여하고 있는 유저를 구함
	 * ******* sujin
	 */
	public List<ChatRoomJoinVO> getChatUserList(UserVO userVO) throws Exception {
		return chatRoomJoinRepository.getChatUserList(userVO);
	}
	
	
	/*
	 * newChatRoom
	 * 대화 상대와의 채팅방이 존재하지 않을 경우
	 * 새로운 채팅방을 만든다.
	 * ******* 2021.11.26 sujin
	 */
	public Long newChatRoom(ChatRoomJoinVO chatRoomJoinVO, Long myUserNum) throws Exception {
		// test용 객체 나중에 세션으로 적용하고 지우기 //
	
		//채팅하려는 사람 유저번호
		System.out.println("userNum::::"+chatRoomJoinVO.getUserNum());
		
		
		// 채팅방번호
		Long chatRoomNum = null;
		
		// 채팅 상대의 유저가 참여중인 채팅방번호리스트 저장
		Long[] roomNumList = chatRoomJoinRepository.getChatRoomNum(myUserNum);
		
		// 나-상대방 채팅방 존재할 시 1 없으면 0
		int count = 0;
		
		if (roomNumList.length > 0) {
			for (Long roomNum : roomNumList) {
				chatRoomJoinVO.setRoomNum(roomNum);
				count = chatRoomJoinRepository.getChatRoom(chatRoomJoinVO);
				
				// 같이 참여하는 채팅방 존재
				if (count > 0) {
					chatRoomNum = chatRoomJoinVO.getRoomNum();
				}
			}
		} 
		
		// 채팅방 리스트가 하나도 존재하지 않거나, 같이 참여하는 채팅방이 없을 경우
		if (roomNumList.length == 0 || chatRoomNum == null) {
			// 새로운 채팅방 만들기
			System.out.println("new ChatRoom");
			
			// 얘를 굳이 ChatRoomVO로 파라미터를 줘야할까???? 생각해보기...
			ChatRoomVO chatRoomVO = new ChatRoomVO();
			chatRoomJoinRepository.setNewChatRoom(chatRoomVO);
			
			chatRoomNum = chatRoomVO.getRoomNum();
			System.out.println("생성된 채팅방번호: " + chatRoomNum);
		
			// 채팅방 관계 만들어주기
			chatRoomJoinVO.setRoomNum(chatRoomNum);
			chatRoomJoinRepository.setChatRoomJoin(chatRoomJoinVO);
			
			chatRoomJoinVO.setUserNum(myUserNum);
			chatRoomJoinRepository.setChatRoomJoin(chatRoomJoinVO);
		}
		
		
		System.out.println("채팅방번호: " + chatRoomNum);
		
		return chatRoomNum;
		
	}
	
}
