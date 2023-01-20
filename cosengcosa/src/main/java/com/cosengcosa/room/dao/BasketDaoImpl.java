package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.ClassMain;

/**
 * 장바구니 Dao
 * @author 박예준/김지수
 *
 */
@Repository
public class BasketDaoImpl implements BasketDao {

	private final String NAME_SPACE = "com.cosengcosa.room.mapper.BasketMapper";
	
	// 장바구니 sqlSession 생성자 생성
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	/*
	 * 장바구니 리스트 요청 시 호출되는 메소드
	 */
	@Override
	public List<Basket> basketList(String userId, String userName) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("userId", userId);
		params.put("userName", userName);
		return sqlSession.selectList(NAME_SPACE + ".basketList", params);
	}
	
	/*
	 * 장바구니 중복확인 메소드
	 */
	@Override
	public int basketCount(String baCmcode, String userId) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("baCmcode", baCmcode);
		params.put("baMid", userId);
		return sqlSession.selectOne(NAME_SPACE + ".basketCount", params);
	}
	
	/*
	 * 장바구니에 필요한 강의(메인)정보 메소드
	 */
	@Override
	public ClassMain getClassMainInfo(String baCmcode) {
		return sqlSession.selectOne(NAME_SPACE + ".getClassMainInfo", baCmcode);
	}

	/*
	 * 장바구니 등록 메소드
	 */
	@Override
	public void insertBasket(Basket basket) {
		sqlSession.insert(NAME_SPACE + ".insertBasket", basket);
	}
	
}
