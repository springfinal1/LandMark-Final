package com.easyfestival.www.service;

import java.util.List;

import com.easyfestival.www.domain.ReviewCommentVO;

public interface ReviewCommentService {

	int ReviewCommentPost(ReviewCommentVO rcvo);

	List<ReviewCommentVO> getCommentList(int rvNo);

	int DeleteComment(int rcNo);

	int ModifyComment(ReviewCommentVO rcvo);

	int getCommentCount(int rvNo);

}
