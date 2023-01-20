package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.HeatData;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;

/**
 * 내강의 DAO
 * @author 김동영
 * 
 */
@Repository
public class MyClassDaoImpl implements MyClassDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.MyClassMapper";
	
	// 메인강의 조회 처리함수
	@Override
	public List<MyClassMain> getMyClassMain(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getMyClassMain", id);
	}
	// 서브강의 조회 처리함수
	@Override
	public List<MyClassSub> getMyClassSub(String id, String mymCode) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("mymCode", mymCode);
		
		return sqlSession.selectList(NAME_SPACE + ".getMyClassSub", params);
	}
	
	// 과목별 수강 강의수 카운트 함수
	@Override
	public SubTitle getSubCount(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getSubCount", id);
	}
	
	// 결제내역 리스트 호출 함수
	@Override
	public List<Pay> getPayList(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getPayList", id);
	}
	
	// 수강강의 총 개수 카운트 함수
	@Override
	public int getMyClassMainTotal(String id, String keyword) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getMyClassMainTotal", params);
	}
	@Override
	public List<HeatData> getDoneCount(String start, String end, String id) {
		

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("id", id);
		
		return sqlSession.selectList(NAME_SPACE + ".getDoneCount", params);
	}
	
	// 강의 시청시간 업데이트 함수
	@Override
	public void updateWatchTime(String id, String hCode, String wTime) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("hCode", hCode);
		params.put("wTime", wTime);
		
		sqlSession.update(NAME_SPACE + ".updateWatchTime", params);
		
	}
	
	// 강의 시청시간 업데이트 및 수강완료 처리 함수
	@Override
	public void updateDone(String id, String hCode, String wTime) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("hCode", hCode);
		params.put("wTime", wTime);
		
		sqlSession.update(NAME_SPACE + ".updateDone", params);
		
	}
	// 강의 런타임 조회 함수
	@Override
	public String getRunTime(String id, String hCode) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("hCode", hCode);
		
		return sqlSession.selectOne(NAME_SPACE + ".getRunTime", params);
	}
	
	// 가장 최근 수강한 강의 조회 함수
	@Override
	public MyClassSub getRecentClass(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getRecentClass", id);
	}
	
	// 수강완료한 강의 조회 함수
	@Override
	public List<MyClassSub> getDoneClass(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getDoneClass", id);
	}
	
	// 장바구니 리스트 조회 함수
	@Override
	public List<Basket> getBasketList(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getBasketList", id);
	}
	
	
	

}
