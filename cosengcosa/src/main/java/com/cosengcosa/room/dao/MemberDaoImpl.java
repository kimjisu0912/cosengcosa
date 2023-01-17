package com.cosengcosa.room.dao;

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

}
