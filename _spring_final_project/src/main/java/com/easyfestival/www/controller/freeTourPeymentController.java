package com.easyfestival.www.controller;

import java.io.IOException;
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

import com.easyfestival.www.domain.FreeTitcketOrderVO;
import com.easyfestival.www.domain.OrderVO;
import com.easyfestival.www.domain.PayDTO;
import com.easyfestival.www.security.UserVO;
import com.easyfestival.www.service.FreeTitcketOrderService;
import com.easyfestival.www.service.MemberShipService;
import com.easyfestival.www.service.OrderService;
import com.easyfestival.www.service.PayService;
import com.easyfestival.www.service.ProductService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping(value = "/freeTourPeyment/*")
public class freeTourPeymentController {
	

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
	
	public freeTourPeymentController() {
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("7820725586500628",
				"P9nYyc55RyknowCswTwMrhHUdHc2A0MJJGTjzuEGbUjsmm9XFl60NOBNleO8eljJn82tjH4O7I0kKQdr");
	}
	
	
	
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	@ResponseBody
	public int paymentComplete(HttpSession session, String imp_uid, String merchant_uid, String totalPrice,
			 @RequestBody FreeTitcketOrderVO freeTitcketOrderVO) throws Exception {
		log.info(" orderDTO >>>> {}", freeTitcketOrderVO);
		String token = payService.getToken();
		
		log.info(" tocen >>>> {}", token);

		String amount = payService.paymentInfo(freeTitcketOrderVO.getImpUid(), token);
		log.info("============amount >>>> {}", amount);

		int res = 1;

		if (freeTitcketOrderVO.getFtPrice() != Long.parseLong(amount)) {
			System.out.println(freeTitcketOrderVO.getFtPrice());
			res = 0;
			// 결제 취소
			
			payService.payMentCancle(token, freeTitcketOrderVO.getImpUid(), amount, "결제 금액 오류");
			return res;
		}
		
		/*
		 * orderService.freeinfo_pay(freeTitcketOrderVO);
		 */
		freeTitcketOrderService.insert_payinfo(freeTitcketOrderVO);
		
		
		orderService.freeinfo_pay(freeTitcketOrderVO);
		
		
//		freeTitcketOrderVO.setOrderNum(orderVO.getOrderNum());
		
//		freeTitcketOrderService.update_num(freeTitcketOrderVO, orderVO.getId());
		return res;

	}
	
	
	@RequestMapping(value = "/peverifyIamport/{imp_uid}")
	@ResponseBody
	// 검증구간
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}
	
	
	
	@PostMapping("/PeyReservation")
	public String handleReservation(@RequestParam("ftPrice") String ftPrice,
			@RequestParam("departureDay") String departureDay, @RequestParam("arrivalDay") String arrivalDay,
			@RequestParam("seatType") String seatType, @RequestParam("flightType") String flightType,
			@RequestParam("tfPeple") String tfPeple, @RequestParam("arrival") String arrival, @RequestParam("date") String date, @RequestParam("gate") String gate, 
			@RequestParam("cityCode") String cityCode, @RequestParam("airlineArr") String airlineArr, @RequestParam("flightIdArr") String flightIdArr, 
			@RequestParam("airlineDep") String airlineDep, @RequestParam("flightIdDep") String flightIdDep,
			RedirectAttributes redirectAttributes, HttpSession session, Model model) {
		
		
		
		FreeTitcketOrderVO freeTitcketOrderVO = new FreeTitcketOrderVO();
		long ftPriceA = Long.parseLong(ftPrice);
		long tfPepleA = Long.parseLong(tfPeple);
		
		System.out.println("date" + date); 
		
		String[] dateArray = date.split("~");
		
		departureDay = dateArray[0].trim();
		
		arrivalDay = dateArray[1].trim();
		
		
		freeTitcketOrderVO.setArrival(arrival); // 도착공항
		System.out.println("arruval" + arrival);
		freeTitcketOrderVO.setFtPrice(ftPriceA); //가격
		freeTitcketOrderVO.setDepartureDay(departureDay); // 출발일
		freeTitcketOrderVO.setArrivalDay(arrivalDay); // 도착일
		freeTitcketOrderVO.setSeatType(seatType); // 좌석타입
		freeTitcketOrderVO.setFlightType(flightType); // 왕복 편도
		freeTitcketOrderVO.setFtPeple(tfPepleA); // 인원
		freeTitcketOrderVO.setGate(gate);
		freeTitcketOrderVO.setCityCode(cityCode);
		freeTitcketOrderVO.setId(((UserVO) session.getAttribute("uvo")).getId());
		freeTitcketOrderVO.setAirlineArr(airlineArr);
		freeTitcketOrderVO.setFlightIdArr(flightIdArr);
		freeTitcketOrderVO.setAirlineDep(airlineDep);
		freeTitcketOrderVO.setFlightIdDep(flightIdDep);
		
		System.out.println("freeTitcketOrderVO" + freeTitcketOrderVO);
		model.addAttribute(freeTitcketOrderVO);

		// 여기에서 폼 데이터를 사용하여 원하는 로직 수행
		return "/package/PeyReservation";
		/* return "redirect:/peyment/PeyReservation"; */
	}
	


}
