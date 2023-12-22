package com.easyfestival.www.service;

import com.easyfestival.www.domain.MemberShipVO;
import com.easyfestival.www.domain.OrderVO;
import com.easyfestival.www.security.UserVO;

public interface MemberShipService {

	int insert_point(OrderVO orderDTO);

	MemberShipVO getmemberShip(String id);


	int updateMemberShip(String id, Long point);


	void insertId(String id);

	int pointCancle(OrderVO orderVO);

	int ollCancle(OrderVO orderVO);


}
