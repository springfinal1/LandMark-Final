package com.easyfestival.www.repository;

import java.util.List;

import com.easyfestival.www.domain.ProductBoardVO;
import com.easyfestival.www.domain.ProductFileVO;

public interface ProductFileDAO {

	int registerFile(ProductFileVO pfvo);

	List<ProductFileVO> getfileList(long pkNo);

	int modifyFile(ProductFileVO pfvo);

	int removeFile(long pkNo);




}
