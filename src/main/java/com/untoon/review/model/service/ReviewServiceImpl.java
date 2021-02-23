package com.untoon.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.untoon.review.model.dao.ReviewDao;
import com.untoon.review.model.vo.Review;

public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public ArrayList<Review> selectReviewList(int currentPage, int limit) {
		return reviewDao.selectList(currentPage, limit);
	}

	@Override
	public Review selectReview(int rid) {
		return reviewDao.selectReview(rid);
	}

	@Override
	public int insertReview(Review review) {
		return reviewDao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return reviewDao.updateReview(review);
	}

	@Override
	public int deleteReview(int rid) {
		return reviewDao.deleteReview(rid);
	}

}
