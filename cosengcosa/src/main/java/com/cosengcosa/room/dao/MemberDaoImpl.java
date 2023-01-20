package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Member;
	
	/**
	 * 메인페이지 컨트롤러
	 * @author 김동영
	 * 
	 */


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.MemberMapper";

	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}
	
	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

	@Override
	public void updateMember(Member member) {
		sqlSession.update(NAME_SPACE + ".updateMember",	member);
	}

	@Override
	public String memberPassCheck(String id, String pass) {
		return sqlSession.selectOne(NAME_SPACE + ".memberPassCheck",	id);
	}

	@Override
	public Member getNickName(String nickname) {
		return sqlSession.selectOne(NAME_SPACE + ".getNickname", nickname);
	}

	@Override
	public void updatePass(Member member) {
		sqlSession.update(NAME_SPACE + ".updatePass", member);
	}
	
	// 아이디 찾기 메서드
	@Override
	public String findMemberId(String name, String tel) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", name);
		params.put("tel", tel);
		
		return sqlSession.selectOne(NAME_SPACE + ".findId", params);
	}

	@Override
	public Member findMemberPass(Member member) {
		return sqlSession.selectOne(NAME_SPACE + ".findPass", member);
	}

	
	
	// 비밀번호 찾기 메서드

}
