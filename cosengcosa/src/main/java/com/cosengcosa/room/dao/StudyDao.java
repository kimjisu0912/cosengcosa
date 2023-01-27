package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.Study;
import com.cosengcosa.room.domain.StudyAnswer;

public interface StudyDao {
	// 지식공유 리스트
	List<Study> studyList(int startRow,int endRow, int num, String type, String keyword);
	// 총 개수
	int getStudyCount(String type, String keyword);
	// 번호에 맞는 데이터
	public abstract Study getStudy(int no, boolean isCount);
	// 등록
	public abstract void insertStudy(Study study);
	// 수정
	public abstract void updateStudy(Study study);
	// 삭제
	public abstract void deleteStudy(int no);
	
	
	// 댓글 관련
	//답변 리스트
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
	
	// 답변글 삭제
	public void deleteReplyNum(int no);
}
