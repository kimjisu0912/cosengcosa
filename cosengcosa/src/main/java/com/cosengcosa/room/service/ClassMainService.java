package com.cosengcosa.room.service;

import java.util.Map;

import com.cosengcosa.room.domain.ClassMain;

/**
 * 메인강의 서비스 인터페이스
 * @author 김지수/박예준
 *
 */

public interface ClassMainService {

	/*
	 * 메인강의 리스트를 ClassMainDao에 호출 메소드
	 */
	public abstract Map<String, Object> classMainList(int pageNum, String type, String keyword);

	// 메인 상세페이지를 ClassMainDao에 호출하는 메소드 
	public abstract Map<String, Object> getDetail(int cmNo, boolean b, String cmCode, String userid);
	
	// 메인페이지에서 등록하는 페이지를 ClassMainDao에 호출하는 메소드 
	public abstract void classMainInsert(ClassMain classMain);
	// 메인강의 수정 
	public abstract void classMainUpdate(ClassMain classMain);
	
	//메인 상세페이지에서 cmNo를 이용하여 삭제하는 메소드
	public abstract void classMainDelete(int cmNo);

	

	

	

	



	



	



	/* public abstract ClassMain getDelete(int cmNo, boolean b); */

	

	
}
