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
public class attendanceVO 
{
	private long evNo;
	private int maxAttendanceCount;	//최대출석횟수
	private int point;	//1번 출석할때마다 지급될 포인트
	private int specialPointCount;	//n회마다 추가포인트
	private int specialPoint;		//특정횟수마다 지급될 포인트
	private int fullAttendancePrize;	//모두출석했을때 지급될 포인트

}
