package com.easyfestival.www.repository;


import java.util.List;

import com.easyfestival.www.domain.FreeTitcketOrderVO;

public interface FreeTitcketOrderDAO {

	void insert_payinfo(FreeTitcketOrderVO freeTitcketOrderVO);

	void update_num(FreeTitcketOrderVO freeTitcketOrderVO, String id);

	List<FreeTitcketOrderVO> getFreeTicketList(String id);

}
