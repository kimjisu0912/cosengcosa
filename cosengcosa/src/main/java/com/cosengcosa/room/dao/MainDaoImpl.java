package com.cosengcosa.room.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.ClassMain;

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.MainMapper";
	
	// 등록순서로 메인강의 리스트 조회 메서드
	@Override
	public List<ClassMain> getClassMainListD() {
		
		return sqlSession.selectList(NAME_SPACE + ".getClassMainListD");
	}
	
	// 등록순서로 메인강의 리스트 조회 메서드
	@Override
	public List<ClassMain> getClassMainListR() {
		return sqlSession.selectList(NAME_SPACE + ".getClassMainListR");
	}

}
