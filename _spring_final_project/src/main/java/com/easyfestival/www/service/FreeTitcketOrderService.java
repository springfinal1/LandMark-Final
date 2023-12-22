package com.easyfestival.www.service;

import java.util.List;

import com.easyfestival.www.domain.FreeTitcketOrderVO;

public interface FreeTitcketOrderService {

	void insert_payinfo(FreeTitcketOrderVO freeTitcketOrderVO);

	void update_num(FreeTitcketOrderVO freeTitcketOrderVO, String id);

	List<FreeTitcketOrderVO> getFreeTicketList(String id);

}
