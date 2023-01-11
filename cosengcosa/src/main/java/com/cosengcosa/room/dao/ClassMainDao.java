package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.ClassMain;

/**
 * 메인강의 Dao 인터페이스
 * @author 김지수/박예준
 *
 */

public interface ClassMainDao {

	// 페이지 수를 계산하기 위해 필요한 전체 강의의 수를 읽어와 반환하는 메소드
	// 인터페이스라 앞에 생략도 가능
	int getClassMainCount(String type, String keyword);
	
	// 메인강의리스트 요청 시 호출되는 메소드
	public abstract List<ClassMain> classMainList(int startRow, int endRow, int num, String type, String keyword);

	ClassMain getDetail(int cmNo, boolean b);

	

	
	
	
	
	
}
