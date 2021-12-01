package com.sist.b.follow;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.b.user.UserVO;


@Service
public class FollowService {
	
	@Autowired
	private FollowRepository followRepository;
	
	public List<UserVO> userList(UserVO userVO) throws Exception {
		return followRepository.userList(userVO);
	}
	
	public int follow(FollowVO followVO) throws Exception {
		return followRepository.follow(followVO);
	}
	
	public List<UserVO> myFollowList(UserVO userVO) throws Exception {
		return followRepository.myFollowList(userVO);
	}

}
