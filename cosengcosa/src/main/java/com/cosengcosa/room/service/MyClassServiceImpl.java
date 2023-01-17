package com.cosengcosa.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.MyClassDao;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;

@Service
public class MyClassServiceImpl implements MyClassService {

	@Autowired
	private MyClassDao myclassDao;
	
	@Override
	public List<MyClassMain> getMyClassMain(String id) {
		
		return myclassDao.getMyClassMain(id);
	}

	@Override
	public List<MyClassSub> getMyClassSub(String id, String mymCode) {
		return myclassDao.getMyClassSub(id, mymCode);
	}

	@Override
	public SubTitle getSubCount(String id) {
		return myclassDao.getSubCount(id);
	}

	@Override
	public List<Pay> getPayList(String id) {
		return myclassDao.getPayList(id);
	}

}
