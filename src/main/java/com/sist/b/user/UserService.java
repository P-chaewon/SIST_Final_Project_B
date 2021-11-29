package com.sist.b.user;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
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
	private ResourceLoader resourceLoader;
		
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
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(userVO == null) {
			throw new UsernameNotFoundException(username);
		}
		
		return userVO;
	}
	
	public UserVO getSelectOne(String username) throws Exception {		
		return userRepository.getSelectOne(username);
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
			fileName = fileManager.getUseResourceLoader("upload/user/", file);
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
		String path = "classpath:/static/";
		File file = new File(resourceLoader.getResource(path).getFile(), "upload/user/");
		file = new File(file, userVO.getFileName());
		file.delete();
		
		return userRepository.setFileDelte(userVO);
	}
	
	public int setDelete(UserVO userVO) throws Exception {
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		int result = userRepository.setDelete(userVO);
		System.out.println("Serivce");
		System.out.println(result);
		return result;
	}

	public int setPasswordUpdate(UserVO userVO) throws Exception {
		UserVO persistance = userRepository.getSelectOne(userVO.getUsername());
		if(persistance==null) {
			throw new IllegalArgumentException("회원찾기 실패");
		}
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		persistance.setPassword(userVO.getPassword());
				
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
	
	public int setDeleteTemporary(UserVO userVO) throws Exception {
		return userRepository.setDeleteTemporary(userVO);
	}
	
	
}
