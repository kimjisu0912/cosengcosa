package com.cosengcosa.room.service;

import java.util.List;

import com.cosengcosa.room.domain.ClassMain;

public interface MainService {
	
	/**
	 * 메인 서비스 인터페이스
	 * @author 김동영
	 * 
	 */
	// 등록 순서로 메인강의 리스트 조회 메서드
	public List<ClassMain> getClassMainListD();
	
	// 추천순으로 메인강의 리스트 조회 메서드
	public List<ClassMain> getClassMainListR();
}
