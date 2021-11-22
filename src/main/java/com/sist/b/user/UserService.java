package com.sist.b.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	public int setFileUpdate(UserVO userVO, MultipartFile file) throws Exception {
		int result = 0;
		if(file != null && file.isEmpty()) {
			String fileName = fileManager.getUseServletContext("upload/user", file);
			userVO.setFileName(fileName);
			
			result = userRepository.setFileUpdate(userVO);
		}
		
		return result;
	}
	
	

}
