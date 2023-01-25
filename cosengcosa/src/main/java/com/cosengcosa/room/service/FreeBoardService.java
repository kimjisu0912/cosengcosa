package com.cosengcosa.room.service;

import java.util.List;
import java.util.Map;

import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.FreeBoardCmt;
import com.cosengcosa.room.domain.StudyAnswer;

public interface FreeBoardService {
	Map<String, Object> freeBoardList(int pageNum, String type, String keyword);
	
	public abstract FreeBoard getFreeBoard(int sno, boolean isCount);
	
	public abstract void insertFreeBoard(FreeBoard freeBoard);

	public abstract void updateFreeBoard(FreeBoard freeBoard);
	
	public abstract void deleteFreeBoard(int fno);
	
	
	// 댓글
	public abstract List<FreeBoardCmt> FreeBoardCmtList(int fcno);
	
	public int recommend(int fcno);
	
	public void addReply(FreeBoardCmt freeCmt);
	
	public void updateReply(FreeBoardCmt freeCmt);
	
	public void deleteReply(int fcno);
	
}
