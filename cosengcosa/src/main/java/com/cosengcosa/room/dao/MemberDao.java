package com.cosengcosa.room.dao;

import com.cosengcosa.room.domain.Member;

public interface MemberDao {
	
	/**
	 * 멤버 DAO
	 * @author 김동영
	 * 
	 */
	
	// 회원정보 조회 함수
	public Member getMember(String id);
	
	// 회원가입 처리합수
	public void addMember(Member member);
	
	// 회원정보 수정 처리함수
	public void updateMember(Member member);
	
	// 회원 비밀번호 확인 함수
	public String memberPassCheck(String id, String pass);
	
	// 회원 닉네임 조회 함수
	public Member getNickName(String nickname);

	// 회원 비밀번호 수정 처리함수
	public void updatePass(Member member);
	
}
