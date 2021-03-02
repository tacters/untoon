package com.untoon.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.review.model.vo.Review;
import com.untoon.review.model.vo.ReviewClss;


@Repository("rDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReview(Review review) {
		System.out.println(review);
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	public int updateReview(Review review) {
		return sqlSession.update("reviewMapper.updateReview", review);
	}

	public int deleteReview(int rid) {
		return sqlSession.update("reviewMapper.deleteReview", rid);
	}

	public ArrayList<Review> selectReviewList(int cid) {
		List<Review> list = sqlSession.selectList("reviewMapper.selectReviewList", cid);
		return(ArrayList<Review>)list;	
	}
	
	public Review selectReview(int rid) {
		return sqlSession.selectOne("reviewMapper.selectReview", rid);
	}

	// 마이페이지에서 본인 후기 불러오기
	public ArrayList<ReviewClss> myReview(String id) {
		List<ReviewClss> list = sqlSession.selectList("reviewMapper.myReivew", id);
		return (ArrayList<ReviewClss>)list;
	}

}
