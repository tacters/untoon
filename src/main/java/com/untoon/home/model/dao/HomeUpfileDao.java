package com.untoon.home.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.home.model.vo.HomeUpfile;


@Repository("huDao")
public class HomeUpfileDao {
	//스프링-마이바티스 연동 객체 연결함 : root-context.xml 에 선언되어 있음
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAdFile(HomeUpfile hupfile) {
		return sqlSession.insert("homeUpfileMapper.insertAdFile", hupfile); // DOUBLE CHECK ID IN MAPPER
	}

	public int updateAdFile(HomeUpfile hupfile) {
		return sqlSession.update("homeUpfileMapper.updateAdFile", hupfile); 
	}

	public int deleteAdFile(int adid) {
		return sqlSession.delete("homeUpfileMapper.deleteAdFile", adid);  //status를 update해주는게 아니라 실제로 <delete> 하기
	}

	public int insertHomeFiles(HomeUpfile hupfile) {
		return sqlSession.insert("homeUpfileMapper.insertHomeFiles", hupfile); // DOUBLE CHECK ID IN MAPPER
	}

	public int updateHomeFiles(HomeUpfile hupfile) {
		return sqlSession.update("homeUpfileMapper.updateHomeFiles", hupfile); 
	}

	public int deleteHomeFiles(int hid) {
		return sqlSession.update("homeUpfileMapper.deleteHomeFiles", hid); 
	}

	public HomeUpfile selectHomeUpfile() {
		return sqlSession.selectOne("homeUpfileMapper.selectHomeUpfile"); // select 1 for homeMapper 
	}

	public ArrayList<HomeUpfile> selectAll() {
		List<HomeUpfile> hulist = sqlSession.selectList("homeUpfileMapper.selectAll"); // MAKE A SEPARATE ONE FOR adMapper ??
		return (ArrayList<HomeUpfile>) hulist;
	}

	public HomeUpfile selectAdUpfile(int adid) {
		return sqlSession.selectOne("homeUpfileMapper.selectAdUpfile", adid); // select 1 for adMapper
	}



	
	
}
