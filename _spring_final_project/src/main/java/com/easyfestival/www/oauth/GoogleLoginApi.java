package com.easyfestival.www.oauth;

import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class GoogleLoginApi extends DefaultApi20 {
	
    protected GoogleLoginApi(){
    }

    private static class InstanceHolder{
        private static final GoogleLoginApi INSTANCE = new GoogleLoginApi();
    }


    public static GoogleLoginApi instance(){
        return InstanceHolder.INSTANCE;
    }


	@Override
	public String getAccessTokenEndpoint() {
		log.info("GOOGLE TokenEndPoint >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return "https://oauth2.googleapis.com/token";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		log.info("GOOGLE getAuthorizationBaseUrl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return "https://accounts.google.com/o/oauth2/v2/auth";
	}

	
}
