package com.cosengcosa.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.MyClassDao;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;

@Service
public class MyClassServiceImpl implements MyClassService {

	@Autowired
	private MyClassDao myclassdao;
	
	@Override
	public List<MyClassMain> getMyClassMain(String id) {
		
		return myclassdao.getMyClassMain(id);
	}

	@Override
	public List<MyClassSub> getMyClassSub(String id, String mymCode) {
		return myclassdao.getMyClassSub(id, mymCode);
	}

}
