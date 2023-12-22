package com.easyfestival.www.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PayDTO {
	

	// num -- 회원번호
	// orderNum - 주문번호
	private Long payNum;
	private String id;
	// orderNum -> FK SC_ORDER_USER orderNum 받기
	private Long orderNum;
	private String payMethod;
	private String productName;
	private Date payDate; // sysdate
	private Long payAmount;
	private Long pkNo;
	private Long sayongPointeu;
}
