package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AirplaneInfoVO {
	
	private String date; // 출발 ~ 도착
	private String departure; // 출발공항
	private String arrival; // 도착공항
	private String pepleCount; // 인원 , 좌석
	private long price; // 가격
	private String verification; // 왕복, 편도 체크
	private long peple; // 인원수
	private String seat; //좌석
}
