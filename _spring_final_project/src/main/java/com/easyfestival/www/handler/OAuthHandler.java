package com.easyfestival.www.handler;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Component
@PropertySource({"classpath:oauth.properties", "classpath:mail.properties"})
public class OAuthHandler {
	// oauth.properties 안에 저장되어 있는 정보 핸들러
	
	@Value("${naver_client_id}") String naverClientId;
	@Value("${naver_client_secret}") String naverClientSecret;
	@Value("${naver_redirect_url}") String naverRedirectUrl;
	@Value("${naver_login_url}") String naverLoginUrl;
	@Value("${naver_token_url}") String naverTokenUrl;
	@Value("${naver_profile_url}") String naverProfileUrl;
	
	@Value("${kakao_client_id}") String kakaoClientId;
	@Value("${kakao_client_secret}") String kakaoClientSecret;
	@Value("${kakao_redirect_url}") String kakaoRedirectUrl;
	@Value("${kakao_login_url}") String kakaoLoginUrl;
	@Value("${kakao_token_url}") String kakaoTokenUrl;
	@Value("${kakao_profile_url}") String kakaoProfileUrl;
	
	
	@Value("${google_client_id}") String googleClientId;
	@Value("${google_client_secret}") String googleClientSecret;
	@Value("${google_redirect_url}") String googleRedirectUrl;
	@Value("${google_login_url}") String googleLoginUrl;
	@Value("${google_token_url}") String googleTokenUrl;
	@Value("${google_profile_url}") String googleProfileUrl;
	
	// mail.properties 저장 정보
	@Value("${google_mail_id}") String googleId;
	@Value("${google_mail_pwd}") String googlePwd;
}
