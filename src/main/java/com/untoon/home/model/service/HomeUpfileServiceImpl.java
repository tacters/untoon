package com.untoon.home.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.home.model.dao.HomeUpfileDao;
import com.untoon.home.model.vo.HomeUpfile;

@Service("huService")
public class HomeUpfileServiceImpl implements HomeUpfileService {
	//의존성 주입(DI : Dependency Injection)
	@Autowired
	private HomeUpfileDao huDao;

	@Override
	public int insertAdFile(HomeUpfile hupfile) {
		return huDao.insertAdFile(hupfile);
	}

	@Override
	public int updateAdFile(HomeUpfile hupfile) {
		return huDao.updateAdFile(hupfile);
	}

	@Override
	public int deleteAdFile(int adid) {
		return huDao.deleteAdFile(adid);
	}

	@Override
	public int insertHomeFiles(HomeUpfile hupfile) {
		return huDao.insertHomeFiles(hupfile);
	}

	@Override
	public int updateHomeFiles(HomeUpfile hupfile) {
		return huDao.updateHomeFiles(hupfile);
	}

	@Override
	public int deleteHomeFiles(int hid) {
		return huDao.deleteHomeFiles(hid);
	}

	@Override
	public HomeUpfile selectHomeUpfile() {
		return huDao.selectHomeUpfile();
	}

	@Override
	public ArrayList<HomeUpfile> selectAll() {
		return huDao.selectAll();
	}

	@Override
	public HomeUpfile selectAdUpfile(int adid) {
		return huDao.selectAdUpfile(adid);
	}


	
	
	
}
