package com.sist.b.follow;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
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
	
	public int unFollow(FollowVO followVO) throws Exception {
		return followRepository.unFollow(followVO);
	}
	
	public List<UserVO> myFollowList(UserVO userVO) throws Exception {
		return followRepository.myFollowList(userVO);
	}
	
	public List<UserVO> myFollowerList(UserVO userVO) throws Exception {
		
		return followRepository.myFollowerList(userVO);
	}
	
	public List<Long> followNum(UserVO userVO) throws Exception {
		return followRepository.followNum(userVO);
	}
	
	public boolean followCheck(UserVO userVO, HttpSession session) throws Exception {
		System.out.println(userVO.getUserNum());
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		//로그인 되어 있는 유저의 정보를 가지고 있는 userVO
		UserVO loginUserVO = (UserVO)authentication.getPrincipal();

		//나를 팔로우 하고 있는 유저
		List<UserVO> followUsers = followRepository.myFollowList(loginUserVO);
		boolean check = false;
		
		for(UserVO followUserVO : followUsers) {
			if(followUserVO.getUserNum()==userVO.getUserNum()) {
				
				check = true;
			}
		}
		return check;
	}
	
	public Long followCount(Long userNum) throws Exception {
		return followRepository.followCount(userNum);
	}
	
	public Long follwerCount(Long followNum) throws Exception {
		return followRepository.followerCount(followNum);
	}

}
