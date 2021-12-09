package com.sist.b.follow;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sist.b.user.UserVO;

@Mapper
public interface FollowRepository {
	//내가 팔로우하고 있지 않은 모든 유저
	public List<UserVO> userList(UserVO userVO) throws Exception;
	//팔로우 추가
	public int follow(FollowVO followVO) throws Exception;
	//팔로우 삭제
	public int unFollow(FollowVO followVO) throws Exception;
	//팔로우 하고 있는 유저
	public List<UserVO> myFollowList(UserVO userVO) throws Exception;
	//팔로우 당한 유저
	public List<UserVO> myFollowerList(UserVO userVO) throws Exception;
	//내가 팔로우 하고 있고 나를 팔로우 하고 있는 사람들의 목록
	public List<Long> followNum(UserVO userVO) throws Exception;
	//팔로우 수
	public Long followCount(Long userNum) throws Exception;
	//팔로워 수
	public Long followerCount(Long followNum) throws Exception;
}
