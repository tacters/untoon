package com.untoon.home.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.home.model.dao.HomeDao;
import com.untoon.home.model.vo.Ad;
import com.untoon.home.model.vo.Home;


@Service("homeService")
public class HomeServiceImpl implements HomeService{
	//의존성 주입(DI : Dependency Injection)
	@Autowired
	private HomeDao homeDao;
	
// HOME
	@Override
	public int insertHome(Home home) {
		return homeDao.insertHome(home);
	}

	/*
	 * @Override public int updateHome(Home home) { return homeDao.updateHome(home);
	 * }
	 * 
	 * @Override public int deleteHome(int hid) { return homeDao.deleteHome(hid); }
	 */

	@Override
	public Home selectHome() {
		return homeDao.selectHome();
	}

	@Override
	public ArrayList<Home> selectAll() {
		return homeDao.selectList();
	}


}
