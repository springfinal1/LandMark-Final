package com.easyfestival.www.service;

import java.util.List;

import com.easyfestival.www.domain.HelpDTO;
import com.easyfestival.www.handler.PagingHandler;

public interface HelpService {

	int helpRegister(HelpDTO hdto);

	List<HelpDTO> getList(String id, String answer);

	HelpDTO getDetail(long helpNo);

	int getHelpCount(String id, String answer);

	List<HelpDTO> getListAndPaging(String id, String answer, PagingHandler ph);

	int registerAnswer(long helpNo, String coment);
	
}
