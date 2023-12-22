package com.easyfestival.www.repository;

import java.util.List;

import com.easyfestival.www.domain.ReviewCommentVO;

public interface ReviewCommentDAO {

	int ReviewCommentPost(ReviewCommentVO rcvo);

	List<ReviewCommentVO> getCommentList(int rvNo);

	int DeleteComment(int rcNo);

	int ModifyComment(ReviewCommentVO rcvo);

	int getCommentCount(int rvNo);

}
