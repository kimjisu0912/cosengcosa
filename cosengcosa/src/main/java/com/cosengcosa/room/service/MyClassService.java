package com.cosengcosa.room.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cosengcosa.room.domain.Basket;
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
	public List<MyClassMain> getMyClassMain(String id, String keyword, String done);
	
	// 서브강의 리스트 조회 함수
	public List<MyClassSub> getMyClassSub(String id, String mymCode);
	
	// 서브강의 진도율 계산 함수
	public Double getProgress(String id, String group);
	
	// 차트 표현 카운트 조회 함수
	public SubTitle getSubCount(String id);
	
	// 결제내역 리스트 조회 함수
	public Map<String, Object> getPayList(String id, int pageNum);
	
	// 결제내역 리스트 수 조회 함수
	public int getPayListCount(String id);
	
	// 장바구니 리스트 조회 함수
	public Map<String, Object> getBasketList(String id, int pageNum);
	
	// 장바구니 리스트 수 조회 함수
	public int getBasketListCount(String id);
	
	// 수강 강의 데이터 조회 함수
	public List<List<Object>> getDoneCount(String id);
	
	// 강의 시청시간 업데이트 함수
	public void updateWatchTime(String id, String hCode, String wTime);
	
	// 가장 최근 수강한 강의 조회 함수
	public MyClassSub getRecentClass(String id);
	
	// 수강완료한 강의 조회 함수
	public List<MyClassSub> getDoneClass(String id);
	
}
