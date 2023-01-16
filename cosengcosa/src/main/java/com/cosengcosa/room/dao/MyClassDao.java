package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;

public interface MyClassDao {
	
	/**
	 * 내강의 DAO
	 * @author 김동영
	 * 
	 */
	
	// 몌인강의 조회 처리 함수
	public List<MyClassMain> getMyClassMain(String id);
	
	// 서브강의 조회 처리 함수
	public List<MyClassSub> getMyClassSub(String id, String mymCode);
}
