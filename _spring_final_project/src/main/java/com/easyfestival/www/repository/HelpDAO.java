package com.easyfestival.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfestival.www.domain.HelpDTO;
import com.easyfestival.www.handler.PagingHandler;

public interface HelpDAO {

	int register(HelpDTO hdto);

	List<HelpDTO> getList(@Param("id")String id, @Param("answer")String answer);

	HelpDTO getDetail(long helpNo);

	int getTotalCount(@Param("id")String id, @Param("answer")String answer);

	List<HelpDTO> getListAndPaging(@Param("id")String id, @Param("answer")String answer, @Param("ph")PagingHandler ph);

	int registerAnswer(@Param("helpNo")long helpNo, @Param("coment")String coment);
	
}
