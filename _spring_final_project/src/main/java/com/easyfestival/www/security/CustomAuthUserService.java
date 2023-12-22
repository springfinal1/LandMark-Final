package com.easyfestival.www.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.easyfestival.www.repository.UserDAO;

public class CustomAuthUserService implements UserDetailsService {

	@Inject
	private UserDAO udao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// username DB에 설정 되어있는 email인지 체크해서
		// 인증하여 해당 객체를 AuthMember롤 리턴
		UserVO uvo = udao.selectId(username);
		
		if(uvo == null) {
			throw new UsernameNotFoundException(username);
		}
		uvo.setAuthList(udao.selectAuths(username));
		return new AuthUser(uvo);
	}

}
