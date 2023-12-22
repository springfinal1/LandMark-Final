package com.easyfestival.www.domain;

import java.util.List;

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
public class ProductListDTO {
	
	
	private PackageVO packvo;
	private AirplaneVO avo;
	private PlaceVO plvo;
	private HotelVO hvo;
	private FestivalVO fvo;
	private List<ProductFileVO> pfList;
	
	
	
	
}
