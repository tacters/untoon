package com.untoon.review.model.service;

import java.util.ArrayList;

import com.untoon.review.model.vo.ReviewReply;

public interface ReviewReplyService {
	int insertReviewReply(ReviewReply reviewReply);
	int updateReviewReply(int rrid);
	int deleteReviewReply(int rrid);
	
	ArrayList<ReviewReply> selectReviewReplyList(int ref_rid);
	ReviewReply selectReviewReply(int rrid);

}
