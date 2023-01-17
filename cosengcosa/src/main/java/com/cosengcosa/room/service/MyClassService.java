package com.cosengcosa.room.service;

import java.util.List;

import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;

public interface MyClassService {
	/**
	 * 내강의실 서비스 인터페이스
	 * @author 김동영
	 * 
	 */
	
	// 메인 강의리스트 조회 함수
	public List<MyClassMain> getMyClassMain(String id);
	
	// 서브강의 리스트 조회 함수
	public List<MyClassSub> getMyClassSub(String id, String mymCode);
	
	// 차트 표현 카운트 조회 함수
	public SubTitle getSubCount(String id);
	
	// 결제내역 리스트 조회 함수
	public List<Pay> getPayList(String id);
	
}
