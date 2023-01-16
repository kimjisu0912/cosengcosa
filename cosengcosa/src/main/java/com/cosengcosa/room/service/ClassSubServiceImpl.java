package com.cosengcosa.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.ClassSubDao;
import com.cosengcosa.room.domain.ClassSub;

/**
 * 서브강의 서비스
 * @author 김지수
 *
 */

@Service
public class ClassSubServiceImpl implements ClassSubService {

	// 서브강의DAO 생성자 생성
	@Autowired
	private ClassSubDao classSubDao;
	
	public void setClassSubDao(ClassSubDao classSubDao) {
		this.classSubDao = classSubDao;
	}
	
	/*
	 * 서브강의 리스트 서비스
	 */
	@Override
	public List<ClassSub> classSubList(String cmcode) {
		return classSubDao.classSubList(cmcode);
	}

	/*
	 * 서브강의 코드값을 서비스
	 */
	@Override
	public ClassSub getClassSubCode(String cmcode) {
		ClassSub classSub = classSubDao.getClassSubCode(cmcode);
		String reCscode = "";
		if(classSub.getCsCode().equals("01")) {
			reCscode = "01";
		}else {
			
			String[] arrary = classSub.getCsCode().split("_");
			String result = arrary[1];
			int newNum = Integer.parseInt(result) + 1;
			
			reCscode = arrary[0] +"_"+ newNum;
		}
		
		classSub.setCsCode(reCscode);
		return classSub;
	}

	/*
	 * 서브강의 입력 서비스
	 */
	@Override
	public void insertClassSub(ClassSub classSub) {
		classSubDao.insertClassSub(classSub);
	}

}
