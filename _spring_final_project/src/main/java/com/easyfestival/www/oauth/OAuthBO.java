package com.easyfestival.www.oauth;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.easyfestival.www.handler.OAuthHandler;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Component
public class OAuthBO{

	@Autowired
	private  OAuthHandler oh; // oauth관련 properties 파일 객체
	
	private String client_id;
	private String client_secret;
	private String redirect_url;
	private String code;
	private String login_url;
	private String token_url;
	private String profile_url;
	private String state;
	
    
	// https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&code=EIc5bFrl4RibFls1&state=9kgsGTfH4j7IyAkg  
    /* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String sns, String code, String state) throws IOException{

    	String sessionState = getSession(session);

        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        if(StringUtils.pathEquals(sessionState, state)){
        	
        	log.info("acessToken 요청 >>>>>>>>> code {} >>> state {}", code, state);
        	if(sns.equals("naver")) { // sns가 naver이면...
        		OAuth20Service oauthService = new ServiceBuilder()
        				.apiKey(oh.getNaverClientId())
        				.apiSecret(oh.getNaverClientSecret())
        				.callback(oh.getNaverRedirectUrl())
        				.state(state)
        				.build(NaverLoginApi.instance());
        		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
        		return accessToken;
        		
        	} else if(sns.equals("kakao")) { // sns가 kakao이면...
        		OAuth20Service oauthService = new ServiceBuilder()
        				.apiKey(oh.getKakaoClientId())
        				.apiSecret(oh.getKakaoClientSecret())
        				.callback(oh.getKakaoRedirectUrl())
        				.state(state)
        				.build(KakaoLoginApi.instance());
        		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
        		return accessToken;
        	} else if(sns.equals("google")) { // sns가 kakao이면...
        		OAuth20Service oauthService = new ServiceBuilder()
        				.apiKey(oh.getGoogleClientId())
        				.apiSecret(oh.getGoogleClientSecret())
        				.callback(oh.getGoogleRedirectUrl())
        				.state(state)
        				.build(GoogleLoginApi.instance());
        		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
        		return accessToken;
        	}

            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            log.info("acessToken >>>>>>>>>{}");
            
        }
        return null;
    }

    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken, String sns) throws IOException{

    	if(sns.equals("naver")) {
    		OAuth20Service oauthService = new ServiceBuilder()
    				.apiKey(oh.getNaverClientId())
    				.apiSecret(oh.getNaverClientSecret())
    				.callback(oh.getNaverRedirectUrl())
    				.build(NaverLoginApi.instance());
    		
    		OAuthRequest request = new OAuthRequest(Verb.GET, oh.getNaverProfileUrl(), oauthService);
    		oauthService.signRequest(oauthToken, request);
    		Response response = request.send();
    		return response.getBody();
    		
    	} else if(sns.equals("kakao")) {
    		OAuth20Service oauthService = new ServiceBuilder()
    				.apiKey(oh.getKakaoClientId())
    				.apiSecret(oh.getKakaoClientSecret())
    				.callback(oh.getKakaoRedirectUrl())
    				.build(KakaoLoginApi.instance());
    		
    		OAuthRequest request = new OAuthRequest(Verb.GET, oh.getKakaoProfileUrl(), oauthService);
    		oauthService.signRequest(oauthToken, request);
    		Response response = request.send();
    		return response.getBody();
    		
    	} else if(sns.equals("google")) {
    		OAuth20Service oauthService = new ServiceBuilder()
    				.apiKey(oh.getGoogleClientId())
    				.apiSecret(oh.getGoogleClientSecret())
    				.callback(oh.getGoogleRedirectUrl())
    				.build(GoogleLoginApi.instance());
    		
    		OAuthRequest request = new OAuthRequest(Verb.GET, oh.getGoogleProfileUrl(), oauthService);
    		oauthService.signRequest(oauthToken, request);
    		Response response = request.send();
    		return response.getBody();
    	}
		return null;
    }
    
    /* http session에서 데이터 가져오기 */ 
    private String getSession(HttpSession session){
        return (String) session.getAttribute("oauth_state");
    }



	
}
