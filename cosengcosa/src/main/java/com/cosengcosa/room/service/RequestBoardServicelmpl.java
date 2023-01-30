package com.cosengcosa.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.RequestBoardDao;
import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.domain.RequestBoard;

@Service
public class RequestBoardServicelmpl implements RequestBoardService {
	
	@Autowired
	private RequestBoardDao requestBoardDao;
	
	public void setRequestBoardDao(RequestBoardDao requestBoardDao) {
		this.requestBoardDao = requestBoardDao;
	}
	
	private static final int PAGE_SIZE = 5;
	
	private static final int PAGE_GROUP = 5;
	
	@Override
	public Map<String, Object> boardList(int pageNum, String type, String keyword) {

		int currentPage = pageNum;
		
		// 현재 페이지에 해당하는 시작 index 0부터 시작
		// 1 = 0, 2 = 10, 3 = 20,
		// 1 = 10 / 10 = 1, 2 = 20 / 10 = 2, 3 = 30
		int startRow = (currentPage - 1) * PAGE_SIZE + 1;
		
		int endRow = (startRow + PAGE_SIZE) -1 ;
		
		
		// 페이징 처리를 이해 필요한 데이터 
		// 전체 게시 글 수
		int listCount = requestBoardDao.getBoardCount(type, keyword);
		
		// 현재 페이지에 해당하는 게시 글 리스트 
		List<RequestBoard> boardList = 
				requestBoardDao.boardList(startRow, endRow,PAGE_SIZE, type, keyword);
		
		// 페이지네이션을 구성하기 위해 필요한 데이터  
		// 1~10  ->[이전] 1 2 3  ....   8 9 10 [다음]
		// 21~30  ->[이전] 21 22 23  ....   28 29 30 [다음]		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
							- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
				
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		// 전체 페이지 수 계산
		int pageCount = listCount / PAGE_SIZE
						+ (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		// 현재 처리되는 요청이 검색 요청인지 여부
		boolean searchOption = 
				(type.equals("null") || keyword.equals("null")) ? false : true;	
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("boardList", boardList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		modelMap.put("searchOption", searchOption);
		
		if(searchOption) {
			modelMap.put("type", type);
			modelMap.put("keyword", keyword);
		}
		
		return modelMap;
	}


	@Override
	public RequestBoard getBoard(int no, boolean isCount) {
		return requestBoardDao.getBoard(no, isCount);
	}
	@Override
	public Member getRequestMember(String userid) {
		return requestBoardDao.getRequestMember(userid);
	}

	@Override
	public void insertBoard(RequestBoard board) {
		requestBoardDao.insertBoard(board);		
	}


	@Override
	public void updateBoard(RequestBoard board) {
		requestBoardDao.updateBoard(board);		
	}

	@Override
	public void deleteBoard(int no) {
		requestBoardDao.deleteBoard(no);		
	}


	@Override
	public void updateAnswer(RequestBoard board) {
		requestBoardDao.updateAnswer(board);
	}


	



}
