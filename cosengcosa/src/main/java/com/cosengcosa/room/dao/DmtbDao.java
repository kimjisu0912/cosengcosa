package com.cosengcosa.room.dao;


import java.util.List;

import com.cosengcosa.room.domain.Dmtb;
import com.cosengcosa.room.domain.Pay;


/**
 * 장바구니 Dao 인터페이스
 * @author 박예준/김지수
 *
 */
public interface DmtbDao {

	//  리스트 요청 시 호출되는 메소드
	public abstract List<Dmtb> dmtbList(String userId, String userName);
	// 결재 등록 하기 전 장바구니 삭제 메소드
	public abstract void dmtbDel();
	// 결재처리 메소드
	public abstract void dmtbAdd(String dmtbNo, String dmtbName, String dmtbCode);
}
