package com.sist.b.user;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	//회원가입
	public int setSignup(UserVO userVO) throws Exception;
	
	//회원 권한 설정
	public int setRoleInsert(Map<String, Object> map) throws Exception;
	
	public UserVO getLogin(String username) throws Exception;

}
