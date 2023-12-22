package com.easyfestival.www.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.easyfestival.www.security.CustomAuthUserService;
import com.easyfestival.www.security.LoginFailureHandler;
import com.easyfestival.www.security.LoginSuccessHandler;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity // 스프링 시큐리티 필터가 스프링 필터체인에 등록됨
public class SecurityConfig extends WebSecurityConfigurerAdapter {
   // security package를 생성하여 사용자 핸들러 생성
   
   // password 암호화 객체 빈 생성
   @Bean
   public PasswordEncoder bcPasswordEncoder() {
      return new BCryptPasswordEncoder();
   }
   // SuccessHandler 빈 객체 생성 => 사용자가 생성
   @Bean
   public AuthenticationSuccessHandler authSuccessHandler() {
      return new LoginSuccessHandler();
   }
   // FailureHandler 빈 객체 생성 => 사용자가 생성
   @Bean
   public AuthenticationFailureHandler authFailureHandler() {
      return new LoginFailureHandler();
   }
   
   // userDetail 빈 객체 생성 => 사용자가 생성
   @Bean
   public UserDetailsService customUserService() {
      return new CustomAuthUserService();
   }
   
   
   @Override
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.userDetailsService(customUserService())
      .passwordEncoder(bcPasswordEncoder());
   }

   @Override
   protected void configure(HttpSecurity http) throws Exception {
      http.csrf().disable();
      // http 승인 요청
      http.authorizeRequests().antMatchers("/user/list").hasRole("ADMIN") // 관리자 권한
      .antMatchers("/user/modify").hasRole("USER") // 일반 회원
      .antMatchers("/","/resources/**","/user/join","/user/login","/user/checkId/*"
            ,"/package/**","/product/**","/product_upload/**","/review/**","/freetour/**"
            ,"/login/oauth2/**","/help/customerCenter","/user/searchAccount/*","/static/list").permitAll() // 모든 이용자 권한
      .anyRequest().authenticated(); // => 인증된 사용자만 처리
      
      // 커스텀 로그인 페이지 구성
      // controller에 주소요청 맵핑도 같이 꼭 적어줘야 함
      http.formLogin()
      .usernameParameter("id") // username을 id로 설정
      .passwordParameter("pwd") // password를 pwd로 설정
      .loginPage("/user/login") // 로그인을 담당할 페이지
      .successHandler(authSuccessHandler()) // 로그인 성공시 authSuccessHandler() 호출
      .failureHandler(authFailureHandler()); // 로그인 실패시 authFailureHandler() 호출

      
      // 로그아웃
      http.logout()
      .logoutUrl("/user/logout") // 로그아웃 
      .invalidateHttpSession(true) // 로그아웃시 세션 끊기
      .deleteCookies("JSESSIONID")
      .logoutSuccessUrl("/"); // 로그아웃시 이동할 페이지
   }
}