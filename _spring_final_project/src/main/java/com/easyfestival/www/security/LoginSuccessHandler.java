package com.easyfestival.www.security;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import com.easyfestival.www.service.UserService;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Getter
	@Setter
	private String authId;
	@Getter
	@Setter
	private String authUrl;
	
	// redirect로 데이터를 가져가는 역할(RedirectStrategy)
	private RedirectStrategy rdstg = new DefaultRedirectStrategy();
	// 실제 로그인 정보, 경로 등을 저장
	private RequestCache reqCache = new HttpSessionRequestCache();
	
	@Inject	
	private UserService usv;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		setAuthId(authentication.getName()); // setAuthEmail => setAuthUser
		setAuthUrl("/");
		
//		boolean isOk = usv.updateLastLogin(getAuthId()); // getAuthEmail => getAuthUser
		UserVO uvo = usv.getId(authId);
		// 내부에서 로그인 세션 저장됨.
		
		HttpSession ses = request.getSession();
		uvo.setAuthList(usv.selectAuths(authId));
		// 로그인 사용자 세션에 저장
		ses.setAttribute("uvo", uvo);
		log.info("loginSuccess >>> ses >>> " + ses.toString());
		
		// 시큐리티에서 로그인 값이 없다면 null로 저장될 수 있음.
		if(ses == null) { // boolean isOk 제거( !isOK }
			return;
		} else {
			// 시큐리티에서 로그인을 시도하면 시도한 로그인에 대한 기록이 남게됨.
			// 이전 시도한 시큐리티의 로그인 인증 실패 기록 삭제
			ses.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		SavedRequest saveReq = reqCache.getRequest(request, response);
		rdstg.sendRedirect(request, response, (saveReq != null ? saveReq.getRedirectUrl() : getAuthUrl()));
		
	}
	
}
