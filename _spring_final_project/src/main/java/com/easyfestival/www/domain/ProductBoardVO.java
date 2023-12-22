package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductBoardVO {
	
	// package
	private long pkNo; // 패키지기본키 
	private String pkName; // 상품제목
	private String pkContent; // 상품내용
	private long pkPrice; // 상품가격
	private String pkContinent; // 패키지 대륙

	// airplane
	private long apPrice; // 비행기가격
	private String apArrival; // 출발
	private String apDeparture; // 도착
	
	// place
	private String plCountry; // 국가
	private String plName; // 지역
	private String plContinent; // 대륙
	
	// festival
	private String fvName; // 축제이름
	private long fvPrice; // 축제 참가비
	
	// hotel
	private String htName; // 호텔명
	private long htPrice; // 호텔가격
	
	
	
}
