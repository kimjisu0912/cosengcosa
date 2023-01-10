package com.cosengcosa.room.dao;

import java.util.List;

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
}
