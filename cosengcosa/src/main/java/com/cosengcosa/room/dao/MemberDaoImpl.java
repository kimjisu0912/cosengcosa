package com.cosengcosa.room.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosengcosa.room.domain.Member;
	
	/**
	 * 멤버 DAOImpl
	 * @author 김동영
	 * 
	 */


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.cosengcosa.room.mapper.MemberMapper";
	
	// 회원정보 조회 메서드
	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}
	
	// 회원가입 처리 메서드
	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

	// 회원정보 수정 처리 메서드
	@Override
	public void updateMember(Member member) {
		sqlSession.update(NAME_SPACE + ".updateMember",	member);
	}
	
	// 회원 비밀번호 확인 메서드
	@Override
	public String memberPassCheck(String id, String pass) {
		return sqlSession.selectOne(NAME_SPACE + ".memberPassCheck",	id);
	}
	
	// 회원 닉네임 조회 메서드
	@Override
	public Member getNickName(String nickname) {
		return sqlSession.selectOne(NAME_SPACE + ".getNickname", nickname);
	}
	
	// 회원 비밀번호 수정 처리 메서드
	@Override
	public void updatePass(Member member) {
		sqlSession.update(NAME_SPACE + ".updatePass", member);
	}
	
	// 회원 탈퇴 처리 메서드 
	@Override
	public void deleteMember(String id) {
		sqlSession.update(NAME_SPACE + ".deleteMember", id);
	}
	
	// 아이디 찾기 메서드
	@Override
	public Member findMemberId(String name) {		
		return sqlSession.selectOne(NAME_SPACE + ".findId", name);
	}
	
	// 비밀번호 찾기 메서드
	@Override
	public Member findMemberPass(Member member) {
		
		return sqlSession.selectOne(NAME_SPACE + ".findPass", member);
	}

	

	

}
