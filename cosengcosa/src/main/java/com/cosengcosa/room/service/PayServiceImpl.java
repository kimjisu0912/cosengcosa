package com.cosengcosa.room.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.PayDao;
import com.cosengcosa.room.domain.Pay;

/**
 * 결재 서비스
 * @author 김지수
 *
 */

@Service
public class PayServiceImpl implements PayService{

	// 결재DAO 생성자 생성
	@Autowired
	private PayDao payDao;
	
	public void setPayDao(PayDao payDao) {
		this.payDao = payDao;
	}
	
	// 한페이지에 보여 줄 게ㅣ 글의 수
	private static final int PAGE_SIZE = 10;
	
	// 한 페이지 페이지네이션
	// [이전]123...8910 [다음]
	private static final int PAGE_GROUP = 10;

	/*
	 * 결재 리스트 서비스
	 */
	@Override
	public Map<String, Object> payList(int pageNum, String datePicker1, String datePicker2, String userid) {
		// 첫 호출시 유무
		if(datePicker1.equals("null") || datePicker2.equals("null")) {
		 LocalDate now = LocalDate.now();
		 LocalDate preNow = now.minusMonths(3);
		 LocalDate nextNow = now;
		 datePicker1 = preNow.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		 datePicker2 = nextNow.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		}
		// currentPage 현재페이지
		int currentPage = pageNum;
		
		// 시작행
		int startRow = (currentPage-1) * PAGE_SIZE +1;
		
		// 마지막행
		int endRow = (startRow + PAGE_SIZE) -1;
		
		// 전체 결재 글 수
		int listCount = payDao.getPayCount(datePicker1, datePicker2, userid); // 동적쿼리 적용
		
		// 현재 페이지에 해당하는 결재 리스트데이터 가져오기
		List<Pay> payList = payDao.payList(startRow, endRow, PAGE_SIZE, datePicker1, datePicker2, userid);
		
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
		boolean searchOption = (datePicker1.equals("null") || datePicker2.equals("null")) ? false : true;
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("payList", payList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		modelMap.put("searchOption", searchOption);
		
		if(searchOption) {
			if(datePicker1.length() > 8) {
				modelMap.put("datePicker1", datePicker1);
				modelMap.put("datePicker2", datePicker2);
			}else {
				LocalDate afterDatePicker1 = LocalDate.parse(datePicker1, DateTimeFormatter.ofPattern("yyyyMMdd"));
				LocalDate afterDatePicker2 = LocalDate.parse(datePicker2, DateTimeFormatter.ofPattern("yyyyMMdd"));
				modelMap.put("datePicker1", afterDatePicker1);
				modelMap.put("datePicker2", afterDatePicker2);
			}
			
		}
		
		return modelMap;
	}
}
