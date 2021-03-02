package com.untoon.home.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.home.model.vo.Home;

@Repository("homeDao")
public class HomeDao {

	//스프링-마이바티스 연동 객체 연결함 : root-context.xml 에 선언되어 있음
		@Autowired
		private SqlSessionTemplate sqlSession;
		
	public int insertHome(Home home) {
		return sqlSession.insert("homeMapper.insertHome", home);
	}

	/*
	 * public int updateHome(Home home) { return
	 * sqlSession.update("homeMapper.updateHome", home); }
	 * 
	 * public int deleteHome(int hid) { return
	 * sqlSession.update("homeMapper.deleteHome", hid); }
	 */

	public Home selectHome() {
		return sqlSession.selectOne("homeMapper.selectHome");
	}

	public ArrayList<Home> selectList() {
		List<Home> hlist = sqlSession.selectList("homeMapper.selectAll");
		return(ArrayList<Home>) hlist;
	}

}
