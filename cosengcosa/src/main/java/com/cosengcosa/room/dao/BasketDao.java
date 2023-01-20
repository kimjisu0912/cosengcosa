package com.cosengcosa.room.dao;


import java.util.List;

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.ClassMain;

/**
 * 장바구니 Dao 인터페이스
 * @author 박예준/김지수
 *
 */
public interface BasketDao {

	// 장바구니 리스트 요청 시 호출되는 메소드
	public abstract List<Basket> basketList(String userId, String userName);
	
	// 장바구니 중복확인 요청 시 호출되는 메소드
	public abstract int basketCount(String baCmcode, String userId);
	
	// 장바구니에 필요한 강의(메인)정보 메소드
	public abstract ClassMain getClassMainInfo(String baCmcode);
	
	// 장바구니 등록 처리 메소드
	public abstract void insertBasket(Basket basket);
	
}
