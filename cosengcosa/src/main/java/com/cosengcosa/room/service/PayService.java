package com.cosengcosa.room.service;

import java.util.Map;

/**
 * 결재 서비스 인터페이스
 * @author 김지수
 *
 */

public interface PayService {

	/*
	 * 결재 리스트를 PayDao에 호출 메소드
	 */
	public abstract Map<String, Object> payList(int pageNum, String type, String keyword, String userid);
}
