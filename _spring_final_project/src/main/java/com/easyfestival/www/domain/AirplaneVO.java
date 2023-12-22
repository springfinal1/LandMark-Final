package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AirplaneVO {
	
	private long apNo;
	private long pkNo;
	private long apPrice;
	private String apArrival;
	private String apDeparture;
}
