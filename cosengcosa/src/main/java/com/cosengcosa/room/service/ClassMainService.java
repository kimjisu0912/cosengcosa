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

	

	public abstract void insertBoard(ClassMain cl);

	public abstract Map<String, Object> getDetail(int cmNo, boolean b, String cmCode, String userid);

//	public abstract void detailVideo(video);

	



	



	/* public abstract ClassMain getDelete(int cmNo, boolean b); */

	

	
}
