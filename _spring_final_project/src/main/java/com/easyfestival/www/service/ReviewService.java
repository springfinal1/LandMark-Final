package com.easyfestival.www.service;

import java.util.List;

import com.easyfestival.www.domain.ReviewLikeHistoryVO;
import com.easyfestival.www.domain.pagingVO;
import com.easyfestival.www.domain.reviewVO;

public interface ReviewService {


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

	List<reviewVO> mylist(String id, pagingVO pgvo);

	int getMyTotalCount(String id, pagingVO pgvo);

	

}