package com.easyfestival.www.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OllPayDTO {
	
	private Long orderNum;
	private Long productNum;
	private String id;
	private String pkNo;
	private Date orderDate;
	private Long totalPrice;
	private String impUid;
	private Long userCount;
	
	
	
	private String pkName; // 상품명
	private String pkContinent; // 패키지 대륙
	private String pkContent; // 패키지 내용
	
	
	private long htNo;
	private String htName;
	private long htPrice;
	
	
	private String pfUuid;
	private String pfName;
	private long pfSize;
	private String pfRegAt;
	private String pfSaveDir;
	
	
	private long apNo;
	private long apPrice;
	private String apArrival;
	private String apDeparture;

}
