package com.untoon.clss.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.clss.model.vo.Clss;

@Repository("clssDao")
public class ClssDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Clss> selectList() {
		List<Clss> list = sqlSession.selectList("clssMapper.selectAll");
		 
		return (ArrayList<Clss>)list;
	}

}
