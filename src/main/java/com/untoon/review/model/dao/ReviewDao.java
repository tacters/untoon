package com.untoon.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.review.model.vo.Review;
import com.untoon.review.model.vo.ReviewPage;

@Repository("reviewDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/**
	 * 후기를 리스트로 조회하기
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Review> selectList(int currentPage, int limit, int cid) {
				
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage -1) * limit -1;
		int endRow = startRow + limit -1;
		
		//ReviewPage() constructor 생성자 안에다가 cid 읽을 수 있게 함
		List<Review> list = sqlSession.selectList("reviewMapper.selectList", new ReviewPage(startRow, endRow, cid));
		
		return (ArrayList<Review>)list;
		
	}

	/**
	 * 후기 상세보기... 한개를 펼쳐서보기? 나중에는 없어도 될듯
	 * @param rid
	 * @return
	 */
	public Review selectReview(int rid) {
		return sqlSession.selectOne("reviewMapper.selectReview", rid);
	}

	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	public int updateReview(Review review) {
		return sqlSession.update("reviewMapper.updateReview", review);
	}

	public int deleteReview(int rid) {
		return sqlSession.update("reviewMapper.deleteReview", rid);
	}

	public int getListCount() {
		return sqlSession.selectOne("reviewMapper.getListCount");
	}

}


