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
	public List<ClassMain> classMainList(int startRow, int endRow, int num, String type, String keyword) {
		// 받는 파라미터가 다른 타입이므로 Object 사용함
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".classMainList", param);
	}

	/*
	 * 메인강의의 상세조회 시 결재 처음유무 조회 요청 시 호출되는 메소드
	 */
	@Override
	public String payCountChk(String cmCode, String userid) {
		// 받는 파라미터가 같은 타입이므로 String 사용함
		Map<String, String> param = new HashMap<String, String>();
		param.put("cmCode", cmCode);
		param.put("userid", userid);
		return sqlSession.selectOne(NAME_SPACE + ".payCountChk", param);
	}

	/*
	 * 메인강의의 상세조회 시 결재 상태값 조회 요청 시 호출되는 메소드
	 */
	@Override
	public ClassMain payChk(String cmCode, String userid) {
		// 받는 파라미터가 같은 타입이므로 String 사용함
		Map<String, String> param = new HashMap<String, String>();
		param.put("cmCode", cmCode);
		param.put("userid", userid);
		return sqlSession.selectOne(NAME_SPACE + ".payChk", param);
	}
	
	
	/*
	 * 메인강의의 리스트를 요청 시 호출되는 메소드
	 */
	@Override
	public ClassMain getDetail(int cmNo, boolean isCount) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getDetail", cmNo) ;
	}
	
	/*
	 * 메인강의 비디오조회 요청 시 호출되는 메소드
	 */
	@Override
	public ClassMain getCmVideo(String cmCode) {
		return sqlSession.selectOne(NAME_SPACE + ".detailVideo", cmCode);
	}

	/*
	 * 메인강의 장바구니 확인 요청 시 호출되는 메소드
	 */
	@Override
	public int classMainBasketCount(String cmCode, String userid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("cmCode", cmCode);
		param.put("userid", userid);
		return sqlSession.selectOne(NAME_SPACE + ".classMainBasketCount", param);
	}
	
	/*
	 * 메인강의 코드 체크 ajax 호출되는 메소드
	 */
	@Override
	public int cmCodeCount(String cmCode) {
		return sqlSession.selectOne(NAME_SPACE + ".cmCodeCount", cmCode);
	}
	
	
	/*
	 * 메인강의 추가시 호출되는 메소드 
	 */
	@Override
	public void classMainInsert(ClassMain classMain) {
		
		sqlSession.insert(NAME_SPACE + ".classMainInsert", classMain);
	}
	
	/*
	 * 메인강의 수정시 호출되는 메소드 
	 */
	@Override
	public void classMainUpdate(ClassMain classMain) {
		
		sqlSession.update(NAME_SPACE + ".classMainUpdate", classMain);
	}
	
	// 글 삭제 요청시 호출되는 메서드



	/*
	 * 메인강의 비디오조회 요청 시 유무 확인 메소드
	 */
	@Override
	public int getDetailVideoChk(String cmCode) {
		return sqlSession.selectOne(NAME_SPACE + ".detailVideoChk", cmCode);
	}

	/*
	 * 메인강의 삭제 요청시 확인 메소드
	 */
	@Override
	public void classMainDelete(String cmCode) {
		sqlSession.update(NAME_SPACE + ".classMainDelete", cmCode);
		
	}

	@Override
	public void classMainSubDelete(String cmCode) {
		sqlSession.update(NAME_SPACE + ".classMainSubDelete", cmCode);
		
	}

	/*
	 * 메인강의 결재 날자 체크
	 */
	@Override
	public String payChkDay(String cmCode, String userid) {
		// 받는 파라미터가 같은 타입이므로 String 사용함
		Map<String, String> param = new HashMap<String, String>();
		param.put("cmCode", cmCode);
		param.put("userid", userid);
		return sqlSession.selectOne(NAME_SPACE + ".payChkDay", param);
	}

	/*
	 * 메인강의 결재 날자 변경
	 */
	@Override
	public void updatePayChk(String cmCode, String userid, String pChk) {
		// 받는 파라미터가 같은 타입이므로 String 사용함
		Map<String, String> param = new HashMap<String, String>();
		param.put("cmCode", cmCode);
		param.put("userid", userid);
		param.put("pChk", pChk);
		sqlSession.update(NAME_SPACE + ".updatePayChk", param);
	}
	
}

