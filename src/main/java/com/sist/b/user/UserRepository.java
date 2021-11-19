package com.sist.b.user;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	//회원가입
	public int setSignup(UserVO userVO) throws Exception;	
	//회원 권한 설정
	public int setRoleInsert(Map<String, Object> map) throws Exception;
	//로그인
	public UserVO getLogin(String username) throws Exception;
	//회원 정보 가져오기
	public UserVO getSelectOne(Long userNum) throws Exception;
	//회원 정보 수정하기
	public int setUpdate(UserVO userVO) throws Exception;
	//아이디 중복 검사
	public UserVO getIdCheck(UserVO userVO) throws Exception;

}
