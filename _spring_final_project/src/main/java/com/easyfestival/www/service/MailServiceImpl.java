package com.easyfestival.www.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.easyfestival.www.repository.UserDAO;
import com.easyfestival.www.security.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService{

	private final UserDAO udao;
	private final JavaMailSender mailSender;
	private final PasswordEncoder bcEncoder;
	
	@Override
	public void sendEmail(UserVO uvo, String value) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(uvo.getEmail());
			if(value.equals("searchId")) {
				helper.setSubject("LANDMARK 아이디 찾기");
				helper.setText("귀하의 아이디는 ( "+uvo.getId()+" ) 입니다.");
			}else if(value.equals("searchPwd")) {
				helper.setSubject("LANDMARK 임시비밀번호 발급");
				Random ran = new Random();
				String tmpPwd = String.valueOf(ran.nextInt());
				log.info("rnadom >>>> {}", tmpPwd);
				helper.setText("발급된 임시비밀번호는 ( " + tmpPwd + " ) 입니다.");
				uvo.setPwd(bcEncoder.encode(tmpPwd));
				udao.modifyUser(uvo);
			}
			mailSender.send(message);
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}

}
