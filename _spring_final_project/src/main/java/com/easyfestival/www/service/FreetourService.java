package com.easyfestival.www.service;

import java.util.List;

import com.easyfestival.www.domain.AirplaneDTO;

public interface FreetourService {

	List<AirplaneDTO> getSearch(String place);

	String getDepartureAirport(String departureAirport);

	String getArrivalAirport(String arrivalAirport);

	int getPrice(String arrival);

}
