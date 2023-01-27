package com.cosengcosa.room.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.Study;

	/** 
	 * 메인페이지 DAO
	 * @author 김동영
	 * 
	 */

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.MainMapper";
	
	// 등록순서로 메인강의 조회
	@Override
	public List<ClassMain> getClassMainListD() {
		
		return sqlSession.selectList(NAME_SPACE + ".getClassMainListD");
	}
	
	// 추천순으로 메인강의 조회
	@Override
	public List<ClassMain> getClassMainListR() {
		return sqlSession.selectList(NAME_SPACE + ".getClassMainListR");
	}

	// 지식공유 게시글 추천수 순으로 리스트 조회
	@Override
	public List<Study> getStudyList() {
		return sqlSession.selectList(NAME_SPACE + ".getStudyList");
	}
	
	// 자유게시판 게시글 조회수 순으로 리스트 조회 
	@Override
	public List<FreeBoard> getFreeBoardList() {
		return sqlSession.selectList(NAME_SPACE + ".getFreeBoardList");
	}

}
