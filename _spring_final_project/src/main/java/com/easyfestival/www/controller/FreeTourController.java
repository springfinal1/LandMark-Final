package com.easyfestival.www.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easyfestival.www.domain.AirArrInfoVO;
import com.easyfestival.www.domain.AirInfoVO;
import com.easyfestival.www.domain.AirplaneDTO;
import com.easyfestival.www.domain.AirplaneInfoVO;
import com.easyfestival.www.handler.FreetourHandler;
import com.easyfestival.www.service.FreetourService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/freetour/*")
public class FreeTourController {
   
   @Inject
   private FreetourService fsv;
   
   @Inject
   private FreetourHandler fhd;
   
   @GetMapping("air")
   public String air() {
      return "/freetour/air";
   }
   
   @GetMapping(value="/search/{place}" , produces = MediaType.APPLICATION_JSON_VALUE)
   public ResponseEntity<List<AirplaneDTO>> searchPlace(@PathVariable String place){
      
      List<AirplaneDTO> searchVal = fsv.getSearch(place);
   
      
      return new ResponseEntity<List<AirplaneDTO>>(searchVal,HttpStatus.OK);
   }
   
   @PostMapping("city")
   public String getCity(AirplaneInfoVO aivo, Model m, String pepleCount) throws IOException, ParseException {
 

		log.info(aivo+"<<<<<<<<<<<aivo");
		
		// 일반 프리미엄일반 비즈니스 일등 (100 150 200 300) / 
		// 가격 설정 =>((기본 가격)*(좌석))*인원수) 왕복이면 x2 편도면 그대로 
		int ticketPrice = fsv.getPrice(aivo.getArrival());
		log.info(ticketPrice+"티켓가격<<<<<<<<");
		
		int seatPrice = 0; // 좌석별 가격 배율
		
		if(aivo.getSeat().equals("일반석")) {
			seatPrice = 1;
		}else if(aivo.getSeat().equals("프리미엄 일반석")) {
			seatPrice = 2;
		}else if(aivo.getSeat().equals("비즈니스석")) {
			seatPrice = 3;
		}else if(aivo.getSeat().equals("일등석")) {
			seatPrice = 4;
		}
		
		int verification = 1;  // 편도면 1 왕복이면 2
		
		if(aivo.getVerification().equals("편도")) {
			verification = 1;
		}else if(aivo.getVerification().equals("왕복")) {
			verification = 2;
		}
		
		int finalPrice = ((ticketPrice * seatPrice) * (int)(aivo.getPeple()))*verification;
		log.info(finalPrice+"최종 결제 금액");
		aivo.setPrice(finalPrice);
		

		String departureAirport = aivo.getDeparture(); // 출발공항		
		m.addAttribute("startAirport", departureAirport);
		String arrivalAirport = aivo.getArrival(); // 도착공항
		m.addAttribute("endAirport", arrivalAirport);
		
		//공항 코드 구하기
		String departureAirportCode = fsv.getDepartureAirport(arrivalAirport);		
		String arrivalAirportCode = fsv.getArrivalAirport(arrivalAirport);
		
		m.addAttribute("dep", departureAirportCode);
		m.addAttribute("arr", arrivalAirportCode);
		
		
		List<AirInfoVO> depInfo = fhd.getDepartureInfo(arrivalAirportCode, aivo); // 출발 정보 / 인천 -> 해외
		List<AirArrInfoVO> arrInfo = fhd.getArrivalInfo(departureAirportCode, aivo); // 도착 정보 / 해외 -> 인천
		
		
		m.addAttribute("aivo", aivo);
		//100 150 200 300
		
		if(arrInfo != null) {			
			m.addAttribute("arrInfo", arrInfo);
		}else {
			m.addAttribute("arrInfo", "noAirInfo");
		}
		
		
		if(depInfo != null) {							
			m.addAttribute("depInfo", depInfo);
		}else {
			m.addAttribute("depInfo", "noAirInfo");
		}
		
		return "/freetour/city";
	}
	
	@GetMapping("theme")
	public String theme(Model m,@RequestParam("type") int type) {
		log.info(type+"타입<<<<<<<<<<<");
		m.addAttribute("type", type);
		
		
		return "/freetour/theme";
	}
	
	
}

