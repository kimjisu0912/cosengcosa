package com.cosengcosa.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.ClassMainDao;
import com.cosengcosa.room.domain.ClassMain;



/**
 * 메인강의 서비스
 * @author 김지수/박예준
 *
 */

@Service
public class ClassMainServiceImpl implements ClassMainService {

	// 메인강의DAO 생성자 생성
	@Autowired
	private ClassMainDao classMainDao;
	
	public void setClassMainDao(ClassMainDao classMainDao) {
		this.classMainDao = classMainDao;
	}
	
	// 한페이지에 보여 줄 게ㅣ 글의 수
	private static final int PAGE_SIZE = 10;
	
	// 한 페이지 페이지네이션
	// [이전]123...8910 [다음]
	private static final int PAGE_GROUP = 10;
	
	/*
	 * 메인강의 리스트 서비스
	 */
	@Override
	public Map<String, Object> classMainList(int pageNum, String type, String keyword) {
		// currentPage 현재페이지
		int currentPage = pageNum;
		
		// 시작행
		int startRow = (currentPage-1) * PAGE_SIZE +1;
		
		// 마지막행
		int endRow = (startRow + PAGE_SIZE) -1;
		
		// 전체 게시 글 수
		int listCount = classMainDao.getClassMainCount(type, keyword); // 동적쿼리 적용
		
		// 현재 페이지에 해당하는 강의 리스트데이트 가져오기(현재 시작페이지 시작위치와 페이지사이즈 필요)
		List<ClassMain> classMainList = classMainDao.classMainList(startRow, endRow, PAGE_SIZE, type, keyword);
		
		// 시작페이지
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		// 끝페이지
		int endPage = startPage + PAGE_GROUP -1;
		
		// 전체 페이지수 계산
		// 딱 떨어지면 좋지만 남는 페이지가 나올 수 가 있다 그걸 보정해줘야된다 예> 20페이지 하고 3row값이 남는경우
		int pageCount = listCount / PAGE_SIZE
				+ (listCount % PAGE_SIZE == 0? 0:1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		// 현재 처리된 요청이 검색에 인지 아닌지 확인여부
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("classMainList", classMainList);
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
	public Map<String, Object> getDetail(int cmNo, boolean b, String cmCode, String userid) {
		String payChk = "";
		Map<String, Object> modelMap = new HashMap<String, Object>();
		// 비로그인
		ClassMain classMain = classMainDao.getDetail(cmNo, b);
		ClassMain cv = classMainDao.getCmVideo(cmCode);
		String cmVideo = cv.getCmVideo();
		// 로그인
		if(userid == null) {
			payChk = "N";
		}
		else{
			// 1. 한번이라도 결재가 되어있는지 확인
			String cnt = classMainDao.payCountChk(cmCode, userid);
			if(cnt.equals("0")) {	// 2-1. 결재가 한번도 없는 경우는 = N 리턴
				payChk = "N";
			}else { // 2-2. 결재가 한번 이상 있는 경우 한번 더 체크
				// 3. 결재상태 값 확인 (Y인지 N인지)
				ClassMain cm = classMainDao.payChk(cmCode, userid);
				payChk = cm.getPayChk();
			}
		}
		
		
		modelMap.put("classMain", classMain);
		modelMap.put("payChk", payChk);
		modelMap.put("cmVideo", cmVideo);
		return modelMap;
	}

	@Override
	public void insertBoard(ClassMain cl) {
		
		
	}


	/*
	 * @Override public ClassMain getDelete(int cmNo, boolean b) { 
	 * 
	 * 
	 * }
	 */

	



}
