package com.cosengcosa.room.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.MyClassDao;
import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.HeatData;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;

@Service
public class MyClassServiceImpl implements MyClassService {

	@Autowired
	private MyClassDao myClassDao;
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 5;
	
	// 메인강의 리스트 조회
	@Override
	public List<MyClassMain> getMyClassMain(String id, String keyword, String done) {
		
		// 수강만료 된 강의 업데이트 처리
		myClassDao.updateMainEdate(id);
		myClassDao.updateSubEdate(id);
		
		return myClassDao.getMyClassMain(id, keyword, done);
		
	}

	// 서브강의 리스트 조회
	@Override
	public List<MyClassSub> getMyClassSub(String id, String mymCode) {
		return myClassDao.getMyClassSub(id, mymCode);
	}
	
	// 강의 진도율 계산 
	@Override
	public Double getProgress(String id, String group) {
		
		double total = myClassDao.subListCount(id, group);
		double done = myClassDao.subListDoneCount(id, group);
		double progress = done / total * 100;
		
		return progress;
	}
	
	// 차트 표현 카운트 조회 
	@Override
	public SubTitle getSubCount(String id) {
		return myClassDao.getSubCount(id);
	}
	
	// 날짜별 수강완료 강의 수 카운트
	@Override
	public List<List<Object>> getDoneCount(String id) {
		
		Calendar cal = Calendar.getInstance();
		// 2023-01-01
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String start = String.valueOf(cal.get(Calendar.YEAR)) + "-" + "01-01";		
		String end = String.valueOf(cal.get(Calendar.YEAR)) + "-" + "12-31";
		
		List<HeatData> heatDataList = myClassDao.getDoneCount(start, end, id);
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		
		int monthDay = 0;
		
		for(int month = 1; month <= 12; month++) {
			
			if(month == 1 || month == 3 || month == 5 || month == 7
					|| month == 8 || month == 10 || month == 12) { // 31				
				monthDay = 31;
				
			} else if(month == 4 || month == 6 || month == 9 || month == 11) { // 30
				monthDay = 30;
				
			} else { // 2월
				monthDay = 28;				
			}			
			
			for(int day = 1; day <= monthDay; day++) {
				
				String date = ""; 				
				date = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
				
				dataMap.put(date, 0);
			}				
		}
				
		// Map 데이터 수정
		for(int i = 0; i < heatDataList.size(); i++) {
			
			HeatData hData = heatDataList.get(i);
			String key = hData.getDdate();
			
			dataMap.put(key, hData.getCnt());
		}		
		
		List<List<Object>> dataList = new ArrayList<List<Object>>();		
		Set<String> keySet = dataMap.keySet();
		
		for(String key : keySet) {
			List<Object> dList = new ArrayList<Object>();
			dList.add(key);
			dList.add(dataMap.get(key));
			dataList.add(dList);
		}		
		
		int cnt = 0;
		for(int i = 0; i < dataList.size() - 1; i++) {
			
			for(int j = 0; j < dataList.size() - 1 - i; j++) {
				
				String data1 = (String) dataList.get(j).get(0); 
				String data2 = (String) dataList.get(j+1).get(0);
				
				if(data1.compareTo(data2) > 0) {
					List<Object> temp = dataList.get(j+1);
					dataList.set(j+1, dataList.get(j));
					dataList.set(j, temp);
				}
			}			
		}
		return dataList;
	}

	// 최근 시청강의 조회 
	@Override
	public MyClassSub getRecentClass(String id) {
		return myClassDao.getRecentClass(id);
	}
	
	// 강의 시청시간 업데이트
	@Override
	public void updateWatchTime(String id, String hCode, String wTime) {
		
		// 런타임 조회하기
		String sRuntime = myClassDao.getRunTime(id, hCode);
		String sMin = sRuntime.split(":")[0];
		String sSec = sRuntime.split(":")[1];
		Double min = Double.parseDouble(sMin) * 60;
		Double sec = Double.parseDouble(sSec);
		Double runtime = min + sec;
		Double wtime = Double.parseDouble(wTime);
		
		// 시청시간이 90프로 이상일때는 수강완료 처리
		if(wtime / runtime >= 0.9) {
			
			myClassDao.updateDone(id, hCode, wTime);
			
		} else { // 시청시간이 90프로 미만일 때는 시청시간 업데이트 만
			
			myClassDao.updateWatchTime(id, hCode, wTime);
		}
		
	}

	

	
	// 수강완료한 강의 조회
	@Override
	public List<MyClassSub> getDoneClass(String id) {
		return myClassDao.getDoneClass(id);
	}
	
	// 결제내역 리스트 조회 
	@Override
	public Map<String, Object> getPayList(String id, int pageNum) {
		
		int currentPage = pageNum;
		int startRow = (currentPage-1) * PAGE_SIZE +1;
		int endRow = (startRow + PAGE_SIZE) -1;
		int listCount = myClassDao.getPayListCount(id);
		
		List<Pay> pList = myClassDao.getPayList(id, startRow, endRow);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		int endPage = startPage + PAGE_GROUP -1;
		int pageCount = listCount / PAGE_SIZE
				+ (listCount % PAGE_SIZE == 0? 0:1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("pList", pList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		
		
		return modelMap;
	}
		
	// 결제내역 리스트 수 조회 
	@Override
	public int getPayListCount(String id) {
		return myClassDao.getBasketListCount(id);
	}

	// 장바구니 리스트 조회
	@Override
	public Map<String, Object> getBasketList(String id, int pageNum) {
		
		// currentPage 현재페이지
		int currentPage = pageNum;
				
		// 시작행
		int startRow = (currentPage-1) * PAGE_SIZE +1;
		
		// 마지막행
		int endRow = (startRow + PAGE_SIZE) -1;
				
		int listCount = myClassDao.getBasketListCount(id);
		
		List<Basket> bList = myClassDao.getBasketList(id, startRow, endRow);
		
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
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("bList", bList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		
		return modelMap;
	}

	// 장바구니 리스트 수 조회 
	@Override
	public int getBasketListCount(String id) {
		
		return  myClassDao.getBasketListCount(id);
	}

	

}
