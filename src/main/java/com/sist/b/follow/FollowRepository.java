package com.sist.b.follow;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sist.b.user.UserVO;

@Mapper
public interface FollowRepository {
	
	public List<UserVO> userList(UserVO userVO) throws Exception;
	//팔로우 추가
	public int follow(FollowVO followVO) throws Exception;

}
