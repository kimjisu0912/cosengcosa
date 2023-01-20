package com.cosengcosa.room.service;

import java.util.List;

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.ClassMain;

/**
 * 장바구니 서비스 인터페이스
 * @author 박예준/김지수
 *
 */
public interface BasketService {

	/*
	 * 장바구니 리스트를 BasketDao에 호출 메소드
	 */
	public abstract List<Basket> basketList(String userId, String userName);
	
	/*
	 * 장바구니 중복확인 BasketDao에 호출 메소드
	 */
	public abstract int basketCount(String baCmcode, String userId);
	
	/*
	 * 장바구니에 필요한 강의(메인)정보를 BasketDao에 호출 메소드
	 */
	public abstract ClassMain getClassMainInfo(String baCmcode);
	
	/*
	 * 장바구니 등록처리 BasketDao에 호출 메소드
	 */
	public abstract void insertBasket(Basket basket);
}
