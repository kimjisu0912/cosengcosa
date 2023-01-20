package com.cosengcosa.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.BasketDao;
import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.ClassMain;

/**
 * 장바구니 서비스
 * @author 박예준/김지수
 *
 */
@Service
public class BasketServiceImpl implements BasketService {

	// 장바구니DAO 생성자 생성
	@Autowired
	private BasketDao basketDao;
	
	public void setBasketDao(BasketDao basketDao) {
		this.basketDao = basketDao;
	}
	
	/*
	 * 장바구니 리스트 서비스
	 */
	@Override
	public List<Basket> basketList(String userId, String userName) {
		return basketDao.basketList(userId, userName);
	}

	/*
	 * 장바구니 중복확인 서비스
	 */
	@Override
	public int basketCount(String baCmcode, String userId) {
		return basketDao.basketCount(baCmcode, userId);
	}

	/*
	 * 장바구니에 필요한 강의(메인)정보 서비스
	 */
	@Override
	public ClassMain getClassMainInfo(String baCmcode) {
		return basketDao.getClassMainInfo(baCmcode);
	}

	/*
	 * 장바구니 등록처리 서비스
	 */
	@Override
	public void insertBasket(Basket basket) {
		basketDao.insertBasket(basket);
	}

}
