package com.cosengcosa.room.service;

import java.util.List;

import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.Study;

public interface MainService {
	
	/**
	 * 메인 서비스 인터페이스
	 * @author 김동영
	 * 
	 */
	// 등록 순서로 메인강의 리스트 조회 
	public List<ClassMain> getClassMainListD();
	
	// 추천순으로 메인강의 리스트 조회 
	public List<ClassMain> getClassMainListR();
	
	// 지식공유 게시글 추천수 순으로 리스트 조회 
	public List<Study> getStudyList();
	
	// 자유게시판 게시글 조회수 순으로 리스트 조회 
	public List<FreeBoard> getFreeBoardList();
}
