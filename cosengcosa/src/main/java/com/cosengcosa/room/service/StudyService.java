package com.cosengcosa.room.service;

import java.util.List;
import java.util.Map;

import com.cosengcosa.room.domain.Study;
import com.cosengcosa.room.domain.StudyAnswer;

public interface StudyService {
	
	Map<String, Object> studyList(int pageNum, String type, String keyword);
	
	public abstract Study getStudy(int sno, boolean isCount);
	
	public abstract void insertStudy(Study study);

	public abstract void updateStudy(Study study);
	
	public abstract void deleteStudy(int sno);
	
	
	// 댓글
	public abstract List<StudyAnswer> answerList(int no);
	
	public int recommend(int no);
	
	public void addReply(StudyAnswer answer);
	
	public void updateReply(StudyAnswer answer);
	
	public void deleteReply(int no);
}
