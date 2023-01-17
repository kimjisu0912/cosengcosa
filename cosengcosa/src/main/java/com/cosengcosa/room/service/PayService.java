package com.cosengcosa.room.service;

import java.util.Map;

import com.cosengcosa.room.domain.ClassMain;

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
	
	/*
	 * 중복결재를 방지 하기 위한 장바구니 확인 PayDao에 호출 메소드
	 */
	public abstract int baCount(String cmcode);
	
	/*
	 * 중복 결재를 방지 하기 위한 장바구니 삭제 PayDao에 호출 메소드
	 */
	public abstract void baDelete(String cmcode);
	
	/*
	 * 결재에 필요한 강의(메인)정보를 PayDao에 호출 메소드
	 */
	public abstract ClassMain getClassMainInfo(String cmcode);
}
