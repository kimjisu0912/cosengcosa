package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.domain.RequestBoard;

public interface RequestBoardDao {
	
	List<RequestBoard> boardList(int startRow,int endRow, int num, String type, String keyword);
	
	int getBoardCount(String type, String keyword);
	
	public abstract RequestBoard getBoard(int no, boolean isCount);
	public abstract Member getRequestMember(String userid);
	
	public abstract void insertBoard(RequestBoard board);
	
	public abstract void updateBoard(RequestBoard board);
	
	public abstract void deleteBoard(int no);
	
	public abstract void updateAnswer(RequestBoard board);
}
