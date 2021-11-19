package com.sist.b.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
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
	
	public UserVO getSelectOne(Long userNum) throws Exception {
		return userRepository.getSelectOne(userNum);
	}
	
	public UserVO getIdCheck(UserVO userVO) throws Exception {
		return userRepository.getIdCheck(userVO);
	}
	
	

}
