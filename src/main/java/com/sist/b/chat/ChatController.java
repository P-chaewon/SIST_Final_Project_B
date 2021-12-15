package com.sist.b.chat;

import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	
	
	/************** 채팅방 모달창 유저 검색 *****************/
	@GetMapping("/chat/getSearchUser")
	public ModelAndView getSearchUser(HttpSession session, String searchText) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
	    SecurityContextImpl sc = (SecurityContextImpl)object;
	    Authentication authentication = sc.getAuthentication();
	    UserVO userVO = (UserVO)authentication.getPrincipal(); 
		
//		System.out.println("searchText:" + searchText);
		List<UserVO> list = chatRoomJoinService.getSaerchUser(searchText);
		
		mv.addObject("searchUserList", list);
		mv.setViewName("chat/searchUserList");
		return mv;
	}
	/****************************************************/
	
	
	/***************************** 채팅방 *****************************/
	@RequestMapping("/chat/t/{chatRoomNum}")
	public ModelAndView goChat(@PathVariable("chatRoomNum") Long chatRoomNum, 
			HttpSession session, ChatRoomJoinVO chatRoomJoinVO, HttpServletRequest request) throws Exception {
		System.out.println("go Chat");
		
		ModelAndView mv = new ModelAndView();
		
		/* ************** GET으로 들어왔을 때 ************** */
		if (request.getHeader("REFERER") == null) {			
			mv.setViewName("redirect:../inbox");
			return mv;
		}
		/* ************************************************* */
		
		
		
		System.out.println("chatRoomJoinVO"+chatRoomJoinVO);
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
	    SecurityContextImpl sc = (SecurityContextImpl)object;
	    Authentication authentication = sc.getAuthentication();
	    UserVO userVO = (UserVO)authentication.getPrincipal(); 
	    
//	    System.out.println(chatRoomJoinVO.getUserNum());
		
	    mv.addObject("userVO", userVO);
	    mv.addObject("receiverNum", chatRoomJoinVO.getUserNum());
	    mv.setViewName("chat/chatForm");
	    
		return mv;
	}
	

	
	@GetMapping("/chat/newChat")
	public String getChatRoom(HttpSession session, ChatRoomJoinVO chatRoomJoinVO, Long myUserNum, RedirectAttributes rttr) throws Exception {
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
	    SecurityContextImpl sc = (SecurityContextImpl)object;
	    Authentication authentication = sc.getAuthentication();
	    UserVO userVO = (UserVO)authentication.getPrincipal(); 
		
//	    System.out.println("userNum:"+chatRoomJoinVO.getUserNum());
	    
		Long chatRoomNum = chatRoomJoinService.newChatRoom(chatRoomJoinVO, userVO.getUserNum());
		
		rttr.addFlashAttribute("chatRoomJoinVO", chatRoomJoinVO);
		return "redirect:/chat/t/"+chatRoomNum;
	}
	
	/*********** 채팅폼 -- 사용 X 삭제  *********************/
	@GetMapping("/getChatForm")
	public ModelAndView getChatForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("chat/chatForm");
		
		return mv;
	}
	/*******************************************************/
	
	/* 채팅하고있는 유저 리스트 가져옴 */
	@GetMapping("/chat/getChatUserList")
	public ModelAndView getChatUserList(HttpSession session) throws Exception {
		System.out.println("getChatUserList");
		ModelAndView mv = new ModelAndView();
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
	    SecurityContextImpl sc = (SecurityContextImpl)object;
	    Authentication authentication = sc.getAuthentication();
	    UserVO userVO = (UserVO)authentication.getPrincipal(); 

	    
		List<ChatRoomJoinVO> ar = chatRoomJoinService.getChatUserList(userVO);
		
		
		
		mv.addObject("list", ar);
		mv.setViewName("chat/chatUserList");
		
		return mv;
	}
	
	
	/* 채팅 첫 화면 */
	@GetMapping("/chat/inbox")
	public ModelAndView chat(HttpSession session) throws Exception {
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
	public void sendMessage(ChatMessageVO chatMessageVO) throws Exception {
		//System.out.println("nickname: " + chatMessageVO.getUserNickName() + ", contents: " + chatMessageVO.getContents());

		//String receiver = message.getReceiver();
	    //chatMessageService.save(message);
	    //simpMessagingTemplate.convertAndSend("/topic/" + receiver,message);
		
		System.out.println("chat test!");
		System.out.println("chat Receiver:"+chatMessageVO.getReceiverNum());
		System.out.println("chat message:"+chatMessageVO.getContents());
		simpMessagingTemplate.convertAndSend("/topic/"+chatMessageVO.getReceiverNum(), chatMessageVO);
		
		
	}
	
	
}
