package com.sist.b.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.sist.b.follow.FollowVO;

import lombok.Data;

@Data
public class UserVO implements UserDetails{
	
	private Long userNum;
	private String phone;
	private String email;
	private String nickname;
	private String username;
	private String password;
	private String fileName;
	private String website;
	private String introduction;
	private boolean enabled;
	//가입 인증 번호
	private String authkey;
	//활성계정 비활성계정 확인
	private boolean activate;
	//follow 여부 확인
	private boolean following;
	//userlist 개수
	private Integer userCount;
	
	
	private List<RoleVO> roles;

	private List<FollowVO> follows;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for(RoleVO roleVO:roles) {
			authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));
		}
		return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	

}
