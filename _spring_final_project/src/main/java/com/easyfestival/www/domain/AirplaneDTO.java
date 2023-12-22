package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AirplaneDTO {

	private String cityJpn; //일본어
	private String cityEng; //영문
	private String cityKor; //한국어
	private String cityCode; // 도시코드
}
