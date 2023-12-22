package com.easyfestival.www.service;



import java.util.List;

import com.easyfestival.www.domain.AirplaneVO;
import com.easyfestival.www.domain.FavoriteVO;
import com.easyfestival.www.domain.FestivalVO;
import com.easyfestival.www.domain.HotelVO;
import com.easyfestival.www.domain.PackageVO;
import com.easyfestival.www.domain.PlaceVO;
import com.easyfestival.www.domain.ProductBoardVO;
import com.easyfestival.www.domain.ProductDTO;
import com.easyfestival.www.domain.ProductFileVO;
import com.easyfestival.www.domain.ProductListDTO;


public interface ProductService {

	int register(ProductDTO productDTO);

	List<ProductListDTO> getdto(String pkContinent);

	List<ProductListDTO> getdtoDetail(long pkNo);

	int modify(ProductDTO productDTO);

	int removeProduct(long pkNo);

	int addFavorite(String idVal, long pkNo);

	List<FavoriteVO> getFaList(String id);

	int removeFavoriteRemove(long pkNo, String idVal);

//	ProductListDTO productDetail(long pkNo);














	

	



	

	

}
