package com.easyfestival.www.repository;

import org.apache.ibatis.annotations.Param;

import com.easyfestival.www.domain.MemberShipVO;
import com.easyfestival.www.security.UserVO;

public interface MemberShipDAO {

	int saveGrade(@Param("id") String id, @Param("grade") String grade);

	void savePoints(@Param("id") String id, @Param("point") long point, @Param("totalPrice") Long totalPrice);

	MemberShipVO getmemberShip(String id);

	int UpdateMemberShip(@Param("id") String id, @Param("point") long point);

	void cancelPoints(@Param("id") String id, @Param("point") long point);

	void updateTotalPurchase(@Param("id") String id, @Param("totalPrice") long totalPrice);

	long getTotalPrice(String id);

	void insertId(String id);

	void pointCancle(@Param("point") long point, @Param("id") String id);

}
