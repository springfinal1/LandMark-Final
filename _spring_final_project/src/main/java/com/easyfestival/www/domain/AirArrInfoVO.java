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
public class AirArrInfoVO {
	
	// 인천 - > 해외
	private String airport; // 도착하는 공항
	private String airportCode; // 공항코드
	private String airline; // 항공사
	private String scheduleDateTime; // 출발예정일자 시간
	private String flightId; // 편명
	private String gatenumber; // 게이트
}
