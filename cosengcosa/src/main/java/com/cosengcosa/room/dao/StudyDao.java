package com.cosengcosa.room.dao;

import java.util.List;

import com.cosengcosa.room.domain.Study;

public interface StudyDao {

	List<Study> StudyList(int startRow, int num, String type, String keyword);
	
	int getStudyCount(String type, String keyword);
	
	public abstract Study getStudy(int no, boolean isCount);
}
