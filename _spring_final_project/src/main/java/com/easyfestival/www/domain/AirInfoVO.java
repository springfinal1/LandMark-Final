package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AirInfoVO {
	
	// 해외 -> 인천
	private String airport; // 출발공항
	private String airportCode; // 공항코드
	private String airline; // 항공사
	private String scheduleDateTime; // 도착예정일자
	private String flightId; // 편명
	private String gatenumber; // 게이트

}
