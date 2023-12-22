package com.easyfestival.www.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfestival.www.domain.AttendanceHistoryVO;
import com.easyfestival.www.domain.attendanceVO;
import com.easyfestival.www.domain.eventDTO;
import com.easyfestival.www.domain.eventVO;
import com.easyfestival.www.domain.prizeVO;
import com.easyfestival.www.domain.rouletteVO;

public interface EventDAO 
{

	int eventRegister(eventVO evo);

	List<eventVO> OneventList(LocalDateTime now);

	eventVO detail(int evNo);

	int eventRemove(int evNo);

	int eventModify(eventVO evo);

	List<eventVO> LasteventList(LocalDateTime now);

	int registerPrize(prizeVO prvo);

	int lastEvno();

	void rouletteRegister(rouletteVO rlvo);

	String getPrize(int evNo);

	void attendanceRegister(attendanceVO atvo);

	void attendanceHistory(@Param("evNo")long evNo,@Param("id")String id,@Param("now") LocalDate now);

	AttendanceHistoryVO getAttendanceHistory(@Param("evNo")long evNo,@Param("id")String id,@Param("now") LocalDate now);

	attendanceVO getAttendance(long evNo);

	void addpoint(@Param("id")String id,@Param("point")int point);

	int getAttendanceCount(@Param("evNo")long evNo,@Param("id") String id);

	void addSpecialPoint(@Param("id")String id,@Param("specialPoint") int specialPoint);
	


	

}
