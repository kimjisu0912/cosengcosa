package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.ClassMain;

public interface MainDao {

	/** 
	 * 메인페이지 DAO
	 * @author 김동영
	 * 
	 */
	
	// 등록순서로 메인강의 조회
	public List<ClassMain> getClassMainListD();
	
	// 추천순으로 메인강의 조회
	public List<ClassMain> getClassMainListR();

}
