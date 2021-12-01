package com.sist.b.chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {

	//웹소켓 세션 담아놓을 맵
	Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	
	//메시지 수신시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) {
		String msg = message.getPayload();
		
		for (String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			
			try {
				//webSocketSession.sendMessage(message);
				wss.sendMessage(new TextMessage(msg));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	
	//웹소켓 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
	}
	
	//웹소켓 종료시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
	}
	
}
