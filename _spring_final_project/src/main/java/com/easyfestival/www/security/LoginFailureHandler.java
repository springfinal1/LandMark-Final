package com.easyfestival.www.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@Getter
@Setter
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String authId; // authEmail => authUser
	private String errorMessage;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		setAuthId(request.getParameter("id")); // email => Id
		
		// exception 발생시 메시지 저장
		if(exception instanceof BadCredentialsException ||
				exception instanceof InternalAuthenticationServiceException) {
			setErrorMessage(exception.getMessage().toString());
		}
		log.info(">>>>>>>> error Message >>> " + errorMessage);
		// 기존 email 에서 user로 변경
		request.setAttribute("id", getAuthId());
		request.setAttribute("errMsg", getErrorMessage());
		// 기존 멤버에서 user로 변경
		request.getRequestDispatcher("/user/login?error").forward(request, response);
	}

}
