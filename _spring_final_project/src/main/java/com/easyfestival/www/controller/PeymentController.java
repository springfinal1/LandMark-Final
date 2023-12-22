package com.easyfestival.www.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfestival.www.domain.AirplaneInfoVO;
import com.easyfestival.www.domain.FreeTitcketOrderVO;
import com.easyfestival.www.domain.MemberShipVO;
import com.easyfestival.www.domain.OllPayDTO;
import com.easyfestival.www.domain.OrderVO;
import com.easyfestival.www.domain.PayDTO;
import com.easyfestival.www.domain.ProductListDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.security.UserVO;
import com.easyfestival.www.service.FreeTitcketOrderService;
import com.easyfestival.www.service.MemberShipService;
import com.easyfestival.www.service.OrderService;
import com.easyfestival.www.service.PayService;
import com.easyfestival.www.service.ProductService;
import com.mysql.cj.Session;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/peyment/*")
public class PeymentController {

	@Value("7820725586500628")
	private String apiKey;

	@Value("P9nYyc55RyknowCswTwMrhHUdHc2A0MJJGTjzuEGbUjsmm9XFl60NOBNleO8eljJn82tjH4O7I0kKQdr")
	private String secretKey;

	private IamportClient api = new IamportClient(apiKey, secretKey);

	@Autowired
	private PayService payService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;

	@Autowired
	private MemberShipService memberShipService;
	
	@Autowired
	private FreeTitcketOrderService freeTitcketOrderService;

	public PeymentController() {
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("7820725586500628",
				"P9nYyc55RyknowCswTwMrhHUdHc2A0MJJGTjzuEGbUjsmm9XFl60NOBNleO8eljJn82tjH4O7I0kKQdr");
	}

	@GetMapping("/peyDetail")
	public String getDetail(@RequestParam("pkNo") long pkNo, @RequestParam("userCount") long userCount,
			HttpSession session, Model model) {

		List<ProductListDTO> pldto = productService.getdtoDetail(pkNo);

		model.addAttribute("pldto", pldto.get(0));

		long memberPrice = pldto.get(0).getPackvo().getPkPrice() * userCount;

		MemberShipVO msVo = memberShipService.getmemberShip(((UserVO) session.getAttribute("uvo")).getId());

		long memberDiscountPrice = Math.round(msVo.getMemberDiscountRate() * memberPrice);

		long lastTotalCount = (int) (memberPrice - memberDiscountPrice);

		model.addAttribute("memShp", msVo);

		model.addAttribute("memberDiscountPrice", memberDiscountPrice);

		model.addAttribute("memberPrice", memberPrice);

		model.addAttribute("userCount", userCount);

		model.addAttribute("lastTotalCount", lastTotalCount);

		return "/package/peyDetail";
	}

	@GetMapping("/OrderList")
	public String myOrder(HttpSession session, Model model, @RequestParam("pageNo") int pageNo) throws Exception {

		System.out.println("myorderList");
		String svNum = ((UserVO) session.getAttribute("uvo")).getId();

		int totalCount = orderService.OrderCount(svNum); // 총 유저수 가하기

		PagingHandler ph = new PagingHandler(pageNo, 2, 5, totalCount); // 페이지네이션 설정 핸들

		log.info("글수 >>>>>> {}", totalCount);
		List<OllPayDTO> ollList = orderService.ollOrder(ph, svNum);

		log.info("ollList >>>>>> {}", ollList.size());

		log.info("ph >>>>>> {}", ph);

		model.addAttribute("ph", ph);

		model.addAttribute("ollList", ollList);

		return "/package/OrderList";
	}

	@RequestMapping(value = "/peverifyIamport/{imp_uid}")
	@ResponseBody
	// 검증구간
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}
	
	

	@PostMapping("orderCancle")
	@ResponseBody
	public int orderCancle(OrderVO orderVO, PayDTO payDTO) throws Exception {

		System.out.println("1111 : " + orderVO);
		System.out.println("1111 : " + orderVO.getImpUid());
		System.out.println("1111 : " + orderVO.getOrderNum());
		System.out.println("1111 : " + orderVO.getTotalPrice());

		orderVO = orderService.adminList(orderVO);

		System.out.println("2222 : " + orderVO);
		System.out.println("2222 : " + orderVO.getImpUid());
		System.out.println("2222 : " + orderVO.getOrderNum());
		System.out.println("2222 : " + orderVO.getTotalPrice());

		int result1 = orderService.payMentCancle(payDTO);
		System.out.println("rrr");

		int result = orderService.orderCancle(orderVO);

		int result2 = memberShipService.pointCancle(orderVO); // 사용한 포인트 환불

		int result3 = memberShipService.ollCancle(orderVO);

		if (result > 0) {
			System.out.println("예약 DB 삭제성공");
		}
		if (result1 > 0) {
			System.out.println("Pay DB 삭제성공");
		}
		if (result2 > 0) {
			System.out.println("point DB 삭제 완료");
		}

		return result;
	}

	@RequestMapping(value = "/confirmation", method = RequestMethod.POST)
	@ResponseBody
	public String paymentComplete(@RequestBody OrderVO orderVO, HttpSession session) throws Exception {

		orderVO = orderService.adminList(orderVO);

		System.out.println(orderVO);

		int result = memberShipService.insert_point(orderVO);

		int result2 = orderService.updateY(orderVO);

		char updateYN = orderVO.getConfirmation();

		String resultString = String.valueOf(updateYN);
		System.out.println(resultString);
		if (result > 0) {
			System.out.println("구매 확정 포인트 등록 성공");
		}
		if (result2 > 0) {
			System.out.println("업데이트 성공");
		}

		return resultString;
	}

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	@ResponseBody
	public int paymentComplete(HttpSession session, String imp_uid, String merchant_uid, String totalPrice,
			@RequestBody OrderVO orderVO) throws Exception {
		log.info(" orderDTO >>>> {}", orderVO);
		String token = payService.getToken();
		
		log.info(" tocen >>>> {}", token);

		String amount = payService.paymentInfo(orderVO.getImpUid(), token);
		log.info("============amount >>>> {}", amount);

		int res = 1;

		if (orderVO.getTotalPrice() != Long.parseLong(amount)) {
			System.out.println(orderVO.getTotalPrice());
			res = 0;
			// 결제 취소
			payService.payMentCancle(token, orderVO.getImpUid(), amount, "결제 금액 오류");
			return res;
		}
		
		
		
		orderService.insert_pay(orderVO);
		
		return res;

	}

	@GetMapping("/complete")
	public String getOrderComplete(@RequestParam long payNum, OrderVO orderVO, HttpSession session, Model model)
			throws Exception {

		System.out.println("404에러 ");
		PayDTO payDTO = orderService.getPay(payNum);
		model.addAttribute("payDTO", payDTO);

		List<ProductListDTO> pldto = productService.getdtoDetail(payDTO.getPkNo());
		System.out.println("들어오나????" + payDTO.getPkNo());
		System.out.println("pldto >>>>>" + pldto.get(0));
		model.addAttribute("pldto", pldto.get(0));

		MemberShipVO msVo = memberShipService.getmemberShip(((UserVO) session.getAttribute("uvo")).getId());
		model.addAttribute("msVo", msVo);

		String svNum = ((UserVO) session.getAttribute("uvo")).getId();
		int totalCount = orderService.OrderCount(svNum);
		model.addAttribute("totalCount", totalCount);
		log.info("유저수 >>>>>> {}", totalCount);

		return "redirect:/peyment/OrderList?pageNo=1";
	}

	@GetMapping("/getList")
	public String getOrderGetList(@RequestParam long orderNum, HttpSession session, Model model) {

		MemberShipVO msVo = memberShipService.getmemberShip(((UserVO) session.getAttribute("uvo")).getId());

		model.addAttribute("msVo", msVo);

		List<OllPayDTO> ollList = orderService.ollList(orderNum);

		log.info("ollList >>>>>> {}", ollList);

		model.addAttribute("ollList", ollList);

		model.addAttribute("orderNum", orderNum);

		return "/package/complete";
	}

	@RequestMapping(value = "pay_info", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Long> payInfoPOST(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam String imp_uid, HttpSession session, @RequestParam long pkNo,
			@RequestParam String enteredPoints) throws Exception {
		
		IamportResponse<Payment> result = api.paymentByImpUid(imp_uid);
		PayDTO payDTO = new PayDTO();
		long point = 0; // 기본값 설정

		if (enteredPoints != null && !enteredPoints.isEmpty()) {
			try {
				point = Long.parseLong(enteredPoints);
				System.out.println("포인트 제대로 들어옴 ? +" + point);
			} catch (NumberFormatException e) {
				e.printStackTrace(); // 또는 로깅 등을 통해 예외를 기록할 수 있음
			}
		}

		System.out.println(((UserVO) session.getAttribute("uvo")).getId());
		payDTO.setId(((UserVO) session.getAttribute("uvo")).getId());
		payDTO.setOrderNum(Long.parseLong(result.getResponse().getMerchantUid()));
		payDTO.setPayMethod(result.getResponse().getPayMethod());
		payDTO.setProductName(result.getResponse().getName());
		System.out.println("result.getResponse().getName()" + result.getResponse().getName());
		payDTO.setPayAmount(result.getResponse().getAmount().longValue());
		payDTO.setPkNo(pkNo);
		payDTO.setSayongPointeu(point);
		orderService.insert_payinfo(payDTO);

		payDTO = orderService.getLastPay(payDTO);
		System.out.println("이건" + payDTO);

		int isOK = memberShipService.updateMemberShip(((UserVO) session.getAttribute("uvo")).getId(), point);

		return new ResponseEntity<Long>(payDTO.getPayNum(), HttpStatus.OK);
	}

	@PostMapping("payMentCancel")
	@ResponseBody
	public int payMentCancle(OrderVO orderVO) throws Exception {
		int result = 0;
		System.out.println("payMentCancel" + orderVO);
		System.out.println("1 : " + orderVO.getOrderNum());
		if (orderVO.getOrderNum() != null) {
			result = 1;
		}
		return result;
	}

	@GetMapping("/status")
	public ResponseEntity<String> getOrderStatus(@RequestParam Long orderNum) {
		// 서비스를 통해 데이터베이스에서 주문 상태를 가져옴
		String orderStatus = orderService.getConfirmation(orderNum);

		// 문자열 형식으로 반환
		return new ResponseEntity<>(orderStatus, HttpStatus.OK);
	}


}
