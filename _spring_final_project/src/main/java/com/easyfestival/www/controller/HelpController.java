package com.easyfestival.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfestival.www.domain.HelpDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.security.AuthVO;
import com.easyfestival.www.security.UserVO;
import com.easyfestival.www.service.HelpService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/help/**")
public class HelpController {
	
	private final HelpService hsv;
	
	@GetMapping("register")
	public void getHelpRegister() {}
	
	
	@PostMapping("register")
	public String postHelpRegister(HelpDTO hdto, RedirectAttributes re) {
		int isOk = hsv.helpRegister(hdto);
		if(isOk > 0) {
			re.addFlashAttribute("success", 1);
		}
		return "redirect:/";
	}
	
	// 고객게시판 페이지
	@GetMapping("customerCenter")
	public void getCustomerCenter() {}
	
	@GetMapping("list")
	public void getHelpList(HttpSession session, Model model, @RequestParam("pageNo")int pageNo, @RequestParam("answer")String answer) {
		List<HelpDTO> hList = null;
		UserVO uvo = (UserVO) session.getAttribute("uvo");
		int totalCount; // 총 문의글 수 가져오기
		PagingHandler ph = null; // 페이지네이션 설정 핸들러
		log.info("answer >>>>>>>>>>>>>>> {}", answer);
		for (AuthVO auth : uvo.getAuthList()) {
			// 관리자는 모든 사용자의 문의내역 받음
			if(auth.getAuth().equals("ROLE_ADMIN")) {
				totalCount = hsv.getHelpCount("", answer);
				ph = new PagingHandler(pageNo, 10, 5, totalCount);
				hList = hsv.getListAndPaging("", answer, ph);
				break;
			}
			totalCount = hsv.getHelpCount(uvo.getId(), answer);
			ph = new PagingHandler(pageNo, 10, 5, totalCount);
			hList = hsv.getListAndPaging(uvo.getId(), answer, ph);
		}
		model.addAttribute("ph", ph);
		model.addAttribute("hList", hList);
	}
	
	@GetMapping("detail")
	public void getHelpDetail(@RequestParam("helpNo")long helpNo, Model model) {
		HelpDTO hdto = hsv.getDetail(helpNo);
		model.addAttribute("hdto", hdto);
	}
	
	@PostMapping("coment")
	public String registerAnswer(HelpDTO hdto) {
		int isOk = hsv.registerAnswer(hdto.getHelpNo(), hdto.getComent());
		return "redirect:/help/list?pageNo=1&answer=";
	}
}
