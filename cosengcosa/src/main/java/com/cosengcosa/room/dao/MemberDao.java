package com.cosengcosa.room.dao;

import com.cosengcosa.room.domain.Member;

public interface MemberDao {
	
	/**
	 * 멤버 DAO
	 * @author 김동영
	 * 
	 */
	
	// 회원정보 조회 메서드
	public Member getMember(String id);
	
	// 회원가입 처리 메서드
	public void addMember(Member member);
	
	// 회원정보 수정 처리 메서드
	public void updateMember(Member member);
	
	// 회원 비밀번호 확인 메서드
	public String memberPassCheck(String id, String pass);
	
	// 회원 닉네임 조회 메서드
	public Member getNickName(String nickname);

	// 회원 비밀번호 수정 처리 메서드
	public void updatePass(Member member);
	
	// 회원 탈퇴 처리 메서드
	public void deleteMember(String id);
	
	// 아이디 찾기 메서드
	public Member findMemberId(String name);
	
	// 비밀번호 찾기 메서드
	public Member findMemberPass(Member member);
	
}
