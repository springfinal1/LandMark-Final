package com.easyfestival.www.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PackageVO {
	
	private long pkNo; // 상품번호
	private String pkName; // 상품명
	private long pkPrice; // 패키지 가격
	private String pkContinent; // 패키지 대륙
	private String pkContent; // 패키지 내용

}
