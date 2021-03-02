package com.untoon.review.model.service;

import java.util.ArrayList;

import com.untoon.review.model.vo.Review;
import com.untoon.review.model.vo.ReviewClss;

public interface ReviewService {
	
	
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int rid);
	
	ArrayList<Review> selectReviewList(int cid);
	Review selectReview(int rid);
	ArrayList<ReviewClss> myReview(String id);	// 마이페이지에서 본인 후기 불러오기
}
