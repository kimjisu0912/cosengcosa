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
import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.HeatData;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;

@Service
public class MyClassServiceImpl implements MyClassService {

	@Autowired
	private MyClassDao myClassDao;
	
	// 메인강의 리스트 조회
	@Override
	public List<MyClassMain> getMyClassMain(String id) {
		
		return myClassDao.getMyClassMain(id);
	}

	// 서브강의 리스트 조회 함수
	@Override
	public List<MyClassSub> getMyClassSub(String id, String mymCode) {
		return myClassDao.getMyClassSub(id, mymCode);
	}
	
	// 차트 표현 카운트 조회 함수
	@Override
	public SubTitle getSubCount(String id) {
		return myClassDao.getSubCount(id);
	}
	
	// 결제내역 리스트 조회 함수
	@Override
	public List<Pay> getPayList(String id) {
		return myClassDao.getPayList(id);
	}


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
		
		//System.out.println("dataList : " + dataList.size());
		
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
		/**
		for(List<Object> d : dataList) {
			System.out.println(d);
		}
		**/
		return dataList;
	}

	// 강의 시청시간 업데이트 함수
	@Override
	public void updateWatchTime(String id, String hCode, String wTime) {
		
		//System.out.println("myClassServiceImpl : ID :  " + id);
		//System.out.println("myClassServiceImpl : hCode :  " + hCode);
		//System.out.println("myClassServiceImpl : wTime :  " + wTime);
		// 런타임 조회하기
		String sRuntime = myClassDao.getRunTime(id, hCode);
		//System.out.println("sRuntime : " + sRuntime);
		String sMin = sRuntime.split(":")[0];
		String sSec = sRuntime.split(":")[1];
		
		Double min = Double.parseDouble(sMin) * 60;
		Double sec = Double.parseDouble(sSec);
		Double runtime = min + sec;
		
		//System.out.println("런타임" + runtime);
		
		Double wtime = Double.parseDouble(wTime);
		
		//System.out.println("시청시간" + wtime);
		// 시청시간이 90프로 이상일때는 수강완료 처리
		if(wtime / runtime >= 0.9) {
			
			myClassDao.updateDone(id, hCode, wTime);
			
		} else { // 시청시간이 90프로 미만일 때는 시청시간 업데이트 만
			
			myClassDao.updateWatchTime(id, hCode, wTime);
		}
		
	}


	@Override
	public MyClassSub getRecentClass(String id) {
		return myClassDao.getRecentClass(id);
	}


	@Override
	public List<MyClassSub> getDoneClass(String id) {
		
		return myClassDao.getDoneClass(id);
	}

	@Override
	public List<Basket> getBasketList(String id) {
		
		return myClassDao.getBasketList(id);
	}

}
