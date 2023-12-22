package com.easyfestival.www.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootConfig.class, SecurityConfig.class, MailConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		// servlet 맵핑 루트로 설정
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		// 인코딩 필터 설정
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		encodingFilter.setForceEncoding(true); // 외부로 나가는 데이터 인코딩 설정
		return new Filter[] {encodingFilter};
	}

	@Override
	protected void customizeRegistration(ServletRegistration.Dynamic registration) {
		// 그 외 기타 사용자 설정
		// 사용자 지정 exception 설정을 할것인지 처리
		registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");
		
		// 파일 업로드 설정
		// 경로, maxFileSize, maxRequestSize, fileSizeThreshold
		//  String uploadLocation = "C:\\Users\\UserK\\_myweb\\_java\\fileupload"; 
		String uploadLocation = "C:\\landmark_upload"; //  파일 업로드 경로 등록
		int maxFileSize = 1024 * 1024 * 20; // 20MB  업로드 되는 파일의 max 크기 20M=(1024*1024*20)
		int maxRequestSize = maxFileSize * 2; // 40MB  한번의에 올릴수 있는 최대 크기 40M=(1024*1024*40)(보통 max-file-size 의 2배)
		int fileSizeThreshold = maxFileSize; // 20MB  특정 사이즈의 메모리 사용 20M=(1024*1024*20) (보통 max-file-size 와 동일)
		
		MultipartConfigElement multipartConfig = new MultipartConfigElement(uploadLocation, maxFileSize, maxRequestSize, fileSizeThreshold);
		registration.setMultipartConfig(multipartConfig);
	}

}
