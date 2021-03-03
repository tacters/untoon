package com.untoon.home.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.home.model.vo.Ad;
import com.untoon.home.model.vo.AdPage;

@Repository("adDao")
public class AdDao {
	//스프링-마이바티스 연동 객체 연결함 : root-context.xml 에 선언되어 있음
		@Autowired
		private SqlSessionTemplate sqlSession;

	public int insertAd(Ad ad) {
		return sqlSession.insert("adMapper.insertAd", ad);
	}

	public int updateAd(Ad ad) {
		return sqlSession.update("adMapper.updateAd", ad);
	}

	public int deleteAd(int adid) {
		return sqlSession.delete("adMapper.deleteAd", adid);
	}

	public Ad selectAd(int adid) {
		return sqlSession.selectOne("adMapper.selectAd", adid);
	}

	public ArrayList<Ad> selectAllAd() {
		List<Ad> adlist = sqlSession.selectList("adMapper.selectAllAd");
		return (ArrayList<Ad>)adlist;
	}

	public Ad selectAd() {
		return sqlSession.selectOne("adMapper.selectRecentAd");
	}

	public int getListCount() {
		return sqlSession.selectOne("adMapper.getListCount");
	}

	public ArrayList<Ad> selectAllAd(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
				int startRow = (currentPage - 1) * limit -1;
				int endRow = startRow + limit -1;
		List<Ad> adlist = sqlSession.selectList("adMapper.selectAllAdPaging", 
																	new AdPage(startRow,endRow));
		return (ArrayList<Ad>)adlist;
	}

}
