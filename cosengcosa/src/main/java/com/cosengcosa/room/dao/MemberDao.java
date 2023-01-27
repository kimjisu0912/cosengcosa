package com.cosengcosa.room.dao;

import com.cosengcosa.room.domain.Member;

public interface MemberDao {
	
	/**
	 * 멤버 DAO 인터페이스
	 * @author 김동영
	 * 
	 */
	
	// 아이디로 회원정보 조회 
	public Member getMember(String id);
	
	// 회원가입 처리 
	public void addMember(Member member);
	
	// 회원정보 수정 처리 
	public void updateMember(Member member);
	
	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 확인
	public String memberPassCheck(String id, String pass);
	
	// 회원 닉네임 조회 
	public Member getNickName(String nickname);

	// 회원 비밀번호 수정 처리 
	public void updatePass(Member member);
	
	// 회원 탈퇴 처리 
	public void deleteMember(String id);
	
	// 아이디 찾기 
	public Member findMemberId(String name);
	
	// 비밀번호 찾기 
	public Member findMemberPass(Member member);
	
}
