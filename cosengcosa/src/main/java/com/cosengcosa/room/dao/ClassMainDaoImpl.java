package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.ClassMain;

/**
 * 메인강의 Dao
 * @author 김지수/박예준
 *
 */
@Repository
public class ClassMainDaoImpl implements ClassMainDao {

	// src/main/resources/repository/mappers/ClassMainMapper.xml에 정의한 Mapper namespace를 상수로 정의
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.ClassMainMapper";
	
	/*
	 * MyBatis가 제공하는 SqlSessionTemplate 객체를 사용하기 
	 * 때문에 스프링으로부터 DI 받을 수 있도록 생성자나 setter를 준비해야 한다.
	 * 
	 * mybatis-spring 모듈은 MyBatis의 SqlSession 기능과 스프링 DB 지원 기능을
	 * 연동해 주는 SqlSessionTemplate 클래스를 제공한다. SqlSessionTemplate은
	 * SqlSession을 구현해 스프링 연동 부분을 구현하였기 때문에 우리가 만드는 DAO에서
	 * SqlSessionTemplate 객체를 사용해 SqlSession에 정의된 메서드를 사용할 수 있다.
	 * 
	 * SqlSession과 SqlSessionTemplate는 같은 역할을 담당하고 있지만 트랜잭션
	 * 처리에서 다른 부분이 있다. SqlSession은 commit(), rollback() 메서드를
	 * 명시적으로 호출해 트랜잭션을 처리 하지만 SqlSessionTemplate은 스프링이
	 * 트랜잭션을 처리할 수 있도록 구현되어 있기 때문에 별도로 commit(), rollback()
	 * 메서드를 호출할 필요가 없다.
	 */
	// 메인강의 sqlSession 생성자 생성
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/*
	 * 메인강의의 숫자를 요청 시 호출되는 메소드
	 */
	@Override
	public int getClassMainCount(String type, String keyword) {
		// 받는 파라미터가 같은 String이여서 Object 사용않함
		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		return sqlSession.selectOne(NAME_SPACE + ".getClassMainCount", params);
	}

	/*
	 * 메인강의의 리스트를 요청 시 호출되는 메소드
	 */
	@Override
	public List<ClassMain> classMainList(int startRow, int num, String type, String keyword) {
		// 받는 파라미터가 다른 타입이므로 Object 사용함
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startRow", startRow);
		param.put("num", num);
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".classMainList", param);
	}

}
