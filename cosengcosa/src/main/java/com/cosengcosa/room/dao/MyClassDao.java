package com.cosengcosa.room.dao;

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
	 * 내강의 DAO 인터페이스
	 * @author 김동영
	 * 
	 */
	
	// 메인 결제강의 추가 
	public void insertMyClassMain(String id, ClassMain classMain);
	
	// 서브 결제강의 추가 
	public void insertMyClassSub(String id, int period, ClassSub classSub);
	
	// 메인강의 조회 처리 
	public List<MyClassMain> getMyClassMain(String id, String keyword, String done);
	
	// 서브강의 조회 처리 
	public List<MyClassSub> getMyClassSub(String id, String mymCode);

	// 과목별 수강 강의 수 조회(pie chart 데이터)
	public SubTitle getSubCount(String id);
	
	// 결제강의 리스트 조회 
	public List<Pay> getPayList(String id, int startRow, int endRow);
	
	// 장바강의 리스트 수 조회 
	public int getPayListCount(String id);
	
	// 수강강의 총 개수 조회 
	public int getMyClassMainTotal(String id, String keyword);
	
	// 해당년도 날짜 별 수강완료 서브강의 수 조회(Heat Map 데이터) 
	public List<HeatData> getDoneCount(String start, String end, String id);
	
	// 강의 시청시간 업데이트 처리
	public void updateWatchTime(String id, String hCode, String wTime);
	
	// 강의 시청시간 업데이트 및 수강완료 처리 
	public void updateDone(String id, String hCode, String wTime);
	
	// 강의 런타임 조회 
	public String getRunTime(String id, String hCode);
	
	// 가장 최근 수강한 강의 조회 
	public MyClassSub getRecentClass(String id);
	
	// 수강완료한 강의 조회 
	public List<MyClassSub> getDoneClass(String id);
	
	// 장바구니 리스트 조회 
	public List<Basket> getBasketList(String id, int startRow, int endRow);
	
	// 장바구니 리스트 수 조회 
	public int getBasketListCount(String id);
	
	// 메인강의 수강기간 만료 업데이트 
	public void updateMainEdate(String id);
	
	// 서브강의 수강기간 만료 업데이트 
	public void updateSubEdate(String id);
	
	// 서브강의 수 조회 
	public int subListCount(String id, String group);
	
	// 수강완료한 서브강의 수 조회 
	public int subListDoneCount(String id, String group);
	
}
