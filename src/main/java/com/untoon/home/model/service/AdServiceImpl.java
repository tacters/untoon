package com.untoon.home.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.home.model.dao.AdDao;
import com.untoon.home.model.vo.Ad;


@Service("adService")
public class AdServiceImpl implements AdService {

	//의존성 주입(DI : Dependency Injection)
		@Autowired
		private AdDao adDao;
	
		
		// ADVERTISEMENT
			@Override
			public int insertAd(Ad ad) {
				return adDao.insertAd(ad);
			}

			@Override
			public int updateAd(Ad ad) {
				return adDao.updateAd(ad);
			}

			@Override
			public int deleteAd(int adid) {
				return adDao.deleteAd(adid);
			}

			@Override
			public Ad selectAd(int adid) {
				return adDao.selectAd(adid);
			}

			@Override
			public ArrayList<Ad> selectAllAd() {
				return adDao.selectAllAd();
			}

			@Override
			public Ad selectAd() {
				return adDao.selectAd();
			}


}
