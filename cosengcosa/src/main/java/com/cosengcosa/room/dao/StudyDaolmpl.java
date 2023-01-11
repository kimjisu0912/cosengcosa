package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Study;

@Repository
public class StudyDaolmpl implements StudyDao {
	
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.StudyMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		}

	@Override
	public List<Study> StudyList(int startRow, int num, String type, String keyword) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("startRow", startRow);
		param.put("num", num);
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".studyList", param);
	}
	@Override
	public Study getStudy(int no, boolean isCount) {
		
		/*
		if(isCount) { // 읽은 횟 수 증가
			sqlSession.update(NAME_SPACE + ".incrementReadCount", no);
		}
		*/
		
		// getBoard 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.		 
		return sqlSession.selectOne(NAME_SPACE + ".getStudy", no);
	}
	
	@Override
	public int getStudyCount(String type, String keyword) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getStudyCount", params);
	}

}
