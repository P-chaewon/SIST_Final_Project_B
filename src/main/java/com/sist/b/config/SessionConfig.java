package com.sist.b.config;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Component;

import com.sist.b.user.UserService;
import com.sist.b.user.UserVO;
import com.sist.b.user.UserlogVO;

@Component
@WebListener
public class SessionConfig implements HttpSessionListener{

	@Autowired
	private UserService userService;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("Session Created");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		UserlogVO userlogVO = new UserlogVO();
		try {
			userlogVO.setUserlogNum(userService.getUserlogRecent(userVO));
			int result = userService.setLogoutlog(userlogVO);
			if(result>0) {
				System.out.println("Logout Update Success");
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Session Destroyed");
	}
}

