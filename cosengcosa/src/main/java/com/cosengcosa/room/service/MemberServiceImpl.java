package com.cosengcosa.room.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	// 로그인 처리 
	@Override
	public int login(String id, String pass) {
		
		Member m = memberDao.getMember(id);
		
		int result = -1;		
		
		// id가 존재하지 않으면
		if(m == null) {
			return result;
		}
			
		if(passwordEncoder.matches(pass, m.getPass())) {
			result = 1;
			
		} else { // 비밀번호가 틀리면
				result = 0;
		}
		
		return result;
	}

	// 아이디로 회원정보 조회
	@Override
	public Member getMember(String id) {
		return memberDao.getMember(id);
	}
	
	
	// 아이디 중복확인
	@Override
	public boolean overlapIdCheck(String id) {
		Member member = memberDao.getMember(id);
		System.out.println("overlapIdCheck - member : " + member);
		if(member == null) {
			return false;
		}
		return true;
	}
	
	// 회원가입 처리
	@Override
	public void addMember(Member member) {
		// BCryptPasswordEncoder 객체를 이용해 비밀번호를 암호화한 후 저장
		member.setPass(passwordEncoder.encode(member.getPass()));
		
		memberDao.addMember(member);
	}

	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 확인
	@Override
	public boolean memberPassCheck(String id, String pass) {
		String dbPass = memberDao.memberPassCheck(id, pass);		
		boolean result = false;		
		
		if(passwordEncoder.matches(pass, dbPass)) {
			result = true;	
		}
		return result;
	}

	// 회원가입, 회원정보 수정 시에 닉네임 중복확인
	@Override
	public boolean overlapNickNameCheck(String nickname) {
		Member member = memberDao.getNickName(nickname);
		System.out.println("overlapNickNameCheck - member : " + member);
		if(member == null) {
			return false;
		}
		return true;
	}
	
	// 회원정보 수정 
	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}


	// 비밀번호 변경
	@Override
	public void updatePass(Member member) {
		member.setPass(passwordEncoder.encode(member.getPass()));
		
		memberDao.updatePass(member);
		
	}

	// 회원 탈퇴 처리 
	@Override
	public void deleteMember(String id) {
		memberDao.deleteMember(id);
	}

	
	// 아이디 찾기
	@Override
	public int findMemberIdChk(String name, String email) {		
		
		Member member = memberDao.findMemberId(name);
		int result = -1;
		
		if(member == null) {
			return result;
		}
		
		if(member.getEmail().equals(email)) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}
	
	// 이름으로 회원정보 조회 
	@Override
	public Member findMemberId(String name) {
		
		return memberDao.findMemberId(name);
	}

	
	// 비밀번호 찾기 
	@Override
	public Map<String, Object> findMemberPass(String id, String email){
		
		Member member = memberDao.getMember(id);
		
		String pass = "";
		int result = -1;
		
		// 아이디로 조회되는 회원이 없을때
		if(member == null) {
			result = -1;
		}
		
		// 이메일이 회원정보와 일치할 때
		if(member.getEmail().equals(email)) {
			
			// 임시비밀번호 생성
			for (int i = 0; i < 12; i++) {
				pass += (char) ((Math.random() * 26) + 97);
			}
			member.setPass(passwordEncoder.encode(pass));;
			// 임시 비밀번호로 회원 비밀번호 변경
			memberDao.updatePass(member);
			
			result = 1;
			
		} else { // 이메일이 회원정보와 일치하지 않을때
			result = 0;
		}
		
		// 회원조회 결과값(result)와 임시비밀번호(pass)를 반환해준다
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("result", result);
		modelMap.put("pass", pass);
		
		return modelMap;
	}
	
	/**
	// 이메일 발송 메서드
	@Override
	public void sendEmail(Member member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "2023.dvtest@gmail.com";
		String hostSMTPpwd = "tester2023";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "2023.dvtest@gmail.com";
		String fromName = "코생코사";
		String subject = "코생코사";
		String msg = "비밀번호 찾기";

		if(div.equals("findpw")) {
			subject = "코생코사 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getPass() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		System.out.println("email : " + mail);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}
	**/
}
