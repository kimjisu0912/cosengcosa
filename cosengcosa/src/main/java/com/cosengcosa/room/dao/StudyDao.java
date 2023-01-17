package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.Study;

public interface StudyDao {

	List<Study> studyList(int startRow,int endRow, int num, String type, String keyword);
	
	int getStudyCount(String type, String keyword);
	
	public abstract Study getStudy(int no, boolean isCount);
	
	public abstract void insertStudy(Study study);
	
	public abstract void updateStudy(Study study);
	
	public abstract void deleteStudy(int no);
	
	public abstract void writeStudy();
	
}
