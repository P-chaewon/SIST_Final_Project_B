package com.sist.b.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.b.chat.chatroom.ChatRoomJoinService;
import com.sist.b.chat.chatroom.ChatRoomJoinVO;
import com.sist.b.user.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
//@RequestMapping("/chat/**")
public class ChatController {
	
	@Autowired
	private ChatRoomJoinService chatRoomJoinService;
	
	private final SimpMessagingTemplate simpMessagingTemplate;

	
	@RequestMapping("/chat/{chatRoomNum}")
	public String goChat(@PathVariable("chatRoomNum") Long chatRoomNum, HttpServletRequest request) {
		System.out.println("go Chat");
		System.out.println(request.getHeader("REFERER"));
		
		return "chat/chat";
	}
	
	
	@GetMapping("/chat/newChat")
	public String getChatRoom(ChatRoomJoinVO chatRoomJoinVO, Long chatUserNum) throws Exception {
		
		chatRoomJoinVO.setUserNum(1L);
		
		Long chatRoomNum = chatRoomJoinService.newChatRoom(chatRoomJoinVO, chatUserNum);
		
		return "redirect:/chat/"+chatRoomNum;
	}
	
	
	/* chat form */
	@GetMapping("/chat")
	public ModelAndView chat(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
	    SecurityContextImpl sc = (SecurityContextImpl)object;
	    Authentication authentication = sc.getAuthentication();
	    UserVO userVO = (UserVO)authentication.getPrincipal(); 
		
		mv.addObject("userVO", userVO);
		mv.setViewName("chat/chat");
		
		return mv;
	}
	
	
	@MessageMapping("/chat")
	public ChatMessageVO greeting(ChatMessageVO chatMessageVO) {
		//System.out.println("nickname: " + chatMessageVO.getUserNickName() + ", contents: " + chatMessageVO.getContents());

	
		
		System.out.println("chat test!");
		simpMessagingTemplate.convertAndSend("/topic/"+chatMessageVO.getReciverNum(), chatMessageVO.getContents());
		
		
		return chatMessageVO;
	}
	
	
}
