package com.untoon.save.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.save.model.dao.SaveClssDao;
import com.untoon.save.model.vo.SaveClss;


@Service("scService")
public class SaveClssServiceImpl implements SaveClssService {
	
	//의존성 주입(DI : Dependency Injection)
		@Autowired
		private SaveClssDao scDao;

	@Override
	public int insertSC(SaveClss sc) {
		return scDao.insertSC(sc);
	}

	@Override
	public int deleteSC(SaveClss sc) {
		return scDao.deleteSC(sc); //sqlSession.delete("scMapper.insertSC", sc)
	}

	@Override
	public int countClssTotal(int cid) {
		return scDao.countClssTotal(cid);
	}

	@Override
	public int countMemberTotal(int id) {
		return scDao.countMemberTotal(id);
	}

	@Override
	public SaveClss selectOne(int id) {
		return scDao.selectOne(id);
	}

	@Override
	public ArrayList<SaveClss> selectList() {
		return scDao.selectList();
	}

	@Override
	public ArrayList<SaveClss> selectTop8() {
		return scDao.selectTop8();
	}

	@Override
	public ArrayList<SaveClss> selectCategory(String clss_category) {
		return scDao.selectCategory(clss_category);
	}

	@Override
	public ArrayList<SaveClss> selectPersonalSave(String id) {
		return scDao.selectPersonalSave(id);
	}


}
