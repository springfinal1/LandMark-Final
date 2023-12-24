package com.easyfestival.www.service;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import com.easyfestival.www.domain.AttendanceHistoryVO;
import com.easyfestival.www.domain.attendanceVO;
import com.easyfestival.www.domain.eventDTO;
import com.easyfestival.www.domain.eventVO;
import com.easyfestival.www.domain.prizeVO;
import com.easyfestival.www.domain.rouletteVO;

public interface EventService {

	int OneventList(eventVO eventVO);

	List<eventVO> OneventList(LocalDateTime now);

	eventVO detail(int evNo);

	int eventRemove(int evNo);

	int eventModify(eventVO evo);

	List<eventVO> LasteventList(LocalDateTime now);

	int eventRegister(eventVO eventVO);

	int registerPrize(prizeVO prvo);

	int lastEvno();

	void rouletteRegister(rouletteVO rlvo);

	String getPrize(int evNo);

	void attendanceRegister(attendanceVO atvo);

	void attendanceHistory(long evNo,String id, LocalDate now);

	AttendanceHistoryVO getAttendanceHistory(long evNo,String id, LocalDate now);

	attendanceVO getAttendance(long evNo);

	void addpoint(String id, int point);

	int getAttendanceCount(long evNo, String id);

	void addSpecialPoint(String id, int specialPoint);

	void rouletteModify(rouletteVO rlvo);

	void attendanceModify(attendanceVO atvo);


	



}