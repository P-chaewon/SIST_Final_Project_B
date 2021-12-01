package com.sist.b.chat;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
//@EnableWebSocket
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	@Override
	  public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 클라이언트로 메시지 응답시 prefix 
		registry.enableSimpleBroker("/topic");
	    
	    // 클라이언트에서 메시지 보낼 시 붙여 줄 prefix
		registry.setApplicationDestinationPrefixes("/app");
	  }

	  @Override
	  public void registerStompEndpoints(StompEndpointRegistry registry) {
		  
		  // end point url
		  registry.addEndpoint("/websocket").setAllowedOriginPatterns("*").withSockJS();
	  }
}
