package com.easyfestival.www.service;

import com.easyfestival.www.security.UserVO;

public interface MailService {

	void sendEmail(UserVO uvo, String value);

}
