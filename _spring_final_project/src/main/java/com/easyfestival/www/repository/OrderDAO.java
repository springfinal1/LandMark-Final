package com.easyfestival.www.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.easyfestival.www.domain.FreeTitcketOrderVO;
import com.easyfestival.www.domain.OllPayDTO;
import com.easyfestival.www.domain.OrderVO;
import com.easyfestival.www.domain.PayDTO;
import com.easyfestival.www.domain.ProductListDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.security.UserVO;

public interface OrderDAO {

	int insert_pay(OrderVO orderVO);

	int insert_payinfo(PayDTO payDTO);

	PayDTO getLastPay(PayDTO payDTO);
	
	PayDTO getPay(long payNum);

	OrderVO adminList(OrderVO orderVO);

	int payMentCancle(Long orderNum);

	int orderCancle(Long long1);

	int OrderCount(String svNum);

	List<OrderVO> getOrder(@Param("ph") PagingHandler ph, @Param("id") String id);

	List<OllPayDTO> ollOrder(@Param("ph") PagingHandler ph, @Param("id") String id);

	List<OllPayDTO> ollList(long orderNum);
	
	List<OllPayDTO> getPackageList(String id); // 마이페이지 패키지예약내역 리스트용

	int updateY(OrderVO orderVO);

	String getConfirmation(long orderNum);

	int freeinfo_pay(FreeTitcketOrderVO freeTitcketOrderVO);

	
}
