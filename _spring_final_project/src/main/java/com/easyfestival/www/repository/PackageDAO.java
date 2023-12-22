package com.easyfestival.www.repository;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.easyfestival.www.domain.AirplaneVO;
import com.easyfestival.www.domain.FavoriteVO;
import com.easyfestival.www.domain.FestivalVO;
import com.easyfestival.www.domain.HotelVO;
import com.easyfestival.www.domain.PackageVO;
import com.easyfestival.www.domain.PlaceVO;
import com.easyfestival.www.domain.ProductBoardVO;
import com.easyfestival.www.domain.ProductListDTO;

import lombok.extern.slf4j.Slf4j;


public interface PackageDAO {

	long getPkno();

	int insertProduct(ProductBoardVO pbvo);

	int register(PackageVO packvo);

	PackageVO getPackList(String pkContinent);
	AirplaneVO getAirList(long pkNo);
	HotelVO getHotList(long pkNo);
	FestivalVO getFesList(long pkNo);
	PlaceVO getPlcList(long pkNo);

	List<ProductListDTO> getDTO(String pkContinent);

	List<ProductListDTO> getdtoDetail(long pkNo);

	int modify(ProductBoardVO pbvo);

	int packModify(PackageVO packvo);

	int removeProduct(long pkNo);

	int addFavorite(@Param("idVal")String idVal, @Param("pkNo")long pkNo);

	List<FavoriteVO> getFaList(String id);

	int removeFavoriteRemove(@Param("pkNo")long pkNo, @Param("idVal")String idVal);



	





}
