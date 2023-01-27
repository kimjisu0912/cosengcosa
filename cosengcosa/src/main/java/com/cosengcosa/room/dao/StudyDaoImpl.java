package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Study;
import com.cosengcosa.room.domain.StudyAnswer;
/**
 * 지식공유Dao
 * @author 김태윤
 *
 */

@Repository
public class StudyDaoImpl implements StudyDao {
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.StudyMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		}
	
	// 지식공유 리스트
	@Override
	public List<Study> studyList(int startRow, int endRow, int num, String type, String keyword) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("type", type);
		param.put("keyword", keyword);
		
		
		return sqlSession.selectList(NAME_SPACE + ".studyList", param);
	}
	
	// 번호에 맞는 리스트 값
	@Override
	public Study getStudy(int no, boolean isCount) {
		
		
		if(isCount) { // 읽은 횟 수 증가
			sqlSession.update(NAME_SPACE + ".incrementReadCount", no);
		}
		
		// getBoard 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.		 
		return sqlSession.selectOne(NAME_SPACE + ".getStudy", no);
	}
	
	// 총 개수
	@Override
	public int getStudyCount(String type, String keyword) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getStudyCount", params);
	}
	
	// 등록
	@Override
	public void insertStudy(Study study) {
		sqlSession.insert(NAME_SPACE + ".insertStudy", study);
	}

	// 수정
	@Override
	public void updateStudy(Study study) {
		sqlSession.update(NAME_SPACE + ".updateStudy", study);		
	}

	// 삭제
	@Override
	public void deleteStudy(int sno) {
		sqlSession.delete(NAME_SPACE + ".deleteStudy", sno);		
	}

	// 답변 리스트
	@Override
	public List<StudyAnswer> answerList(int no) {
		return sqlSession.selectList(NAME_SPACE + ".answerList", no);
	}

	// 추천수 
	@Override
	public void updateRecommend(int no) {
		
		sqlSession.update(NAME_SPACE + ".updateRecommend", no);
	}

	// 추천수
	@Override
	public Study getRecommend(int no) {
		return sqlSession.selectOne(NAME_SPACE + ".getRecommend", no);
	}

	// 답변 등록
	@Override
	public void addReply(StudyAnswer answer) {
		sqlSession.insert(NAME_SPACE + ".addAnswer", answer);		
	}
	
	// 답변 수정
	@Override
	public void updateReply(StudyAnswer answer) {
		sqlSession.update(NAME_SPACE + ".updateAnswer", answer);		
	}

	// 답변 삭제
	@Override
	public void deleteReply(int no) {
		sqlSession.delete(NAME_SPACE + ".deleteAnswer", no);		
	}

	// 게시글에 전체 답변 삭제
	@Override
	public void deleteReplyNum(int no) {
		sqlSession.delete(NAME_SPACE + ".deleteAnswerNum", no);		
	}


}
