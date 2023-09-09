package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Dmtb;


/**
 * 장바구니 Dao
 * @author 박예준/김지수
 *
 */
@Repository
public class DmtbDaoImpl implements DmtbDao {

	private final String NAME_SPACE = "com.cosengcosa.room.mapper.DmtbMapper";
	
	// sqlSession 생성자 생성
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	/*
	 * 리스트 요청 시 호출되는 메소드
	 */
	@Override
	public List<Dmtb> dmtbList(String userId, String userName) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("userId", userId);
		params.put("userName", userName);
		return sqlSession.selectList(NAME_SPACE + ".dmtbList", params);
	}
	
	
}
