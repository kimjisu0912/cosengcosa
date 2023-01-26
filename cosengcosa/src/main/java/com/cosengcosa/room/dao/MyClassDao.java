package com.cosengcosa.room.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.ClassSub;
import com.cosengcosa.room.domain.HeatData;
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
	// 메인 결제강의 추가 함수
	public void insertMyClassMain(String id, ClassMain classMain);
	
	// 서브 결제강의 추가 함수
	public void insertMyClassSub(String id, int period, ClassSub classSub);
	
	// 메인강의 조회 처리 함수
	public List<MyClassMain> getMyClassMain(String id, String keyword, String done);
	
	// 서브강의 조회 처리 함수
	public List<MyClassSub> getMyClassSub(String id, String mymCode);

	// 과목별 수강 강의수 카운트 함수
	public SubTitle getSubCount(String id);
	
	// 결제강의 리스트 조회 함수
	public List<Pay> getPayList(String id, int startRow, int endRow);
	
	// 장바강의 리스트 수 조회 함수
	public int getPayListCount(String id);
	
	// 수강강의 총 개수 조회 함수
	public int getMyClassMainTotal(String id, String keyword);
	
	// 1년 수강 강의 데이터 조회 함수
	public List<HeatData> getDoneCount(String start, String end, String id);
	
	// 강의 시청시간 업데이트 함수
	public void updateWatchTime(String id, String hCode, String wTime);
	
	// 강의 시청시간 업데이트 및 수강완료 처리 함수
	public void updateDone(String id, String hCode, String wTime);
	
	// 강의 런타임 조회 함수
	public String getRunTime(String id, String hCode);
	
	// 가장 최근 수강한 강의 조회 함수
	public MyClassSub getRecentClass(String id);
	
	// 수강완료한 강의 조회 함수
	public List<MyClassSub> getDoneClass(String id);
	
	// 장바구니 리스트 조회 함수
	public List<Basket> getBasketList(String id, int startRow, int endRow);
	
	// 장바구니 리스트 수 조회 함수
	public int getBasketListCount(String id);
	
	// 메인강의 수강기간 만료 업데이트 함수
	public void updateMainEdate(String id);
	
	// 서브강의 수강기간 만료 업데이트 함수
	public void updateSubEdate(String id);
	
	// 서브강의 수 조회 함수
	public int subListCount(String id, String group);
	
	// 수강완료한 서브강의 수 조회 함수
	public int subListDoneCount(String id, String group);
	
}
