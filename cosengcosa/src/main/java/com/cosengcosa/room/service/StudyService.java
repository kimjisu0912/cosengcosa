package com.cosengcosa.room.service;

import java.util.Map;

import com.cosengcosa.room.domain.Study;

public interface StudyService {
	
	Map<String, Object> boardList(int pageNum, String type, String keyword);
	
	public abstract Study getStudy(int no, boolean isCount);
	
}
