package com.easyfestival.www.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.easyfestival.www.handler.OAuthHandler;

@Configuration
public class MailConfig {
	
	@Autowired
	private OAuthHandler oh;
	
	@Bean
	public JavaMailSender getMailSender() {
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		
        String from = oh.getGoogleId(); // 보내는 사람의 이메일 주소
        String password = oh.getGooglePwd();// 보내는 사람의 이메일 계정 비밀번호
        String host = "smtp.gmail.com"; // 구글 메일 서버 호스트 이름
        
        mailSender.setHost(host);
        mailSender.setPort(587);
        mailSender.setUsername(from);
        mailSender.setPassword(password);
        
        // SMTP 프로토콜 설정
		Properties javaMailProperties = new Properties();
		
		javaMailProperties.put("mail.smtp.starttls.enable", "true");
		javaMailProperties.put("mail.smtp.auth", "true");
		javaMailProperties.put("mail.transport.protocol", "smtp");
		javaMailProperties.put("mail.debug", "true");
		
		mailSender.setJavaMailProperties(javaMailProperties);
		
		return mailSender;
	}


}
