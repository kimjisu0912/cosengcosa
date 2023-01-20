package com.cosengcosa.room.service;

import javax.servlet.http.HttpServletResponse;

import com.cosengcosa.room.domain.Member;

public interface MemberService {
	
	/**
	 * 멤버 서비스 인터페이스
	 * @author 김동영
	 * 
	 */
	
	public int login(String id, String pass);	
		
	/**
	 * 한 명의 회원 정보를 반환하는 메서드
	 * @param no는 member 테이블의 Primary Key
	 * @return no에 해당하는 회원 정보를 Member 객체로 반환
	 **/
	public Member getMember(String id);
	
	
	
	// 회원 가입시 DAO를 이용해 아이디 중복을 체크하는 메서드
	public boolean overlapIdCheck(String id);
	
	// 회원 정보를 DAO를 이용해 회원 테이블에 저장하는 메서드
	public void addMember(Member member);
	
	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
	public boolean memberPassCheck(String id, String pass);
	
	// 회원 정보를 DAO를 이용해 회원 테이블에서 수정하는 메서드
	public void updateMember(Member member);
	
	// 회원가입, 회원정보 수정시 닉네임 중복확인 메서드
	public boolean overlapNickNameCheck(String nickname);
	
	// 비밀번호 수정 메서드
	public void updatePass(Member member);
	
	// 아이디 찾기 메서드
	public String findMemberId(String name, String tel);
	
	// 비밀번호 찾기 메서드
	public void findMemberPass(HttpServletResponse response, Member member) throws Exception;
	
	// 이메일 발송 메서드
	public void sendEmail(Member member, String div) throws Exception;

}
