package com.easyfestival.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.AirplaneDTO;
import com.easyfestival.www.repository.FreetourDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreetourServiceImpl implements FreetourService{
	
	@Inject
	private FreetourDAO fdao;
	
	@Override
	public List<AirplaneDTO> getSearch(String place) {
		log.info("FreeTour Service Impl (Place)!!!! ::"+place);
		return fdao.getSearch(place);
	}

	@Override
	public String getDepartureAirport(String departureAirport) {
		// TODO Auto-generated method stub
		return fdao.getDepartureAirport(departureAirport);
	}

	@Override
	public String getArrivalAirport(String arrivalAirport) {
		// TODO Auto-generated method stub
		return fdao.getArrivalAirport(arrivalAirport);
	}

	@Override
	public int getPrice(String arrival) {
		// TODO Auto-generated method stub
		return fdao.getPrice(arrival);
	}

}
