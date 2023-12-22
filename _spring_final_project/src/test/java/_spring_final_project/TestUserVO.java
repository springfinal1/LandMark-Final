package _spring_final_project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easyfestival.www.config.RootConfig;
import com.easyfestival.www.repository.UserDAO;
import com.easyfestival.www.security.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class TestUserVO {
	@Autowired
	private UserDAO udao;
	@Test
	public void boardRegisterTest() {
		
		for(int i = 0; i < 250; i++) {
			UserVO uvo = new UserVO();
			uvo.setId("TestUser"+i);
			uvo.setPwd("1234");
			uvo.setAge(i);
			uvo.setName("아무개");
			uvo.setPhoneNumber("0100000000");
			uvo.setEmail("email"+i+"@google.com");
			udao.join(uvo);
		}
	}
}
