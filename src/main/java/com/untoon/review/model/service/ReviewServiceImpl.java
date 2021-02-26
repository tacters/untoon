package com.untoon.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.review.model.dao.ReviewDao;
import com.untoon.review.model.vo.Review;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao rDao;

	@Override
	public int insertReview(Review review) {
		return rDao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return rDao.updateReview(review);
	}

	@Override
	public int deleteReview(int rid) {
		return rDao.deleteReview(rid);
	}
	
	@Override
	public ArrayList<Review> selectReviewList(int cid) {
		return rDao.selectReviewList(cid);
	}

	@Override
	public Review selectReview(int rid) {
		return rDao.selectReview(rid);
	}
	
	
}