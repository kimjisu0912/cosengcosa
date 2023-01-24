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
	
	
	// 메인강의 상세조회 시 결재 처음유무 조회 요청 시 호출되는 메소드
	public abstract String payCountChk(String cmCode, String userid);
	// 메인강의 상세조회 시 결재 상태값 조회 요청 시 호출되는 메소드
	public abstract ClassMain payChk(String cmCode, String userid);
	// 메인강의 상세조회 요청 시 호출되는 메소드
	public abstract ClassMain getDetail(int cmNo, boolean isCount);
	// 메인강의 비디오조회 요청 시 유무 확인 메소드
	public abstract int getDetailVideoChk(String cmCode);
	// 메인강의 비디오조회 요청 시 호출되는 메소드
	public abstract ClassMain getCmVideo(String cmCode);
	// 메인강의 장바구니 체크 요청 시 호출되는 메소드
	public abstract int classMainBasketCount(String cmCode, String userid);
	
	// 메인강의 결재 날자 체크 요청 시 호출되는 메소드
	public abstract String payChkDay(String cmCode, String userid);
	// 메인강의 결재 날자 변경 요청 시 호출되는 메소드
	public abstract void updatePayChk(String cmCode, String userid, String pChk);
	
	// 메인강의 코드 체크 ajax 요청시 호출되는 메소드
	public abstract int cmCodeCount(String cmCode);
	// 메인 강의 등록하는 페이지 요청시 호출되는 메소드  
	public abstract void classMainInsert(ClassMain classMain);
	// 메인강의 수정 페이지 요청시 호출되는 메소드 
	public abstract void classMainUpdate(ClassMain classMain);
	
	
	
	// main 강의 삭제를 요청시 호출되는 메소드 
	public abstract void classMainDelete(String cmCode);
		//main 강의 삭제시 서브강의 삭제를 요청하면 호출되는 메소드
	public abstract void classMainSubDelete(String cmCode);

	
	
	
	
	
	
	
	
	
	
	

	

	

	
	
	
	
	
}
