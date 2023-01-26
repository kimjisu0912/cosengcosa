package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 추천이력 Dao
 * @author 김지수
 *
 */
@Repository
public class RecommendDaoImpl implements RecommendDao {
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.RecommendMapper";
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/*
	 * 추천이력 입력 ajax 호출되는 메소드
	 */
	@Override
	public int insertRecommend(String cmcode, String userid) {
		// 받는 파라미터가 같은 String이여서 Object 사용않함
		Map<String, String> params = new HashMap<String, String>();
		params.put("cmcode", cmcode);
		params.put("userid", userid);
		return sqlSession.insert(NAME_SPACE + ".insertRecommend", params);
	}

	/*
	 * 추천이력 업데이트 ajax 요청시 호출되는 메소드
	 */
	@Override
	public void classMainRecommendUpdate(String cmcode) {
		sqlSession.update(NAME_SPACE + ".classMainRecommendUpdate", cmcode);
	}

	/*
	 * 추천 이력 확인 ajax 요청시 호출되는 메소드
	 */
	@Override
	public int recommendCount(String cmcode, String userid) {
		// 받는 파라미터가 같은 String이여서 Object 사용않함
		Map<String, String> params = new HashMap<String, String>();
		params.put("cmcode", cmcode);
		params.put("userid", userid);
		return sqlSession.selectOne(NAME_SPACE + ".recommendCount", params);
	}

}
