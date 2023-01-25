package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.Study;
import com.cosengcosa.room.domain.StudyAnswer;

public interface StudyDao {

	List<Study> studyList(int startRow,int endRow, int num, String type, String keyword);
	
	int getStudyCount(String type, String keyword);
	
	public abstract Study getStudy(int no, boolean isCount);
	
	public abstract void insertStudy(Study study);
	
	public abstract void updateStudy(Study study);
	
	public abstract void deleteStudy(int no);
	
	
	// 댓글 관련
	public abstract List<StudyAnswer> answerList(int no);
	
	// 게시 글 번호에 해당하는 추천/땡큐를 업데이트 하는 메서드
	public abstract void updateRecommend(int no);
	
	// 게시 글 번호에 해당하는 추천/땡큐 정보를 가져오는 메서드
	public abstract Study getRecommend(int no);
	
	// 게시 글 번호에 해당하는 댓글을 DB에 등록하는 메서드
	public void addReply(StudyAnswer reply);
	
	// DB에서 댓글 번호에 해당하는 댓글을 수정하는 메서드
	public void updateReply(StudyAnswer answer);

	// DB에서 댓글 번호에 해당하는 댓글을 삭제하는 메서드
	public void deleteReply(int no);
	
	public void deleteReplyNum(int no);
}
