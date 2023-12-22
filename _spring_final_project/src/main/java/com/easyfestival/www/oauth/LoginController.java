package com.easyfestival.www.oauth;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfestival.www.handler.OAuthHandler;
import com.easyfestival.www.repository.UserDAO;
import com.easyfestival.www.security.AuthUser;
import com.easyfestival.www.security.AuthVO;
import com.easyfestival.www.security.UserVO;
import com.easyfestival.www.service.UserServiceImpl;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/login/oauth2/**")
@RequiredArgsConstructor
public class LoginController {

	private final UserServiceImpl usv;
	private final UserDAO udao;
	private final OAuthHandler oh;
	private final BCryptPasswordEncoder bcEncoder;
	
	// OAuthBO
	private final OAuthBO oauthBO;
	private String apiResult;
	
	// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id={clientID}&state={state}&redirect_uri={redirectUrl}
	// 네이버 로그인 요청
	@GetMapping(value = "naverLogin", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OAuthBO> naverLogin(RedirectAttributes re, HttpSession session) {
		UUID uuid = UUID.randomUUID(); // state 암호화용도
		String state = uuid.toString().substring(0, 5);
		session.setAttribute("oauth_state", state);
		oauthBO.setClient_id(oh.getNaverClientId());
		oauthBO.setRedirect_url(oh.getNaverRedirectUrl());
		oauthBO.setLogin_url(oh.getNaverLoginUrl());
		oauthBO.setState(state);
		log.info("naverUrl >>>>> {}", oauthBO);
		return new ResponseEntity<OAuthBO>(oauthBO, HttpStatus.OK);
	}
	
	// https://kauth.kakao.com/oauth/authorize?response_type=code&client_id={clientID}&state={state}&redirect_uri={redirectUrl}
	// 카카오 로그인 요청
	@GetMapping(value = "kakaoLogin", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OAuthBO> kakaoLogin(RedirectAttributes re, HttpSession session) {
		UUID uuid = UUID.randomUUID(); // state 암호화용도
		String state = uuid.toString().substring(0, 5);
		session.setAttribute("oauth_state", state);
		oauthBO.setClient_id(oh.getKakaoClientId());
		oauthBO.setRedirect_url(oh.getKakaoRedirectUrl());
		oauthBO.setLogin_url(oh.getKakaoLoginUrl());
		oauthBO.setState(state);
		log.info("kakaoUrl >>>>> {}", oauthBO);
		return new ResponseEntity<OAuthBO>(oauthBO, HttpStatus.OK);
	}
	
	//https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id={client_id}&redirect_uri={redirect_url}&scope=email profile
	// 구글 로그인 요청
	@GetMapping(value = "googleLogin", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OAuthBO> googleLogin(RedirectAttributes re, HttpSession session) {
		UUID uuid = UUID.randomUUID(); // state 암호화용도
		String state = uuid.toString().substring(0, 5);
		session.setAttribute("oauth_state", state);
		oauthBO.setClient_id(oh.getGoogleClientId());
		oauthBO.setRedirect_url(oh.getGoogleRedirectUrl());
		oauthBO.setLogin_url(oh.getGoogleLoginUrl());
		oauthBO.setState(state);
		log.info("googleUrl >>>>> {}", oauthBO);
		return new ResponseEntity<OAuthBO>(oauthBO, HttpStatus.OK);
	}
	
	// http://localhost:8088/login/oauth2/code/naver?code=nne7Ebo27ZOyx7C7k8&state=9a8b3f
	// http://localhost:8088/login/oauth2/code/naver?code={code}&state={state}
	// 요청한 code, state 정보 받기 -> AccessToken 받기 -> Profile 요청
	@RequestMapping(value="code/{sns}", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model,@PathVariable("sns")String sns, @RequestParam String code, @RequestParam String state, HttpSession session
			, HttpServletRequest request) throws IOException, ParseException {
		log.info("code 도착 {}, state 도착 {}", code, state);
		OAuth2AccessToken oauthToken;
        oauthToken = oauthBO.getAccessToken(session, sns, code, state); // sns => naver / kakao sns명
        log.info("oauthToken 도착 {}", oauthToken.toString());
        
        //로그인 사용자 정보를 읽어온다.
	    apiResult = oauthBO.getUserProfile(oauthToken, sns);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        log.info("result json info >>>>>> {}", jsonObj.toJSONString());
        String email = "";
        String name = "";
        String birthYear = "";
        String phoneNumber = "";
        
        if(sns.equals("naver")) { // 네이버 콜백시...
        	JSONObject response_obj = (JSONObject) jsonObj.get("response"); // 네이버 키값(response) 안에 email..name => json객체 저장
        	
        	email = (String)response_obj.get("email"); // email
        	name = (String)response_obj.get("name"); // name
        	birthYear = (String)response_obj.get("birthyear"); // 1988
        	phoneNumber = (String)response_obj.get("mobile"); // 010-000-0000
        	
        } else if(sns.equals("kakao")) { // 카카오 콜백시...
        	JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account"); // 카카오 키값(kakao_account) 안에 email..name.. => json객체 저장
        	
        	email = (String)response_obj.get("email"); // email
        	name = (String)response_obj.get("name"); // name
        	birthYear = (String)response_obj.get("birthyear"); // 1988
        	phoneNumber = (String)response_obj.get("phone_number"); // 010-000-0000
        	
        } else if(sns.equals("google")) { // 구글 콜백시... // 구글은 바로 해당 정보를 key값으로 바로 추출
        	email = (String) jsonObj.get("email"); 
        	name = (String)jsonObj.get("name"); // name => Jinbae Moon
        	name = name.replace(" ", ""); // 공뱅제거
        	birthYear = "구글회원";
        	phoneNumber = "구글회원";
        }
        
        // 이미 가입 되어있는지 확인
        UserVO uvo = usv.getId(email);
        // 값이 없으면 DB에 가입처리
        if(uvo == null) {
        	// 하단의 UserVO 설정 메서드 호출
        	uvo = setUser(email, name, birthYear, phoneNumber, session);
        	// 가입 처리
        	usv.userJoin(uvo); // DB에 회원가입 저장
        	AuthVO avo = new AuthVO();
        	avo.setId(uvo.getId());
        	avo.setAuth("ROLE_OAUTH");
        	usv.authUser(avo); // DB에 권한 저장
        	uvo.setAuthList(udao.selectAuths(uvo.getId())); // AuthVO 셋팅
        }else {
        	// 가입되어 있으면 AuthVO 권한만 셋팅
        	uvo.setAuthList(udao.selectAuths(uvo.getId()));
        }
        // 하단의 시큐리티 권한 설정 메서드 호출해서 시큐리티 권한 부여
        securityAuthorization(uvo, request, session);
        
        /* 네이버 로그인 성공 페이지 View 호출 */
		return "redirect:/";
		
	}
	
	
	
	// UserVO 설정 메서드
	public UserVO setUser(String email, String name, String birthYear, String phoneNumber, HttpSession session) {
		LocalDate date = LocalDate.now(); // 현재 날짜
		int year = date.getYear(); // 현재 년도 추출
		if(phoneNumber.contains(" ")) {
			phoneNumber = phoneNumber.substring(phoneNumber.indexOf(" ")); // 카카오는 +82 10-000-0000 형식으로 들어옴 빈문자열 있을시 제거하고 0으르 바꿔줌
			phoneNumber = phoneNumber.replace(" ", "0");
		}
		phoneNumber = phoneNumber.replace("-", ""); // 0100000000 포맷으로 변경
		int age;
		if(birthYear.equals("구글회원") || phoneNumber.equals("구글회원")) {
			age = 0;
		} else {
			age = year - Integer.parseInt(birthYear); // 현재년도 - 출생년도 = 나이
		}
        
        UserVO uvo = new UserVO(); // user 객체
        uvo.setId(email); // email을 id와 병행 사용
        uvo.setPwd(bcEncoder.encode(""));
        uvo.setName(name); // 이름
        uvo.setEmail(email); // 이메일
        uvo.setAge(age); // 나이
        uvo.setPhoneNumber(phoneNumber); // 연락처
		return uvo;
	}
	
	
	// security 권한 설정 권한부여
	public void securityAuthorization(UserVO uvo, HttpServletRequest request, HttpSession session) {
		
		// 로그인 유저 권한 확인
        AuthUser OauthUser = new AuthUser(uvo);
        
        // oauth 로그인 유저에게 시큐리티 권한 부여
        Authentication authentication = new UsernamePasswordAuthenticationToken(OauthUser, null, OauthUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		// user 세션에 등록
		session.setAttribute("uvo", uvo);
		log.info("UserVO >> {}", uvo);
		Principal principal = request.getUserPrincipal(); // 시큐리티 적용 확인용
		log.info("principal >>>>> {}", principal);
		
	}
	
	
	
	
	
	
	
	
	
}
