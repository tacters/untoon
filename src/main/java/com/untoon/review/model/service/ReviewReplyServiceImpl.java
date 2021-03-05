package com.untoon.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.review.model.dao.ReviewReplyDao;
import com.untoon.review.model.vo.ReviewReply;

@Service("reviewReplyService")
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Autowired
	private ReviewReplyDao rrdao;

	@Override
	public int insertReviewReply(ReviewReply reviewReply) {
		return rrdao.insertReviewReply(reviewReply);
	}

	@Override
	public int updateReviewReply(int rrid) {
		return rrdao.updateReviewReply(rrid);
	}

	@Override
	public int deleteReviewReply(int rrid) {
		return rrdao.deleteReviewReply(rrid);
	}

	@Override
	public ArrayList<ReviewReply> selectReviewReplyList(int ref_rid) {
		return rrdao.selectReviewReplyList(ref_rid);
	}

	@Override
	public ReviewReply selectReviewReply(int rrid) {
		return rrdao.selectReviewReply(rrid);
	}
	
}