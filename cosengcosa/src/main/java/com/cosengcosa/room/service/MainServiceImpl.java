package com.cosengcosa.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.MainDao;
import com.cosengcosa.room.domain.ClassMain;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<ClassMain> getClassMainListD() {
		return mainDao.getClassMainListD();
	}

	@Override
	public List<ClassMain> getClassMainListR() {
		return mainDao.getClassMainListR();
	}

}
