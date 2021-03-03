package com.untoon.home.model.service;

import java.util.ArrayList;

import com.untoon.home.model.vo.Home;

public interface HomeService {
	
	// HOMEPAGE
		int insertHome(Home home);
		//int updateHome(Home home);
		//int deleteHome(int hid);
		
		Home selectHome();
		ArrayList<Home> selectAll(); // 현재 필요 없을 수도
		
}
