package com.cosengcosa.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.MainDao;
import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.Study;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;
	
	// 등록 순서로 메인강의 리스트 조회 메서드
	@Override
	public List<ClassMain> getClassMainListD() {
		return mainDao.getClassMainListD();
	}

	// 추천순으로 메인강의 리스트 조회 메서드
	@Override
	public List<ClassMain> getClassMainListR() {
		return mainDao.getClassMainListR();
	}

	// 지식공유 게시글 추천순으로 리스트 조회 메서드
	@Override
	public List<Study> getStudyList() {
		return mainDao.getStudyList();
	}
	
	// 자유게시판 게시글 추천순으로 리스트 조회 메서드
	@Override
	public List<FreeBoard> getFreeBoardList() {
		return mainDao.getFreeBoardList();
	}
	
	

}
