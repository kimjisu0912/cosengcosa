package com.cosengcosa.room.service;

import java.util.List;
import java.util.Map;

import com.cosengcosa.room.domain.Member;

public interface MemberService {
	
	/**
	 * 멤버 서비스 인터페이스
	 * @author 김동영
	 * 
	 */
	
	// 로그인 처리
	public int login(String id, String pass);	
	
	// 아이디로 회원정보 조회
	public Member getMember(String id);
	
	// 회원 가입시 아이디 중복을 체크
	public boolean overlapIdCheck(String id);
	
	// 회원가입 처리
	public void addMember(Member member);
	
	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 확인
	public boolean memberPassCheck(String id, String pass);
	
	// 회원 정보 수정 처리
	public void updateMember(Member member);
	
	// 회원가입, 회원정보 수정시 닉네임 중복확인 
	public boolean overlapNickNameCheck(String nickname);
	
	// 비밀번호 수정
	public void updatePass(Member member);
	
	// 회원 탈퇴 처리 
	public void deleteMember(String id);
	
	// 아이디 찾기
	public Map<String, Object> findMemberIdChk(String name, String email);
	
	// 이름으로 아이디 조회
	public List<Member> findMemberId(String name);
	
	// 비밀번호 찾기 
	public Map<String, Object> findMemberPass(String id, String email);
	
	// 이메일 발송 메서드
	//public void sendEmail(Member member, String div) throws Exception;

}
