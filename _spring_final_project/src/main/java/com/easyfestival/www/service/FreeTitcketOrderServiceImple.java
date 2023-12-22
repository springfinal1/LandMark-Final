package com.easyfestival.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.FreeTitcketOrderVO;
import com.easyfestival.www.repository.FreeTitcketOrderDAO;
import com.easyfestival.www.repository.FreetourDAO;

@Service
public class FreeTitcketOrderServiceImple implements FreeTitcketOrderService {

	@Inject
	private FreeTitcketOrderDAO ftodao;

	@Override
	public void insert_payinfo(FreeTitcketOrderVO freeTitcketOrderVO) {
		ftodao.insert_payinfo(freeTitcketOrderVO);

	}

	@Override
	public void update_num(FreeTitcketOrderVO freeTitcketOrderVO, String id) {
		ftodao.update_num(freeTitcketOrderVO, id);

	}

	@Override
	public List<FreeTitcketOrderVO> getFreeTicketList(String id) {
		return ftodao.getFreeTicketList(id);
	}

}
