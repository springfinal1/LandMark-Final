package com.easyfestival.www.oauth;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class KakaoLoginApi extends DefaultApi20 {
	
    protected KakaoLoginApi(){
    }

    private static class InstanceHolder{
        private static final KakaoLoginApi INSTANCE = new KakaoLoginApi();
    }


    public static KakaoLoginApi instance(){
        return InstanceHolder.INSTANCE;
    }


	@Override
	public String getAccessTokenEndpoint() {
		log.info("KAKAO TokenEndPoint >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return "https://kauth.kakao.com/oauth/token";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		log.info("KAKAO getAuthorizationBaseUrl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return "https://kauth.kakao.com/oauth/authorize";
	}

	
}
