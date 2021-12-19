package com.sist.b.user;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.sist.b.util.FileManager;

@Service
public class UserService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private ServletContext servletContext;   
	@Autowired
	private JavaMailSender javaMailSender;
		
	public int setSignup(UserVO userVO) throws Exception {
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		int result = userRepository.setSignup(userVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNum", userVO.getUserNum());
		map.put("roleNum", 2);
		
		result = userRepository.setRoleInsert(map);
		
		return result;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(username);
		UserVO userVO = null;
		try {
			userVO = userRepository.getLogin(username);
			if(!userVO.isEnabled()) {
				
				int result = userRepository.setEnabled(userVO);
				userVO.setEnabled(true);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("LOGIN FAIL");
			e.printStackTrace();
		}
		if(userVO == null) {
			System.out.println("LOGIN FAIL");
			throw new UsernameNotFoundException(username);
		}
		
		return userVO;
	}
	
	public UserVO getSelectOne(String username) throws Exception {		
		return userRepository.getSelectOne(username);
	}
	
	public UserVO getUserInfo(Long userNum) throws Exception {
		return userRepository.getUserInfo(userNum);
	}
	
	public UserVO getIdCheck(UserVO userVO) throws Exception {
		return userRepository.getIdCheck(userVO);
	}
	
	public int setUpdate(UserVO userVO) throws Exception {
		
		UserVO persistance = userRepository.getSelectOne(userVO.getUsername());
		if(persistance==null) {
			throw new IllegalArgumentException("회원찾기 실패");
		}
		persistance.setEmail(userVO.getEmail());
		persistance.setPhone(userVO.getPhone());
		persistance.setNickname(userVO.getNickname());
		persistance.setWebsite(userVO.getWebsite());
		persistance.setIntroduction(userVO.getIntroduction());
		
		return userRepository.setUpdate(userVO);
	}
	
	public String setFileUpdate(UserVO userVO, MultipartFile file, HttpSession session) throws Exception {
		int result = 0;
		//세션에서 userVO 가져오기
		
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl securityContextImpl = (SecurityContextImpl)object;
		Authentication authentication = securityContextImpl.getAuthentication();
		userVO = (UserVO)authentication.getPrincipal();
		String fileName="";
		if(file != null && !file.isEmpty()) {
			fileName = fileManager.getUseServletContext("upload/user/", file);
			userVO.setFileName(fileName);
			
			result = userRepository.setFileUpdate(userVO);
		}		
		return fileName;
	}
	
	public int setFileDelte(UserVO userVO, HttpSession session) throws Exception {
		//삭제할 파일 경로
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		userVO = (UserVO)authentication.getPrincipal();
		
		String realPath = servletContext.getRealPath("upload/user/");
		File file = new File(realPath, userVO.getFileName());
		file.delete();
		//session에 저장
		userVO.setFileName("user.jpg");
		//DB에 저장
		return userRepository.setFileDelte(userVO);
	}
	
	public int setDelete(UserVO userVO) throws Exception {
		System.out.println(userVO.getPassword());
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		int result = userRepository.setDelete(userVO);
		return result;
	}

	public int setPasswordUpdate(UserVO userVO) throws Exception {
		UserVO persistance = userRepository.getSelectOne(userVO.getUsername());
		if(persistance==null) {
			throw new IllegalArgumentException("회원찾기 실패");
		}
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		persistance.setPassword(userVO.getPassword());
		System.out.println("PASSWORD UPDATE SUCCESS");
		return userRepository.setPasswordUpdate(userVO);
	}
	
	public boolean getPwCheck(HttpSession session, String pw) throws Exception {
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		UserVO userVO = (UserVO)authentication.getPrincipal();
		boolean check = passwordEncoder.matches(pw, userVO.getPassword());
		System.out.println(check);
		
		return check;
	}
		
	public int getAuthkey(String username, String authkey) throws Exception {
		Map<String, String> mailMap = new HashMap<String, String>();
		mailMap.put("username", username);
		mailMap.put("authkey", authkey);
		return userRepository.getAuthkey(mailMap);
	}
	
	//메일 보내기 email : to user, title : 메일 제목, content : 메일 내용
	public void sendMail(String email, String title,String content) throws Exception {
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);
		
		messageHelper.setFrom("sist.final@gmail.com");
		messageHelper.setTo(email);
		messageHelper.setSubject(title);
		message.setContent(content, "text/html;charset=euc-kr");
		javaMailSender.send(message);
		System.out.println("MAIL SUCCESS");
	}
	
	//임시 비밀번호 설정
	public String getTempPassword(int length) {
		int index = 0;
		char [] chars = new char [] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 
			'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 
			'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
		
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<length; i++) {
			index = (int) (chars.length * Math.random());
			sb.append(chars[index]);
		}
		
		return sb.toString();
	}
	
	public String getRandomNum() {
		Random random = new Random();
		int num = random.nextInt(999999);
		String number = Integer.toString(num);
		
		return number;
	}
		
	public String getUserIp() throws Exception {
		
        String ip = null;
        HttpServletRequest request = 
        ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

        ip = request.getHeader("X-Forwarded-For");
        
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("Proxy-Client-IP"); 
        } 
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("WL-Proxy-Client-IP"); 
        } 
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("HTTP_CLIENT_IP"); 
        } 
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("X-Real-IP"); 
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("X-RealIP"); 
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getRemoteAddr(); 
        }
		
		return ip;
	}
	
	public int setUnenabled(UserVO userVO) throws Exception {
		return userRepository.setUnenabled(userVO);
	}
	
	public int setEnabled(UserVO userVO) throws Exception {
		return userRepository.setEnabled(userVO);
	}
	
	// 로그인 로그 저장, 수정
	public int setLoginlog(UserlogVO userlogVO) throws Exception {
		return userRepository.setLoginlog(userlogVO);
	}
	
	public int setLogoutlog(UserlogVO userlogVO) throws Exception {
		return userRepository.setLogoutlog(userlogVO);
	}
	
	public List<UserlogVO> getUserlog(UserVO userVO) throws Exception {
		return userRepository.getUserlog(userVO);
	}
	
	/*
	 * getSearchUser
	 * 새로운 채팅 -- 유저 아이디 검색
	 */
	public List<UserVO> getSaerchUser(String searchText) throws Exception {
		return userRepository.getSearchUser(searchText);
	}
	
	public int setLogDelete(UserlogVO userlogVO) throws Exception {
		return userRepository.setLogDelete(userlogVO);
	}
	
	public Long getUserlogRecent(UserVO userVO) throws Exception {
		return userRepository.getUserlogRecent(userVO);
	}
	
}
