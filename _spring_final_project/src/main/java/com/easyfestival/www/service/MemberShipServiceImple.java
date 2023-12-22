package com.easyfestival.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beust.jcommander.internal.Console;
import com.easyfestival.www.domain.MemberShipVO;
import com.easyfestival.www.domain.OrderVO;
import com.easyfestival.www.repository.MemberShipDAO;
import com.easyfestival.www.security.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberShipServiceImple implements MemberShipService {

	@Autowired
	private MemberShipDAO mdao;

	// MemberShipServiceImple.java
	

	@Override
	@Transactional
	public int insert_point(OrderVO orderDTO) {
	    // 1. 결제 금액에 따라 포인트 계산
		long point = calculatePoints(orderDTO.getTotalPrice());

	    // 2. 적립된 포인트를 데이터베이스에 저장
	    mdao.savePoints(orderDTO.getId(), point, orderDTO.getTotalPrice());

	    // 3. 등급을 결정하고 데이터베이스에 저장
	    long totalPrice = mdao.getTotalPrice(orderDTO.getId());
	    
	    String grade = determineGrade(totalPrice);
	 
	    
	    System.out.println("getTotalPrice+++++++++" + orderDTO.getTotalPrice());
	   return mdao.saveGrade(orderDTO.getId(), grade);
	}

	private String determineGrade(Long totalPrice) {
	    // 등급 결정 로직
	    // 예: 각 등급에 필요한 최소 누적금액 기준을 설정하고 이에 따라 등급을 반환
	    // 이 메서드는 프로젝트의 실제 요구사항에 맞게 구현되어야 합니다.
	    // 여기서는 단순히 누적금액에 따라 브론즈, 실버, 골드, 다이아 등급을 구분하는 예시를 보여줍니다.
	    if (totalPrice >= 10000000) {
	        return "골드";
	    } else if (totalPrice >= 5000000) {
	        return "실버";
	    } else {
	        return "브론즈";
	    }
	}

	@Override
	@Transactional
	public MemberShipVO getmemberShip(String id) {
		
		MemberShipVO memberShipVO = mdao.getmemberShip(id);
		float memberDiscountRate=0.0f;
		switch(memberShipVO.getGrade()) {
			case "브론즈":
				memberDiscountRate = 0.03f;
				break;
			case "실버":
				memberDiscountRate = 0.05f;
				break;
			case "골드":
				memberDiscountRate = 0.07f;
				break;
		}
		memberShipVO.setMemberDiscountRate(memberDiscountRate);
		return memberShipVO;
	}

	
	@Override
	@Transactional
	public int updateMemberShip(String id, Long point) {
	    // TODO Auto-generated method stub
	    if (point != null && point > 0) {
	        mdao.UpdateMemberShip(id, point);
	    }

	    return 1;
	}



	/*
	 * @Override
	 * 
	 * @Transactional public int pointCancle(String id, Long totalPrice) {
	 * MemberShipVO memberShipVO = mdao.getmemberShip(id); if (memberShipVO == null)
	 * { // 멤버십 정보가 없으면 처리 중단 return 0; }
	 * 
	 * // 2. 환불할 포인트 및 금액 계산 long canceledPoints = calculatePoints(totalPrice);
	 * 
	 * long point = memberShipVO.getAccumulatedPoint() - canceledPoints; long
	 * totalPirce = Math.max(0,memberShipVO.getTotalPurchase() - totalPrice);
	 * 
	 * log.info("point--- ()", point + "totalPirce --- ()", totalPirce);
	 * 
	 * // 3. 데이터베이스에서 포인트 및 금액 환불 mdao.cancelPoints(id, point);
	 * mdao.updateTotalPurchase(id, totalPirce); // 예시: 데이터베이스에서 총 구매 금액 업데이트
	 * 
	 * // 4. 이후 추가적인 로직이 있다면 처리
	 * 
	 * return 1; }
	 */

	private long calculatePoints(Long totalPrice) {
	    // 포인트 계산 로직
	    // 예: 1%의 적립 비율로 계산
	    double pointRate = 0.03;
	    return (long) (totalPrice * pointRate);
	}


	@Override
	public void insertId(String id) {
		mdao.insertId(id);
		
	}

	@Override
	@Transactional
	public int pointCancle(OrderVO orderVO) {
		// TODO Auto-generated method stub
		
		MemberShipVO memberShipVO = mdao.getmemberShip(orderVO.getId());
		
	    if (memberShipVO == null) {
	        // 멤버십 정보가 없으면 처리 중단
	        return 0;
	    }

	    // 2. 환불할 포인트 및 금액 계산
	    
	    long pointA = orderVO.getSayongPointeu();
	
	    
	
	    
	    // 3. 데이터베이스에서 포인트 및 금액 환불
	    mdao.cancelPoints(orderVO.getId(), pointA);
	

	    // 4. 이후 추가적인 로직이 있다면 처리

	    return 1;
	}

	@Override
	public int ollCancle(OrderVO orderVO) {
		
		long totalPirce2 = orderVO.getTotalPrice();
		
		
		long point = calculatePoints(orderVO.getTotalPrice());
		
	    mdao.updateTotalPurchase(orderVO.getId(), totalPirce2); // 예시: 데이터베이스에서 총 구매 금액 업데이트
	    
	    System.out.println("point ++++" + point);
	    
	    mdao.pointCancle(point, orderVO.getId());
	    return 1;
	}

}
