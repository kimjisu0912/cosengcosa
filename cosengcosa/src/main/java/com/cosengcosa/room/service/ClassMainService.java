package com.cosengcosa.room.service;

import java.util.Map;

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
}
