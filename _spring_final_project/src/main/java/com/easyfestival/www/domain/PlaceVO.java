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
public class PlaceVO {
	
	private long plNo;
	private String plName;
	private String plCountry;
	private long pkNo;
	private String plContinent; // 대륙
}
