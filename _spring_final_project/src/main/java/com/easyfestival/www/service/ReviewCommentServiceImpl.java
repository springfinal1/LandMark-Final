package com.easyfestival.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.ReviewCommentVO;
import com.easyfestival.www.repository.ReviewCommentDAO;

@Service
public class ReviewCommentServiceImpl implements ReviewCommentService
{
	@Inject
	private ReviewCommentDAO rcdao;

	@Override
	public int ReviewCommentPost(ReviewCommentVO rcvo) {
		return rcdao.ReviewCommentPost(rcvo);
	}

	@Override
	public List<ReviewCommentVO> getCommentList(int rvNo) {
		return rcdao.getCommentList(rvNo);
	}

	@Override
	public int DeleteComment(int rcNo) {
		return rcdao.DeleteComment(rcNo);
	}

	@Override
	public int ModifyComment(ReviewCommentVO rcvo) {
		return rcdao.ModifyComment(rcvo);
	}

	@Override
	public int getCommentCount(int rvNo) {
		return rcdao.getCommentCount(rvNo);
	}

}
