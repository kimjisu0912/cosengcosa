package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.FreeBoardCmt;

public interface FreeBoardDao {
	List<FreeBoard> freeBoardList(int startRow,int endRow, int num, String type, String keyword);
	
	int getFreeBoardCount(String type, String keyword);
	
	public abstract FreeBoard getFreeBoard(int no, boolean isCount);
	
	public abstract void insertFreeBoard(FreeBoard freeBoard);
	
	public abstract void updateFreeBoard(FreeBoard freeBoard);
	
	public abstract void deleteFreeBoard(int no);
	
	
	// 댓글 관련
	public abstract List<FreeBoardCmt> answerList(int no);
	
	// 게시 글 번호에 해당하는 추천/땡큐를 업데이트 하는 메서드
	public abstract void updateRecommend(int no);
	
	// 게시 글 번호에 해당하는 추천/땡큐 정보를 가져오는 메서드
	public abstract FreeBoard getRecommend(int no);
	
	// 게시 글 번호에 해당하는 댓글을 DB에 등록하는 메서드
	public void addReply(FreeBoardCmt cmt);
	
	// DB에서 댓글 번호에 해당하는 댓글을 수정하는 메서드
	public void updateReply(FreeBoardCmt cmt);

	// DB에서 댓글 번호에 해당하는 댓글을 삭제하는 메서드
	public void deleteReply(int no);
}
