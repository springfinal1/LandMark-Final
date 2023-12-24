package com.easyfestival.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfestival.www.domain.ReviewLikeHistoryVO;
import com.easyfestival.www.domain.pagingVO;
import com.easyfestival.www.domain.reviewVO;

public interface ReviewDAO {

	int reviewRegister(reviewVO rvo);

	List<reviewVO> list(pagingVO pgvo);

	reviewVO detail(int rvNo);

	int remove(int rvNo);

	int modify(reviewVO rvo);

	int readCountUp(int rvNo);

	int getTotalCount(pagingVO pgvo);

	ReviewLikeHistoryVO LikeDistinction(ReviewLikeHistoryVO rlh);

	int deleteLike(ReviewLikeHistoryVO rlhvo);

	int insertLike(ReviewLikeHistoryVO rlhvo);

	List<reviewVO> bestList(pagingVO pgvo);

	int getbestTotalCount(pagingVO pgvo);

	int getLikeCount(int rvNo);

	List<reviewVO> mylist(@Param("id") String id,@Param("pgvo") pagingVO pgvo);

	int getMyTotalCount(@Param("id") String id,@Param("pgvo") pagingVO pgvo);



}
