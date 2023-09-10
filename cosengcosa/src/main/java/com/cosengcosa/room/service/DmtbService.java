package com.cosengcosa.room.service;

import java.util.List;


import com.cosengcosa.room.domain.Dmtb;

/**
 * 장바구니 서비스 인터페이스
 * @author 박예준/김지수
 *
 */
public interface DmtbService {

	/*
	 * 리스트를 호출 메소드
	 */
	public abstract List<Dmtb> dmtbList(String userId, String userName);
	
	public abstract void dmtbDel();
	
	public abstract void dmtbAdd(String[] dmtbNameArr, String[] dmtbCodeArr);
}
