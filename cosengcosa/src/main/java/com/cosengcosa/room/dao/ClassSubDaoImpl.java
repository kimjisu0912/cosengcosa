package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.ClassSub;

/**
 * 서브강의 Dao
 * @author 김지수
 *
 */
@Repository
public class ClassSubDaoImpl implements ClassSubDao {
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.ClassSubMapper";
	
	// 서브강의 sqlSession 생성자 생성
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	/*
	 * 서브강의의 리스트를 요청 시 호출되는 메소드
	 */
	@Override
	public List<ClassSub> classSubList(String cmcode) {
		return sqlSession.selectList(NAME_SPACE + ".classSubList", cmcode);
	}
	
	/*
	 * 서브강의코드 요청 시 호출되는 메소드
	 */
	@Override
	public ClassSub getClassSubCode(String cmcode) {
		return sqlSession.selectOne(NAME_SPACE + ".getClassSubCode", cmcode);
	}

	/*
	 * 서브강의 입력 요청 시 호출되는 메소드
	 */
	@Override
	public void insertClassSub(ClassSub classSub) {
		sqlSession.insert(NAME_SPACE + ".insertClassSub", classSub);
	}

	/*
	 * 서브강의 수정페이지 요청 시 호출되는 메소드
	 */
	@Override
	public ClassSub getClassSub(String cscode) {
		return sqlSession.selectOne(NAME_SPACE + ".getClassSub", cscode);
	}

	/*
	 * 서브강의 수정 요청 시 호출되는 메소드
	 */
	@Override
	public void updateClassSub(ClassSub classSub) {
		sqlSession.update(NAME_SPACE + ".updateClassSub", classSub);
	}
	
}
