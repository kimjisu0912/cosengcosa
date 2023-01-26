package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.ClassSub;
import com.cosengcosa.room.domain.Pay;

/**
 * 결재 Dao 인터페이스
 * @author 김지수
 *
 */

public interface PayDao {

	// 페이지 수를 계산하기 위해 필요한 전체 강의의 수를 읽어와 반환하는 메소드
	int getPayCount(String type, String keyword, String userid);
	
	// 결재리스트 요청 시 호출되는 메소드
	public abstract List<Pay> payList(int startRow, int endRow, int PAGE_SIZE, String type, String keyword, String userid);
	
	// 결재 등록 하기 전 장바구니 확인 메소드
	public abstract int baCount(String cmcode, String userid);
	
	// 결재 등록 하기 전 장바구니 삭제 메소드
	public abstract void baDelete(String cmcode, String userid);
	
	// 결재에 필요한 강의(메인)정보 메소드
	public abstract ClassMain getClassMainInfo(String cmcode);
	
	// 결재에 필요한 강의(서브)정보 메소드
	public abstract List<ClassSub> getClassSubInfo(String cmcode);
		
	// 결재처리 메소드
	public abstract void insertPay(Pay pay);
	
	
}
