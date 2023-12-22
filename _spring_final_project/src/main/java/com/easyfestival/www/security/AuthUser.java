package com.easyfestival.www.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Getter
@Slf4j
public class AuthUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private UserVO uvo;
	
	public AuthUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public AuthUser(UserVO uvo) {
		super(uvo.getId(), uvo.getPwd(), uvo.getAuthList()
				.stream().map(authVO-> new SimpleGrantedAuthority(authVO.getAuth()))
				.collect(Collectors.toList()));
		this.uvo = uvo;
	}
}