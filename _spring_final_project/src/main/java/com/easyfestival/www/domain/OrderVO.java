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
public class OrderVO {

	private Long orderNum;
	private String productName;
	private String id;
	private String pkNo;
	private Date orderDate;
	private Long totalPrice;
	private String impUid;
	private Long userCount;
	private Long sayongPointeu;
	private char confirmation;
    private String airplane;

	
}