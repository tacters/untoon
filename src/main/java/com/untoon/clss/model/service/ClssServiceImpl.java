package com.untoon.clss.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.clss.model.dao.ClssDao;
import com.untoon.clss.model.vo.Clss;

@Service("clssService")
public class ClssServiceImpl implements ClssService{
	@Autowired
	private ClssDao cDao;

	@Override
	public ArrayList<Clss> tClssListMethod() {	// 강사 리스트 조회용
		return cDao.selectList();
	}

}