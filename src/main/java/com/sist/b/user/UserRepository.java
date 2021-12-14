package com.sist.b.user;

import java.util.List;
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
	public UserVO getSelectOne(String username) throws Exception;
	//회원 정보 수정하기
	public int setUpdate(UserVO userVO) throws Exception;
	//아이디 중복 검사
	public UserVO getIdCheck(UserVO userVO) throws Exception;
	//프로필 사진 등록
	public int setFileUpdate(UserVO userVO) throws Exception;
	//프로필 사진 삭제
	public int setFileDelte(UserVO userVO) throws Exception;
	//비밀번호 변경
	public int setPasswordUpdate(UserVO userVO) throws Exception;
	//화원 탈퇴
	public int setDelete(UserVO userVO) throws Exception;
	//비활성 계정으로 전환
	public int setDeleteTemporary(UserVO userVO) throws Exception;
	//활성 계정으로 전환
	public int setEnabledInsert(UserVO userVO) throws Exception;
	//관리자 : 계정 차단
	public int setUnenabled(UserVO userVO) throws Exception;
	//관리자 : 계정 차단 해제
	public int setEnabled(UserVO userVO) throws Exception;
	
	
	//아이디로 유저 검색
	public List<UserVO> getSearchUser(String searchText) throws Exception;

}
