package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.ClassSub;

/**
 * 서브강의 Dao 인터페이스
 * @author 김지수
 *
 */

public interface ClassSubDao {
	
	// 서브강의리스트 요청 시 호출되는 메소드
	public abstract List<ClassSub> classSubList(String cmcode);
	
	// 서브강의코드 요청 시 호출되는 메소드
	public abstract ClassSub getClassSubCode(String cmcode);
	
	// 서브강의 입력 요청 시 호출되는 메소드
	public abstract void insertClassSub(ClassSub classSub);
}
