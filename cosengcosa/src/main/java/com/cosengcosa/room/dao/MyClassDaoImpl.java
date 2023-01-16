package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;

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
	
	@Override
	public List<MyClassMain> getMyClassMain(String id) {
		return sqlSession.selectList(NAME_SPACE + ".getMyClassMain", id);
	}

	@Override
	public List<MyClassSub> getMyClassSub(String id, String mymCode) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("mymCode", mymCode);
		
		return sqlSession.selectList(NAME_SPACE + "getMyClassSub", params);
	}

}