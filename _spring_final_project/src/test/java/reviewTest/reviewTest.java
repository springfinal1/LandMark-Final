package reviewTest;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easyfestival.www.domain.reviewVO;
import com.easyfestival.www.repository.ReviewDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.easyfestival.www.config.RootConfig.class})
public class reviewTest 
{
	@Inject
	private ReviewDAO rdao;
	
	@Test
	public void insertReview()
	{
		for(int i=1;i<=300;i++)
		{
			reviewVO rvo=new reviewVO();
			rvo.setTitle("test title"+i);
			rvo.setContent("test content");
			rvo.setId("test id");
			rdao.reviewRegister(rvo);
		}
	}
	
}
