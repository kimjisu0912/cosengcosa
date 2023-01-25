package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.RequestBoard;

@Repository
public class RequestBoardDaolmpl implements RequestBoardDao {

	private final String NAME_SPACE = "com.cosengcosa.room.mapper.RequestBoardMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		}

	
	@Override
	public List<RequestBoard> boardList(int startRow, int endRow, int num, String type, String keyword) {

		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("type", type);
		param.put("keyword", keyword);
		
		
		return sqlSession.selectList(NAME_SPACE + ".boardList", param);
	}

	@Override
	public int getBoardCount(String type, String keyword) {

		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);
	}

	@Override
	public RequestBoard getBoard(int no, boolean isCount) {
	
		if(isCount) { // 읽은 횟 수 증가
			sqlSession.update(NAME_SPACE + ".incrementReadCount", no);
		}
		// getBoard 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.		 
		return sqlSession.selectOne(NAME_SPACE + ".getBoard", no);
	}

	@Override
	public void insertBoard(RequestBoard board) {
		sqlSession.insert(NAME_SPACE + ".insertBoard", board);		
	}

	@Override
	public void updateBoard(RequestBoard board) {
		sqlSession.update(NAME_SPACE + ".updateBoard", board);				
	}

	@Override
	public void deleteBoard(int no) {
		
		System.out.println(no);
		
		sqlSession.delete(NAME_SPACE + ".deleteBoard", no);		
	}


	@Override
	public void updateAnswer(RequestBoard board) {
		
		System.out.println(board.getAnswer());
		System.out.println(board.getNo());
		
		sqlSession.update(NAME_SPACE + ".updateAnswer", board);
	}

}
