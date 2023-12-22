package com.easyfestival.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfestival.www.domain.FavoriteDTO;
import com.easyfestival.www.domain.HelpDTO;
import com.easyfestival.www.domain.MemberShipVO;
import com.easyfestival.www.domain.OllPayDTO;
import com.easyfestival.www.domain.UserInfoDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.security.AuthVO;
import com.easyfestival.www.security.UserVO;
import com.easyfestival.www.service.HelpService;
import com.easyfestival.www.service.MailService;
import com.easyfestival.www.service.MemberShipService;
import com.easyfestival.www.service.OrderService;
import com.easyfestival.www.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/**")
@RequiredArgsConstructor // 자동 생성자 주입
public class UserController {

   private final UserService usv;
   private final HelpService hsv;
   private final MailService msv;
    private final MemberShipService memberShipService;
    private final OrderService oderService;
   private final BCryptPasswordEncoder bcEncoder; // password 암호화 객체
   
   @GetMapping("index")
   public String index() {
      return "redirect:index";
   }

   @GetMapping("join")
   public String joinUser() {
      return "/user/join";
   }

   @PostMapping("join")
   public String joinUser(UserVO uvo, RedirectAttributes re) {
      log.info(">>>>>>>>>>>>> join 도착 >>>>>>>>>>>>>>");

      uvo.setPwd(bcEncoder.encode(uvo.getPwd()));
      int isOk = usv.userJoin(uvo);
      AuthVO avo = new AuthVO();
      avo.setId(uvo.getId());
      avo.setAuth("ROLE_USER");
      isOk *= usv.authUser(avo);

      log.info("user join >>>>> " + (isOk > 0 ? "Success" : "Fail"));
      if (isOk > 0) {
         re.addFlashAttribute("message", 1); // 성공하면 메시지로 1 리턴
         re.addFlashAttribute("joinID", uvo.getId()); // 회원가입 완료 아이디 전달
         memberShipService.insertId(uvo.getId());
      }
      return "redirect:/";
   }

   @GetMapping(value = "checkId/{id}", produces = MediaType.TEXT_PLAIN_VALUE)
   public ResponseEntity<String> checkId(@PathVariable("id") String id, RedirectAttributes re) {
      if (id == null || id.isEmpty()) {
         return new ResponseEntity<String>("blankId", HttpStatus.INTERNAL_SERVER_ERROR);
      }
      UserVO duplicateID = usv.getId(id);
      return duplicateID != null ? new ResponseEntity<String>("2", HttpStatus.INTERNAL_SERVER_ERROR)
            : new ResponseEntity<String>("1", HttpStatus.OK);
   }

   @GetMapping("login")
   public String getLogin(Model model) {
      return "/user/login";
   }

   @PostMapping("login")
   public String postLogin(HttpServletRequest request, RedirectAttributes re) {
      // 로그인 실패시 다시 로그인 페이지로 돌아와 오류 메시지 전송
      // 다시 로그인 유도
      re.addAttribute("id", request.getAttribute("id"));
      re.addAttribute("errMsg", request.getAttribute("errMsg"));
      re.addFlashAttribute("loginFail", 2);
      return "redirect:/user/login";
   }

   @PostMapping("logout")
   public void logOut(HttpServletRequest request, HttpServletResponse response) {
      logout(request, response);
   }

   // 회원 리스트
   @GetMapping("list")
   public void getUserList(Model model, @RequestParam("pageNo") int pageNo) {
      int totalCount = usv.getUserCount(); // 총 유저수 구하기
      log.info("유저수 >>>>>> {}", totalCount);
      PagingHandler ph = new PagingHandler(pageNo, 10, 5, totalCount); // 페이지네이션 설정 핸들
      log.info("ph >>>>>> {}", ph.toString());

//      List<UserVO> uvoList = usv.getList(ph);
      List<UserInfoDTO> udtoList = usv.getUserList(ph);
      model.addAttribute("ph", ph);
      model.addAttribute("udtoList", udtoList);
   }

   // 회원정보 수정
   @GetMapping("modify")
   public void getUserModify() {
   }

   @PostMapping("modify")
   public String postUserModify(UserVO uvo, HttpSession session) {
      log.info("uvo >>>>> " + uvo);
      if (!uvo.getPwd().isEmpty()) {
         uvo.setPwd(bcEncoder.encode(uvo.getPwd()));
      }
      int isOk = usv.modifyUser(uvo);
      if (isOk > 0) {
         uvo = usv.getId(uvo.getId());
         session.setAttribute("uvo", uvo);
      }
      return "redirect:/";
   }

   // 회원탈퇴
   @GetMapping("delete/{id}")
   public String getDeleteUser(@PathVariable("id") String id, HttpServletRequest request,
         HttpServletResponse response) {
      int isOk = usv.deleteUser(id);
      if (isOk > 0) {
         log.info(">>>>>>>>>> 회원탈퇴 <<<<<<<<<");
      }
      logout(request, response);
      return "redirect:/";
   }

   // 마이페이지
   @GetMapping("detail")
   public void getDetailUser(HttpSession session, Model model) {
      UserVO uvo = (UserVO) session.getAttribute("uvo");
      // 문의사항 리스트
      List<HelpDTO> hList = hsv.getList(uvo.getId(), "");
      // 패키지상품 예약 리스트
      List<OllPayDTO> packageList = oderService.getPackageList(uvo.getId());
      // 멤버쉽 정보
      MemberShipVO msvo = memberShipService.getmemberShip(uvo.getId());
      // 관심상품 리스트
      List<FavoriteDTO> faList = usv.getFavoriteList(uvo.getId());
      model.addAttribute("msvo", msvo); // 멤버쉽정보
      model.addAttribute("hList", hList);
      model.addAttribute("packList", packageList);
      model.addAttribute("faList", faList);
   }

   // 아이디, 비밀번호 찾기
   @PostMapping(value = "searchAccount/{value}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
   public ResponseEntity<String> searchAccount(@PathVariable("value") String value, @RequestBody UserVO uvo) {
      log.info(" >>>>> searchAccount <<<<< ");
      String result = "";
      log.info("name >>>>> " + uvo.getName() + ", email >>>>> " + uvo.getEmail());
      UserVO searchUvo = usv.getId(uvo.getName(), uvo.getEmail());
      if (searchUvo == null) {
         log.info("search null >>>>> ");
         return ResponseEntity.ok("notFound");
      }

      if (value.equals("searchId")) {
         // 아이디 찾기면 sendId 메시지를 전달
         msv.sendEmail(searchUvo, value);
         result = "sendId";
      } else if (value.equals("searchPwd")) {
         // 비밀번호 찾기면 sendPwd 메시지를 전달
         msv.sendEmail(searchUvo, value);
         result = "sendPwd";
      }
      return ResponseEntity.ok(result);
   }

   // 시큐리티를 통한 로그아웃 메서드
   private void logout(HttpServletRequest request, HttpServletResponse response) {
      // 사용자 정보를 찾는 인자 ?
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      new SecurityContextLogoutHandler().logout(request, response, auth);
   }

}