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
	
	// 메인 강의리스트 조회 
	public List<MyClassMain> getMyClassMain(String id, String keyword, String done);
	
	// 서브강의 리스트 조회 
	public List<MyClassSub> getMyClassSub(String id, String mymCode);
	
	// 서브강의 진도율 계산 
	public Double getProgress(String id, String group);
	
	// 과목별 수강 강의 수 조회(pie chart 데이터) 
	public SubTitle getSubCount(String id);
	
	// 결제내역 리스트 조회 
	public Map<String, Object> getPayList(String id, int pageNum);
	
	// 결제내역 리스트 수 조회 
	public int getPayListCount(String id);
	
	// 장바구니 리스트 조회 
	public Map<String, Object> getBasketList(String id, int pageNum);
	
	// 장바구니 리스트 수 조회 
	public int getBasketListCount(String id);
	
	// 해당년도 날짜 별 수강완료 서브강의 수 조회(Heat Map 데이터) 
	public List<List<Object>> getDoneCount(String id);
	
	// 강의 시청시간 업데이트 처리
	public void updateWatchTime(String id, String hCode, String wTime);
	
	// 가장 최근 수강한 강의 조회 
	public MyClassSub getRecentClass(String id);
	
	// 수강완료한 강의 조회 
	public List<MyClassSub> getDoneClass(String id);
	
}
