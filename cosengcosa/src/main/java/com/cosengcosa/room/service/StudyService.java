package com.cosengcosa.room.service;

import java.util.Map;

import com.cosengcosa.room.domain.Study;

public interface StudyService {
	
	Map<String, Object> studyList(int pageNum, String type, String keyword);
	
	public abstract Study getStudy(int sno, boolean isCount);
	
	public abstract void insertStudy(Study study);

	public boolean isPassCheck(int no, String pass);
	
	public abstract void updateStudy(Study study);
	
	public abstract void deleteStudy(int no);
}
