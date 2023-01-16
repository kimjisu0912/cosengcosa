package com.cosengcosa.room.service;

import java.util.List;

import com.cosengcosa.room.domain.ClassSub;

/**
 * 서브강의 서비스 인터페이스
 * @author 김지수
 *
 */

public interface ClassSubService {
	
	/*
	 * 서브강의 리스트를 ClassSubDao에 호출 메소드
	 */
	public abstract List<ClassSub> classSubList(String cmcode);
	
	/*
	 * 서브강의 코드값을 ClassSubDao에 호출 메소드
	 */
	public abstract ClassSub getClassSubCode(String cmcode);
	
	/*
	 * 서브강의 입력 ClassSubDao에 호출 메소드
	 */
	public abstract void insertClassSub(ClassSub classSub); 
}
