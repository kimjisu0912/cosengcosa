package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.FreeBoardCmt;

@Repository
public class FreeBoardDaolmpl implements FreeBoardDao {

	private final String NAME_SPACE = "com.cosengcosa.room.mapper.FreeBoardMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		}
	
	@Override
	public List<FreeBoard> freeBoardList(int startRow, int endRow, int num, String type, String keyword) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("num", num);
		param.put("type", type);
		param.put("keyword", keyword);
		
		
		return sqlSession.selectList(NAME_SPACE + ".freeBoardList", param);
	}

	@Override
	public int getFreeBoardCount(String type, String keyword) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getFreeBoardCount", params);
	}

	@Override
	public FreeBoard getFreeBoard(int fno, boolean isCount) {
		return sqlSession.selectOne(NAME_SPACE + ".getFreeBoard", fno);
	}

	@Override
	public void insertFreeBoard(FreeBoard freeBoard) {
		sqlSession.insert(NAME_SPACE + ".insertFreeBoard",freeBoard);
	}

	@Override
	public void updateFreeBoard(FreeBoard freeBoard) {
		System.out.println("3333");
		System.out.println(freeBoard.getfNo());
		System.out.println(freeBoard.getfTitle());
		System.out.println(freeBoard.getfContent());
		sqlSession.update(NAME_SPACE + ".updateFreeBoard",freeBoard);
	}

	@Override
	public void deleteFreeBoard(int fno) {
		sqlSession.delete(NAME_SPACE + ".deleteFreeBoard",fno);
	}

	@Override
	public List<FreeBoardCmt> answerList(int no) {
		return sqlSession.selectList(NAME_SPACE + ".freeBoardCmtList", no);
	}

	@Override
	public void updateRecommend(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FreeBoard getRecommend(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addReply(FreeBoardCmt cmt) {
		sqlSession.insert(NAME_SPACE + ".addFreeCmt", cmt);	
		
	}

	@Override
	public void updateReply(FreeBoardCmt cmt) {
		sqlSession.update(NAME_SPACE + ".updateFreeCmt", cmt);	
		
	}

	@Override
	public void deleteReply(int no) {
		sqlSession.delete(NAME_SPACE + ".deleteFreeCmt", no);	
		
	}

}
