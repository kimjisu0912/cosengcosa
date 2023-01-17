package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;

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

	// 과목별 수강 강의수 카운트 함수
	public SubTitle getSubCount(String id);
	
	// 결제강의 리스트 조회 함수
	public List<Pay> getPayList(String id);
}
