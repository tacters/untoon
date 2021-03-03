package com.untoon.home.model.service;

import java.util.ArrayList;

import com.untoon.home.model.vo.HomeUpfile;

public interface HomeUpfileService {

	
	int insertAdFile(HomeUpfile hupfile);
	int updateAdFile(HomeUpfile hupfile);
	int deleteAdFile(int adid);
	
	int insertHomeFiles(HomeUpfile hupfile);
	int updateHomeFiles(HomeUpfile hupfile);
	int deleteHomeFiles(int hid);
	
	
	HomeUpfile selectHomeUpfile();
	ArrayList<HomeUpfile> selectAll();
	
	HomeUpfile selectAdUpfile(int adid);
}
