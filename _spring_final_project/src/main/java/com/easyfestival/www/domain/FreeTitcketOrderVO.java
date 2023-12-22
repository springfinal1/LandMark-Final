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
public class FreeTitcketOrderVO {

	private long orderNum;
	private String id;
	private char airplane;
	private String arrival;
	private String cityCode;
	
	private String departureDay;
	private String arrivalDay;
	private String impUid;
	private String seatType;
	private String flightType;
	private long ftPrice;
	private long ftPeple;
	private String gate;
	
	

}
