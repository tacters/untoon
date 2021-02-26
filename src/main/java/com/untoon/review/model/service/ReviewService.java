package com.untoon.review.model.service;

import java.util.ArrayList;

import com.untoon.review.model.vo.Review;

public interface ReviewService {
	
	
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int rid);
	
	ArrayList<Review> selectReviewList(int cid);
	Review selectReview(int rid);
}
