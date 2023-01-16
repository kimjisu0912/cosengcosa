package com.cosengcosa.room.service;

import java.util.List;

import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;

public interface MyClassService {
	/**
	 * 내강의실 서비스 인터페이스
	 * @author 김동영
	 * 
	 */
	
	// 메인 강의리스트 호출 함수
	public List<MyClassMain> getMyClassMain(String id);
	
	// 서브강의 리스트 호출 함수
	public List<MyClassSub> getMyClassSub(String id, String mymCode);
}
