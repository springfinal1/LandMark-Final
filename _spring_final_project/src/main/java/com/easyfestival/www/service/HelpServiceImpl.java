package com.easyfestival.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.HelpDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.repository.HelpDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class HelpServiceImpl implements HelpService{

	private final HelpDAO hdao;

	@Override
	public int helpRegister(HelpDTO hdto) {
		return hdao.register(hdto);
	}

	@Override
	public List<HelpDTO> getList(String id, String answer) {
		return hdao.getList(id, answer);
	}

	@Override
	public HelpDTO getDetail(long helpNo) {
		return hdao.getDetail(helpNo);
	}

	@Override
	public int getHelpCount(String id, String answer) {
		return hdao.getTotalCount(id, answer);
	}

	@Override
	public List<HelpDTO> getListAndPaging(String id, String answer, PagingHandler ph) {
		return hdao.getListAndPaging(id, answer, ph);
	}

	@Override
	public int registerAnswer(long helpNo, String coment) {
		return hdao.registerAnswer(helpNo, coment);
	}

}
