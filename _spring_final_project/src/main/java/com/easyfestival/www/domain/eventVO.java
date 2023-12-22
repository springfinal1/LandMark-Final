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
public class eventVO 
{
	private long evNo; //이벤트 기본키
	private String evName; //이벤트 이름
	private String evStart; //이벤트 시작일
	private String evEnd; //이벤트 종료일
	private String evType; //이벤트 타입
	private long userNo; //당첨자 유저 번호
	private String evContent; //이벤트 내용
	private String thumbnail;
}
