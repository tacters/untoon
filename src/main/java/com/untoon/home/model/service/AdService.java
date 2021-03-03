package com.untoon.home.model.service;

import java.util.ArrayList;

import com.untoon.home.model.vo.Ad;

public interface AdService {
	// ADVERTISEMENT
	int insertAd(Ad ad);
	int updateAd(Ad ad);
	int deleteAd(int adid);
	
	int getListCount();
	
	Ad selectAd();
	Ad selectAd(int adid);
	ArrayList<Ad> selectAllAd();
	ArrayList<Ad> selectAllAd(int currentPage, int limit);

}
