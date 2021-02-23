package com.untoon.review.model.service;

import java.util.ArrayList;

import com.untoon.review.model.vo.Review;

public interface ReviewService {


	ArrayList<Review> selectReviewList(int currentPage, int limit);
	Review selectReview(int rid);
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int rid);


}
