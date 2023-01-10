package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Pay;

/**
 * 결재 Dao
 * @author 김지수
 *
 */

@Repository
public class PayDaoImpl implements PayDao {
	
	// Mapper선언
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.PayMapper";
	
	// 결재 sqlSession 생성자 생성
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/*
	 * 결재 총 건수 요청 시 호출되는 메소드
	 */
	@Override
	public int getPayCount(String datePicker1, String datePicker2, String userid) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("userid", userid);
		params.put("datePicker1", datePicker1);
		params.put("datePicker2", datePicker2);

		return sqlSession.selectOne(NAME_SPACE + ".getPayCount", params);
	}

	/*
	 * 결재의 리스트를 요청 시 호출되는 메소드
	 */
	@Override
	public List<Pay> payList(int startRow, int endRow, int num, String datePicker1, String datePicker2, String userid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("num", num);
		params.put("userid", userid);
		params.put("datePicker1", datePicker1);
		params.put("datePicker2", datePicker2);

		return sqlSession.selectList(NAME_SPACE + ".payList", params);
	}

}
