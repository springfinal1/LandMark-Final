package com.easyfestival.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.ReviewLikeHistoryVO;
import com.easyfestival.www.domain.pagingVO;
import com.easyfestival.www.domain.reviewVO;
import com.easyfestival.www.repository.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Inject
	private ReviewDAO rdao;

	@Override
	public int reviewRegister(reviewVO rvo) {
		return rdao.reviewRegister(rvo);
	}

	@Override
	public List<reviewVO> list(pagingVO pgvo) {
		return rdao.list(pgvo);
	}

	@Override
	public reviewVO detail(int rvNo) {
		return rdao.detail(rvNo);
	}

	@Override
	public int remove(int rvNo) {
		return rdao.remove(rvNo);
	}

	@Override
	public int modify(reviewVO rvo) {
		return rdao.modify(rvo);
	}

	@Override
	public int readCountUp(int rvNo) {
		return rdao.readCountUp(rvNo);
	}

	@Override
	public int getTotalCount(pagingVO pgvo) {
		return rdao.getTotalCount(pgvo);
	}

	@Override
	public ReviewLikeHistoryVO LikeDistinction(ReviewLikeHistoryVO rlh) {
		return rdao.LikeDistinction(rlh);
	}

	@Override
	public int deleteLike(ReviewLikeHistoryVO rlhvo) {
		return rdao.deleteLike(rlhvo);
	}

	@Override
	public int insertLike(ReviewLikeHistoryVO rlhvo) {
		return rdao.insertLike(rlhvo);
	}

	@Override
	public List<reviewVO> bestList(pagingVO pgvo) {
		return rdao.bestList(pgvo);
	}

	@Override
	public int getbestTotalCount(pagingVO pgvo) {
		return rdao.getbestTotalCount(pgvo);
	}

	@Override
	public int getLikeCount(int rvNo) {
		return rdao.getLikeCount(rvNo);
	}

	@Override
	public List<reviewVO> mylist(String id, pagingVO pgvo) {
		return rdao.mylist(id,pgvo);
	}

	@Override
	public int getMyTotalCount(String id, pagingVO pgvo) {
		return rdao.getMyTotalCount(id,pgvo);
	}

	
}
