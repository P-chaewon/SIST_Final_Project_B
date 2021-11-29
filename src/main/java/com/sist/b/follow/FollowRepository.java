package com.sist.b.follow;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sist.b.user.UserVO;

@Mapper
public interface FollowRepository {
	
	public Long followCount(FollowVO followVO) throws Exception;
	
	public List<UserVO> userList() throws Exception;

}
