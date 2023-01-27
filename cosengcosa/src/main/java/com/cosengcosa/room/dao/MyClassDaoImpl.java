package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.ClassSub;
import com.cosengcosa.room.domain.HeatData;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;

/**
 * 내강의 DAO
 * @author 김동영
 * 
 */
@Repository
public class MyClassDaoImpl implements MyClassDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.MyClassMapper";
	
	// 메인 결제강의 추가
	@Override
	public void insertMyClassMain(String id, ClassMain classMain) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("cmCode", classMain.getCmCode());
		params.put("cmTitle", classMain.getCmTitle());
		params.put("cmName", classMain.getCmName());
		params.put("cmContent", classMain.getCmContent());
		params.put("cmPeriod", classMain.getCmPeriod());
		params.put("cmPrice", classMain.getCmPrice());
		
		sqlSession.insert(NAME_SPACE + ".insertMyClassMain", params);
	}
	
	// 서브 결제강의 추가 
	@Override
	public void insertMyClassSub(String id, int period, ClassSub classSub) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("csCode", classSub.getCsCode());
		params.put("csGroup", classSub.getCsGroup());
		params.put("csTitle", classSub.getCsTitle());
		params.put("csContent", classSub.getCsContent());
		params.put("period", period);
		params.put("csVideo", classSub.getCsVideo());
		params.put("csRuntime", classSub.getCsRuntime());
		
		sqlSession.insert(NAME_SPACE + ".insertMyClassSub", params);
	}
	
	// 메인강의 조회 처리
	@Override
	public List<MyClassMain> getMyClassMain(String id, String keyword, String done) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("keyword", keyword);
		params.put("done", done);
		return sqlSession.selectList(NAME_SPACE + ".getMyClassMain", params);
	}
	
	// 서브강의 조회 처리
	@Override
	public List<MyClassSub> getMyClassSub(String id, String mymCode) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("mymCode", mymCode);
		
		return sqlSession.selectList(NAME_SPACE + ".getMyClassSub", params);
	}
	
	// 과목별 수강 강의 수 조회(pie chart 데이터)
	@Override
	public SubTitle getSubCount(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getSubCount", id);
	}
	
	// 수강강의 총 개수 조회
	@Override
	public int getMyClassMainTotal(String id, String keyword) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getMyClassMainTotal", params);
	}
	
	// 해당년도 날짜 별 수강완료 서브강의 수 조회(Heat Map 데이터) 
	@Override
	public List<HeatData> getDoneCount(String start, String end, String id) {
		

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("start", start);
		params.put("end", end);
		
		return sqlSession.selectList(NAME_SPACE + ".getDoneCount", params);
	}
	
	// 가장 최근 수강한 강의 조회 
	@Override
	public MyClassSub getRecentClass(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getRecentClass", id);
	}
	
	// 수강완료한 강의 조회 
	@Override
	public List<MyClassSub> getDoneClass(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getDoneClass", id);
	}
	
	// 강의 시청시간 업데이트 
	@Override
	public void updateWatchTime(String id, String hCode, String wTime) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("hCode", hCode);
		params.put("wTime", wTime);
		
		sqlSession.update(NAME_SPACE + ".updateWatchTime", params);
	}
	
	// 강의 시청시간 업데이트 및 수강완료 처리
	@Override
	public void updateDone(String id, String hCode, String wTime) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("hCode", hCode);
		params.put("wTime", wTime);
		
		sqlSession.update(NAME_SPACE + ".updateDone", params);
	}
	// 강의 런타임 조회 
	@Override
	public String getRunTime(String id, String hCode) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("hCode", hCode);
		
		return sqlSession.selectOne(NAME_SPACE + ".getRunTime", params);
	}
	
	// 결제내역 리스트 조회 
	@Override
	public List<Pay> getPayList(String id, int startRow, int endRow) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		
		return sqlSession.selectList(NAME_SPACE + ".getPayList", params);
	}

	// 결제내역 리스트 수 조회
	@Override
	public int getPayListCount(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getPayListCount", id);
		
	}

	// 장바구니 리스트 조회
	@Override
	public List<Basket> getBasketList(String id, int startRow, int endRow) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		
		return sqlSession.selectList(NAME_SPACE + ".getBasketList", params);
	}
	
	// 장바구니 리스트 수 조회 
	@Override
	public int getBasketListCount(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getBasketListCount", id);
		
	}
	
	// 메인강의 수강기간 만료 업데이트
	@Override
	public void updateMainEdate(String id) {
		
		sqlSession.update(NAME_SPACE + ".updateMainEdate", id);
		
	}
	
	// 서브강의 수강기간 만료 업데이트
	@Override
	public void updateSubEdate(String id) {
		
		sqlSession.update(NAME_SPACE + ".updateSubEdate", id);
		
	}
	
	// 서브강의 수 조회 
	@Override
	public int subListCount(String id, String group) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("group", group);
		
		return sqlSession.selectOne(NAME_SPACE + ".subListCount", params);
	}
	
	// 수강완료한 서브강의 수 조회
	@Override
	public int subListDoneCount(String id, String group) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("group", group);
		
		return sqlSession.selectOne(NAME_SPACE + ".subListDoneCount", params);
	}
	
	
	
	

}
